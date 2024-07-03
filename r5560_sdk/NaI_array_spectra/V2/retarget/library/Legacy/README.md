
# R5560 SciCompiler Library 
This is a C++ library automatic generated for your project

This library compile in windows with Visual C++ (2012 or above) and il linux using the standard gcc buildchain.
This library depends only from R5560_SDKLib
The compiled version for Windows x86/Release is automatically copied (as example) with this package 

Windows x64 (Debug/Release), Windows x86 (Debug) and linux libR5660.so versions can be downloaded from our github the precompiled release
https://github.com/NuclearInstruments/r5560_sdk/releases/

We strogly raccomand to compile from source code the linux version
https://github.com/NuclearInstruments/r5560_sdk

## Linux Compiling

### Pre Requisites

R5560 SDK requires GCC build chain and install R5560SDK library in your system
- compile the R5560SDK an then install it in your system
 Install the library in /usr/local/lib
```bash
sudo cp libr5560.so.1.0.0 /usr/local/lib
cd /usr/local/lib
sudo ln -s libr5560.so.1.0.0 libr5560.so
```
Reload Linux library database
```bash
sudo ldconfig
```


### Compile and install library

Just enter make in console

 Install the library in /usr/local/lib
```bash
make

cd linux
sudo cp libNAME_OF_YOUR_PROJECT /usr/local/lib
sudo ldconfig
```



