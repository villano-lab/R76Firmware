//
// Name: KOsocket.cpp
// Author: K.Olchanski
// Description: K.O.'s very own socket object layer
// Date: 11 Aug 1998
//
// $Id: KOsocket.cpp,v 1.2 2003/05/07 00:31:55 olchansk Exp $
//

#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <iostream>

#include "KOsocket.h"

#if defined(__CYGWIN__)

#include <winsock.h>
#undef  ONL_unix
#define ONL_winnt

#elif defined(OS_LINUX)

#define ONL_unix
#undef  ONL_winnt

#include <sys/types.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
// This is needed in order to use NO_DELAY option.
#include <netinet/tcp.h>
#include <errno.h>
#include <netdb.h>
#include <fcntl.h>
#include <stdarg.h>



// have to kludge this for Solaris 5.5.1
#ifndef FIONREAD
#include <sys/filio.h>
#endif
#else
#error Some porting is required...
#endif

////////////////////////////////////////////////////////////
//                                                        //
//              WIN32 compatibility stuff                 //
//                                                        //
////////////////////////////////////////////////////////////

#ifdef ONL_unix
int WSAGetLastError()
{
  return errno;
}
#endif

#ifdef ONL_winnt
class KOsocketInitializer
{
public:
  // the contructor of this class
  // will initialize the socket library
  KOsocketInitializer(); // ctor
};

static KOsocketInitializer gfSocketInitializer;

#include <iostream.h>
KOsocketInitializer::KOsocketInitializer() // ctor
{
  // initialize the WSA Win32 socket library
  static WORD gVersionRequested = MAKEWORD( 2, 0);
  static WSADATA gWsaData;

  cerr << "KOsocketInitializer: Initialize the Win32 Socket library!" << endl;

  int err = WSAStartup(gVersionRequested, &gWsaData);

  if (err != 0)
    {
      cerr << "KOsocketInitializer: Cannot initialize the socket library, WSAStartup error: " << WSAGetLastError() << endl;
      abort();
    }
};
#endif

#ifdef ONL_unix
#include <unistd.h>
#include <netinet/in.h>
typedef int SOCKET;
#define INVALID_SOCKET (-1)
#define BOOL int
#define SOCKET_ERROR (-1)
#define SOCKADDR_IN sockaddr_in
#define LPSOCKADDR sockaddr*
#endif

////////////////////////////////////////////////////////////
//                                                        //
//                 Helper functions                       //
//                                                        //
////////////////////////////////////////////////////////////

std::string KOsprintf(const char* format,...)
{
   const unsigned int kBufsize = 10240;
   
   // if the format string is too long
   // or has no '%' do not call sprintf().

   if ((strlen(format) >= kBufsize)||
       (strchr(format,'%') == 0))
      {
         return format;
      }
   else
      {
         char buf[kBufsize];
         va_list args;
         va_start (args, format);
         vsprintf(buf,format,args);
         va_end (args);
         size_t len = strlen(buf);
         assert(len < kBufsize);
         return buf;
      }
}

////////////////////////////////////////////////////////////
//                                                        //
//                 KOsocketAddr methods                   //
//                                                        //
////////////////////////////////////////////////////////////

KOsocketAddr::KOsocketAddr() // ctor
{
  fProtocol = "???";
  fHostname = "???";
  fPort = 0;
}

std::string KOsocketAddr::toString() const
{
  return KOsprintf("%s/%s:%d",fProtocol.c_str(),fHostname.c_str(),fPort);
}

////////////////////////////////////////////////////////////
//                                                        //
//                 KOsocketBase methods                   //
//                                                        //
////////////////////////////////////////////////////////////

KOsocketBase::KOsocketBase() // ctor
{
  fSocket = 0;
  fError  = 0;
};

KOsocketBase::~KOsocketBase() // dtor
{
  //cerr << "KOsocket::destructor!" << endl;
  if (fSocket != 0)
    {
#if defined(ONL_unix)
      ::close(fSocket);
      fSocket = 0;
#elif defined(ONL_winnt)
      closesocket(fSocket);
      fSocket = 0;
#endif
    }
}

int KOsocketBase::getErrorCode() const
{
  return fError;
};

#ifdef ONL_winnt
typedef struct
{
  int err;
  char *string;
} WinNTerrEntry;

WinNTerrEntry gWinntWSAerrors[] = {
  { 0, "No error"},
  { WSAEWOULDBLOCK,    "WSAEWOULDBLOCK- would block" },
  { WSAECONNABORTED,   "WSAECONNABORTED- connection aborted" },
  { WSAECONNRESET,     "WSAECONNRESET- Connection reset by peer" },
  { WSAETIMEDOUT,      "WSAETIMEDOUT- Timed out" },
  { WSAECONNREFUSED,   "WSAECONNREFUSED- Connection refused" },
  { WSAENOTCONN,       "WSAENOTCONN- Not connected" },
  { WSAESHUTDOWN,      "WSAESHUTDOWN- Socket shutdown" },
  { WSAHOST_NOT_FOUND, "WSA: Host not found" },
  { WSATRY_AGAIN,      "WSA: Try again" },
  { WSANO_RECOVERY,    "WSA: No recovery" },
  { WSANO_DATA,        "WSA: No data" },
  { -1, "see WINSOCK2.H for details"} // has to be the last entry
};

#endif

std::string KOsocketBase::getErrorString() const
{
#if defined(ONL_winnt)
  int i;
  for (i=0; gWinntWSAerrors[i].err >= 0; i++)
    if (gWinntWSAerrors[i].err == fError)
      break;
  return KOsprintf("WSA Error %d (%s)",fError,gWinntWSAerrors[i].string);
#elif defined(ONL_unix)
  return KOsprintf("errno %d (%s)",fError,strerror(errno));
#endif
};

const KOsocketAddr& KOsocketBase::getLocalAddr() const
{
  return fLocalAddr;
}

const KOsocketAddr& KOsocketBase::getRemoteAddr() const
{
  return fRemoteAddr;
}

void KOsocketBase::setSockopt(int opt,int value)
{
  int ret = ::setsockopt(fSocket,SOL_SOCKET,opt,(const char*)&value,sizeof(value));

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket setsockopt() error: " + getErrorString());
    }
}

void KOsocketBase::setReceiveBufferSize(int value)
{
  int opt = SO_RCVBUF;
  int ret = ::setsockopt(fSocket,SOL_SOCKET,opt,(const char*)&value,sizeof(value));

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket setsockopt(SO_RCVBUF) error: " + getErrorString());
    }
}

void KOsocketBase::setSendBufferSize(int value)
{
  int opt = SO_SNDBUF;
  int ret = ::setsockopt(fSocket,SOL_SOCKET,opt,(const char*)&value,sizeof(value));

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket setsockopt(SO_SNDBUF) error: " + getErrorString());
    }
}

void KOsocketBase::setCloseOnExec(bool flag)
{
  int ret = ::fcntl(fSocket,F_SETFD,FD_CLOEXEC);
  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket fcntl(F_SETFD,FD_CLOEXEC) error: " + getErrorString());
    }
}

bool KOsocketBase::getCloseOnExec() const
{
  throw KOsocketException("KOsocketBase::getCloseOnExec() is not implemented");
}

void KOsocketBase::shutdown()
{
#ifdef SD_BOTH
  int arg = SD_BOTH;
#else
  int arg = 2;
#endif
  int ret = ::shutdown(fSocket,arg);

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket shutdown() error: " + getErrorString());
    }
}

////////////////////////////////////////////////////////////
//                                                        //
//               KOserverSocket methods                   //
//                                                        //
////////////////////////////////////////////////////////////

KOserverSocket::KOserverSocket(int iport,int backlog) // ctor
{
  SOCKET ret = ::socket(AF_INET,SOCK_STREAM,0);
  if (ret == INVALID_SOCKET)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket socket(AF_INET,SOCK_STREAM) error: " + getErrorString());
    }

  fSocket = ret;

  BOOL opt = 1;
  int err1 = ::setsockopt(fSocket,SOL_SOCKET, SO_REUSEADDR,(char*)&opt,sizeof(opt));
  if (err1 == SOCKET_ERROR)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket setsockopt(SO_REUSEADDR) error: " + getErrorString());
    }

  SOCKADDR_IN sockAddr;
  memset(&sockAddr,0,sizeof(sockAddr));
  sockAddr.sin_family      = AF_INET;
  sockAddr.sin_port        = htons(iport);
  sockAddr.sin_addr.s_addr = INADDR_ANY;

  int err2 = ::bind(fSocket,(LPSOCKADDR)&sockAddr,sizeof(sockAddr));
  if (err2 == SOCKET_ERROR)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket bind() error: " + getErrorString());
    }

  int err3 = ::listen(fSocket,backlog);
  if (err3 == SOCKET_ERROR)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket listen() error: " + getErrorString());
    }

  fLocalAddr.fProtocol = "tcp";
  fLocalAddr.fHostname = "(local)";
  fLocalAddr.fPort = iport;
};

KOsocket* KOserverSocket::accept()
{
  SOCKET fd;
  SOCKADDR_IN sockAddr;
#if defined(__CYGWIN__)
  int sockAddrLen;
#elif defined(ONL_unix)
  socklen_t sockAddrLen;
#elif defined(ONL_winnt)
  int sockAddrLen;
#endif
  sockAddrLen = sizeof(sockAddr);
  fd = ::accept(fSocket,(LPSOCKADDR)&sockAddr,&sockAddrLen);
  if (fd == INVALID_SOCKET)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket accept(), error: " + getErrorString());
    }

  unsigned int inaddr32 = *(unsigned int*)&sockAddr.sin_addr;
  unsigned char *inaddr = (unsigned char*)&inaddr32;
  // this is on "network" order, MSB
  std::string buf = KOsprintf("%d.%d.%d.%d",inaddr[0],inaddr[1],inaddr[2],inaddr[3]);

#ifdef UNDEF
  sprintf(buf,"%d.%d.%d.%d",
	  sockAddr.sin_addr.S_un.S_un_b.s_b1,
	  sockAddr.sin_addr.S_un.S_un_b.s_b2,
	  sockAddr.sin_addr.S_un.S_un_b.s_b3,
	  sockAddr.sin_addr.S_un.S_un_b.s_b4);
#endif

  KOsocketAddr remoteAddr;

  remoteAddr.fProtocol = "tcp";
  remoteAddr.fHostname = buf;
  remoteAddr.fPort = ntohs(sockAddr.sin_port);

  return new KOsocket(fd,remoteAddr);
};

////////////////////////////////////////////////////////////
//                                                        //
//                  KOsocket methods                      //
//                                                        //
////////////////////////////////////////////////////////////

KOsocket::KOsocket(KOsocketType fd,
		   const KOsocketAddr& remoteAddr) // ctor
{
  fSocket = fd;
  fError  = 0;
  fRemoteAddr = remoteAddr;
  fLocalAddr.fProtocol = "tcp";
  fLocalAddr.fHostname = "(local)";
  fLocalAddr.fPort = 0;
  fTimeout = 0;
}


KOsocket::KOsocket(const std::string& remoteHost,
		   int remotePort) // ctor
{
  SOCKET ret = ::socket(AF_INET,SOCK_STREAM,0);
  if (ret == INVALID_SOCKET)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket socket(AF_INET,SOCK_STREAM) error: " + getErrorString());
    }

  fSocket = ret;


  /* Disable the Nagle (TCP No Delay) algorithm */  
  if(1){
    int flag = 1;
    int ret2 = setsockopt( fSocket, IPPROTO_TCP, TCP_NODELAY, (char *)&flag, sizeof(flag) );
    if (ret2 == -1) {
      printf("Couldn't setsockopt(TCP_NODELAY)\n");
      exit( EXIT_FAILURE );    
    }
  }


  fTimeout = 0;

  fRemoteAddr.fProtocol = "tcp";
  fRemoteAddr.fHostname = remoteHost;
  fRemoteAddr.fPort     = remotePort;

  fLocalAddr.fProtocol = "tcp";
  fLocalAddr.fHostname = "(local)";
  fLocalAddr.fPort     = 0;

  struct hostent *eptr = gethostbyname(remoteHost.c_str());
  if (!eptr)
    {
      fError = WSAGetLastError();
      throw KOsocketException(KOsprintf("Cannot lookup hostname [%s], gethostbyname() error: %s",remoteHost.c_str(),getErrorString().c_str()));
    }

  unsigned int ipAddr = ntohl(*(unsigned int*)*(eptr->h_addr_list));

  SOCKADDR_IN sockAddr;
  memset(&sockAddr,0,sizeof(sockAddr));
  sockAddr.sin_family = AF_INET;
  sockAddr.sin_port = htons(remotePort);
  sockAddr.sin_addr.s_addr = htonl(ipAddr);

  int err2 = ::connect(fSocket,(LPSOCKADDR)&sockAddr,sizeof(sockAddr));
  if (err2 == SOCKET_ERROR)
    {
      fError = WSAGetLastError();

      throw KOsocketException(KOsprintf("Socket connect() to %s, error: %s",
                                    fRemoteAddr.toString().c_str(),
                                    getErrorString().c_str()));
    }
};

int KOsocket::writeSomeBytes(const char* data,int byteCount)
{
  int ret = ::send(fSocket,data,byteCount,0);

  if (ret < 0)
    {
      fError = WSAGetLastError();
     throw KOsocketException("Socket send() error: " + getErrorString());
    }

  return ret;
}

void KOsocket::write(const char* data,int byteCount)
{
  int dptr = 0;
  int toSend = byteCount;

  while (toSend != 0)
    {
      int ret = writeSomeBytes(&data[dptr],toSend);
      
      if (ret == 0)
	{
	  fError = WSAGetLastError();
	  throw KOsocketException("Socket unexpected write error: " + getErrorString());
	}
      
      dptr += ret;
      toSend -= ret;
    }
}

int KOsocket::read(char* buffer,int bufferSize)
{
  int ret = ::recv(fSocket,buffer,bufferSize,0);

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket recv() error: " + getErrorString());
    }

  return ret;
}

void KOsocket::readFully(char* buffer,int byteCount)
{
  int dptr = 0;
  int toRecv = byteCount;

#if defined(ONL_unix)||defined(ONL_winnt)
  timeval tv;
  tv.tv_sec = fTimeout/1000;
  tv.tv_usec = (fTimeout%1000)*1000;
#else
#error Here!
#endif

  int flag = 1;

  while (toRecv != 0)
    {
#if defined(ONL_unix)||defined(ONL_winnt)
      if (fTimeout != 0)
	{
	  if (flag)
	    {
	      tv.tv_sec = fTimeout/1000;
	      tv.tv_usec = (fTimeout%1000)*1000;
	    }

	  fd_set fdset;
	  FD_ZERO(&fdset);
	  FD_SET(fSocket,&fdset);
	  int n = ::select(fSocket+1,&fdset,0,0,&tv);

	  if (0)
	    printf("timeout is %d, socket is %d, n is %d, fdset is %d, tv is %d %d, errno %d\n",
		   fTimeout,fSocket,n,FD_ISSET(fSocket,&fdset),(int)tv.tv_sec,(int)tv.tv_usec,WSAGetLastError());

          if (n < 0)
            {
	      flag = 0;
              fError = WSAGetLastError();
              if (fError == EAGAIN)
                 continue;
              if (fError == EINTR)
                 continue;
	      //std::string errstr = getErrorString();
	      //std::cout << errstr << std::endl;
	      throw KOsocketException("readFully: select() error: " + getErrorString());
            }

	  if ((n == 0)||(!FD_ISSET(fSocket,&fdset)))
	    {
	      std::cout << "Oser debugging notes timeout " << n << std::endl;
	      throw KOsocketException("Read timeout");
	    }
          //printf("n %d, isset %d\n", n, FD_ISSET(fSocket,&fdset));
	  flag = 1;
	}
#else
#error Here!
#endif


      int ret = read(&buffer[dptr],toRecv);

      if (ret == 0)
	{
	  if (dptr == 0) // we did not receive a single byte yet
	    throw KOsocketException("Connection was closed");

	  // otherwise, we got a connection reset in the middle
	  // of the data, so consider it an error
	  // and throw an exception.

	  fError = 0;
	  throw KOsocketException("Connection was closed unexpectedly");
	}
      
      dptr += ret;
      toRecv -= ret;
    }
}

void KOsocket::setSoTimeout(int mstimeout)
{
  fTimeout = mstimeout;
}

int KOsocket::available()
{
#if defined(ONL_winnt)
  unsigned long value = 0;
  int ret = ::ioctlsocket(fSocket,FIONREAD,&value);
#elif defined(ONL_unix)
  int value = 0;
  int ret = ::ioctl(fSocket,FIONREAD,&value);
#endif

  if (ret < 0)
    {
      fError = WSAGetLastError();
      throw KOsocketException("Socket ioctl(FIONREAD) error: " + getErrorString());
    }

  return value;
}

// end file
