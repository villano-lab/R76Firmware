//
// Name: KOsocket.h
// Description: K.O.'s very own socket library
// Author: K.Olchanski
// Date: 11 Aug 1998
//
// $Id: KOsocket.h,v 1.2 2003/05/07 00:31:55 olchansk Exp $
//

#ifndef KOsocketH
#define KOsocketH

#include <string>
#include <stdlib.h>

typedef unsigned int KOsocketType;

class KOsocketException
{
public:
   KOsocketException(const std::string& s) : message(s) { };
   const char* toString() const { return message.c_str(); };
private:
   std::string message;
};

class KOsocketAddr
{
public: // public data members
  std::string fProtocol;
  std::string fHostname;
  int      fPort;

public: // public methods
  KOsocketAddr(); // ctor
  std::string toString() const;

private: // private data members
};

class KOsocketBase
{
public:
  KOsocketBase();          // ctor
  virtual ~KOsocketBase(); // dtor

  // socket operations
  void setSockopt(int opt,int value);

  // set the SO_RCVBUF option
  void setReceiveBufferSize(int value);

  // set the SO_SNDBUF option
  void setSendBufferSize(int value);

  // set or clear close-on-exec flag
  void setCloseOnExec(bool flag);

  // read the close-on-exec flag
  bool getCloseOnExec() const;

  // socket shutdown
  void shutdown();

  // socket error reporting
  int         getErrorCode() const;
  std::string getErrorString() const;

  // socket information reporting
  const KOsocketAddr& getLocalAddr()  const;
  const KOsocketAddr& getRemoteAddr() const;

protected:
  KOsocketAddr fLocalAddr;
  KOsocketAddr fRemoteAddr;
  int          fError;
  KOsocketType fSocket;

private: // hide the assignment and copy constructor operators
  KOsocketBase(const KOsocketBase&s) { abort(); };
  KOsocketBase& operator=(const KOsocketBase&s) { abort(); return *this; };
};

class KOsocket;

class KOserverSocket
: public KOsocketBase
{
 public: // public methods
  
  // create listener socket
  KOserverSocket(int iport,int backlog = 1); // ctor
  
  // accept a connection
  KOsocket* accept();
  
 private:
  KOserverSocket(const KOserverSocket&s) { abort(); };
};

class KOsocket
: public KOsocketBase
{
  friend class KOserverSocket;

 public:
  // open a connection to remote host
  KOsocket(const std::string& remoteHost,
	   int remotePort); // ctor

  // send as many bytes as socket send() would send
  int writeSomeBytes(const char*buffer,int bufferSize);

  // Java-style write()
  void write(const char*buffer,int bufferSize);

  // Java-style read()
  int read(char*buffer,int bufferSize);

  // Java-style setSoTimeout()
  void setSoTimeout(int mstimeout);

  // Java-style readFully(), throws exception if failure.
  void readFully(char*buffer,int bufferSize);

  // Java-style "java.net.Socket->InputStream.available()"
  int available();

 private:
  int fTimeout; // in msec

  // these constructors are used
  // by KOserverSocket::accept().
  KOsocket(KOsocketType fd,
	   const KOsocketAddr& remoteAddr); // ctor
};

#endif
// end file
