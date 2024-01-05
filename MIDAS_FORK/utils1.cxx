#include "utils1.h"


extern char* frontend_name;
extern HNDLE hDB;



int odbReadAny(const char*name,int index,int tid,void* value,int valueLength)
{
  int status;
  int size = rpc_tid_size(tid);
  HNDLE hdir = 0;
  HNDLE hkey;

  if (valueLength > 0)
    size = valueLength;

  status = db_find_key (hDB, hdir, (char*)name, &hkey);

  if (status == SUCCESS) // Things to do if the key exists
    {
	  // First check if array is large enough, and if not expand it
	  if (index+1 > odbReadArraySize(name)) {
	    cm_msg(MERROR, frontend_name, "Array '%s\' isn't large enough, so attempting to resize", name);
	      int resizestatus = odbResizeArray(name, tid, index+1);
	      if (resizestatus == index+1) {
		int findstatus = db_find_key (hDB, hdir, (char*)name, &hkey);
		if (findstatus != SUCCESS)
		  {
		    cm_msg(MERROR, frontend_name, "Cannot locate \'%s\', db_find_key() status %d", name, status);
		    return -1;
		  }
		int setstatus = 
		  db_set_data_index(hDB, hkey, value, size, index, tid);
		if (setstatus != SUCCESS)
		  {
		    cm_msg(MERROR, frontend_name, "Cannot write \'%s\'[%d] of type %d to odb, db_set_data_index() status %d", name, index, tid, setstatus);
		    return -1;
		  }
		return 0; // return 0 if we successfully set the key
	      } else 	 // If we failed to resize the array
		{
		cm_msg(MERROR, frontend_name, "Failed to resize array \'%s", name);
		return -1;
		}; 
	  } else{
	    // Array size is sufficient, so try to read value from
	    // ODB, else return error condition
	    
	    status = db_get_data_index(hDB, hkey, value, &size, index, tid);
	    if (status != SUCCESS)
	      {
		cm_msg(MERROR, frontend_name, "Cannot read \'%s\'[%d] of type %d from odb, db_get_data_index() status %d", name, index, tid, status);
		return -1;
	      }
	  } // end of things to do if array wasn't too small.

      return 0;
    }
  else if (status == DB_NO_KEY)
    {
      cm_msg(MINFO, frontend_name, "Creating \'%s\'[%d] of type %d", name, index+1, tid);

      status = db_create_key(hDB, hdir, (char*)name, tid);
      if (status != SUCCESS)
        {
          cm_msg (MERROR, frontend_name, "Cannot create \'%s\' of type %d, db_create_key() status %d", name, tid, status);
          return -1;
        }

      status = db_find_key (hDB, hdir, (char*)name, &hkey);
      if (status != SUCCESS)
        {
          cm_msg(MERROR, frontend_name, "Cannot create \'%s\', db_find_key() status %d", name, status);
          return -1;
        }


      status = db_set_data_index(hDB, hkey, value, size, index, tid);
      if (status != SUCCESS)
        {
          cm_msg(MERROR, frontend_name, "Cannot write \'%s\'[%d] of type %d to odb, db_set_data_index() status %d", name, index, tid, status);
          return -1;
        }

      return 0;
    }
  else
    {
      cm_msg(MERROR, frontend_name, "Cannot read \'%s\'[%d] from odb, db_find_key() status %d", name, index, status);
      return -1;
    }
}

int odbReadInt(const char*name,int index,int defaultValue)
{
  int value = defaultValue;
  if (odbReadAny(name,index,TID_INT,&value) == 0)
    return value;
  else
    return defaultValue;
}

uint32_t odbReadUint32(const char*name,int index,uint32_t defaultValue)
{
  uint32_t value = defaultValue;
  if (odbReadAny(name,index,TID_DWORD,&value) == 0)
    return value;
  else
    return defaultValue;
}

double odbReadDouble(const char*name,int index,double defaultValue)
{
  double value = defaultValue;
  if (odbReadAny(name,index,TID_DOUBLE,&value) == 0)
    return value;
  else
    return defaultValue;
}

float odbReadFloat(const char*name,int index,double defaultValue)
{
  float value = defaultValue;
  if (odbReadAny(name,index,TID_FLOAT,&value) == 0)
    return value;
  else
    return defaultValue;
}

bool odbReadBool(const char*name, int index, bool defaultValue)
{
  uint32_t value = defaultValue;
  if (odbReadAny(name,index,TID_BOOL,&value) == 0)
    return value;
  else
    return defaultValue;
}

const char* odbReadString(const char*name,int index,const char* defaultValue,int stringLength)
{
  const int maxStringLength = 256;
  static char buf[maxStringLength];
  buf[0] = 0;
  if (defaultValue)
    strlcpy(buf, defaultValue, maxStringLength);
  assert(stringLength < maxStringLength);
  if (odbReadAny(name, index, TID_STRING, buf, stringLength) == 0)
    return buf;
  else
    return defaultValue;
}

int odbReadArraySize(const char*name)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;
  KEY key;

  status = db_find_key (hDB, hdir, (char*)name, &hkey);
  if (status != SUCCESS)
    return 0;

  status = db_get_key(hDB, hkey, &key);
  if (status != SUCCESS)
    return 0;

  return key.num_values;
}

int odbResizeArray(const char*name, int tid, int size)
{
   int oldSize = odbReadArraySize(name);

   if (oldSize >= size)
      return oldSize;

   int status;
   HNDLE hkey;
   HNDLE hdir = 0;

   status = db_find_key (hDB, hdir, (char*)name, &hkey);
   if (status != SUCCESS)
      {
         cm_msg(MINFO, frontend_name, "Creating \'%s\'[%d] of type %d", name, size, tid);

         status = db_create_key(hDB, hdir, (char*)name, tid);
         if (status != SUCCESS)
            {
               cm_msg (MERROR, frontend_name, "Cannot create \'%s\' of type %d, db_create_key() status %d", name, tid, status);
               return -1;
            }
         
         status = db_find_key (hDB, hdir, (char*)name, &hkey);
         if (status != SUCCESS)
            {
               cm_msg(MERROR, frontend_name, "Cannot create \'%s\', db_find_key() status %d", name, status);
               return -1;
            }
      }
   
   cm_msg(MINFO, frontend_name, "Resizing \'%s\'[%d] of type %d, old size %d", name, size, tid, oldSize);

   status = db_set_num_values(hDB, hkey, size);
   if (status != SUCCESS)
      {
         cm_msg(MERROR, frontend_name, "Cannot resize \'%s\'[%d] of type %d, db_set_num_values() status %d", name, size, tid, status);
         return -1;
      }
   
   return size;
}

int odbWriteInt(const char*name, int index, int value)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key (hDB, hdir, name, &hkey);
  if (status == SUCCESS)
    {
      int size = 4;
      status = db_set_data_index(hDB, hkey, &value, size, index, TID_INT);
      if (status == SUCCESS)
	return 0;
    }

  return -1;
}

int odbWriteBool(const char*name, int index, BOOL value)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key (hDB, hdir, (char*)name, &hkey);
  if (status == SUCCESS)
    {
      int size = sizeof(TID_BOOL);
      status = db_set_data_index(hDB, hkey, &value, size, index, TID_BOOL);
      if (status == SUCCESS)
	return 0;
    }

  return -1;
}

int odbWriteDouble(const char*name, int index, double value)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key (hDB, hdir, name, &hkey);

  if (status == SUCCESS)
    {
      int size = sizeof(double);
      status = db_set_data_index(hDB, hkey, &value, size, index, TID_DOUBLE);
      if (status == SUCCESS)
	return 0;
    }

  return -1;
}


int odbWriteDword(const char*name, int index, DWORD value)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key (hDB, hdir, name, &hkey);

  if (status == SUCCESS)
    {
      int size = sizeof(DWORD);
      status = db_set_data_index(hDB, hkey, &value, size, index, TID_DWORD);
      if (status == SUCCESS)
	return 0;
    }

  return -1;
}

int odbWriteFloat(const char*name, int index, float value)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key (hDB, hdir, name, &hkey);

  if (status == SUCCESS)
    {
      int size = sizeof(float);
      status = db_set_data_index(hDB, hkey, &value, size, index, TID_FLOAT);
      if (status == SUCCESS)
	return 0;
    }

  return -1;
}

int odbWriteString(const char*name, const char* string, int StringLength)
{
  int status;
  HNDLE hdir = 0;
  HNDLE hkey;

  status = db_find_key(hDB, hdir, name, &hkey);
  if (status == SUCCESS)
    {
      status = db_set_data(hDB, hkey, string, StringLength, 1, TID_STRING);
      if (status == SUCCESS)
	return SUCCESS;
    }

  return status;
}







// end
