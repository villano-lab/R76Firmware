# Migrate to SciSDK library

This updated version of SciCompiler includes the SciSDK library for interfacing with your hardware. 

SciSDK is a modern library compatible with most popular programming languages, designed to act as a middleware between low-level board SDKs and user software.

**Soon, SciCompiler will stop generating custom software support for specific designs and move towards the use of SciSDK. Currently, you can find the legacy generated code in the "library/legacy" folder, but we discourage its use in new projects.**

SciSDK code should not be generated or compiled each time the SciCompiler project is modified.  It uses the RegisterFile.json (found in the "project/library" folder) to detect the IPs in your design and provides easy direct access to each one.

The SciSDK library is completely independent of the board you generated your project for and can manage multiple boards of different models simultaneously.

## Documentation

You can find SciSDK documentation on [github.com documentation](https://nuclearinstruments.github.io/SCISDK/)


## Download

Pre-installed in C:\OpenHardware\SciSDK on Windows. 

For Windows, latest version can be downloaded from [github.com release](https://github.com/NuclearInstruments/SCISDK/releases)


## Linux

At present, the Linux library must be downloaded as source code and compiled. Please refer to the documentation.

The source code is avaliable on [Nuclear Instruments Github SciSDK](https://github.com/NuclearInstruments/SCISDK)
Please note that you must also compile and install all the low-level SDKs for all instruments you want to connect to. SciSDK is only a middleware and needs the SDK to interface with the hardware.

Soon, a repository for Ubuntu, Centos, and Scientific Linux will be available with pre-compiled libraries.

## Python

Once the library is installed on your system(Windows with the installer, linux: `./configure && make && make install`) you can install the library from the official PyPI repository:

```
pip install scisdk
```

## Examples

Several examples are already installed in C:\OpenHardware\SciSDK\examples for Windows.
For Linux, you can find the examples at [GitHub SciSDK Examples](https://github.com/NuclearInstruments/SCISDK/tree/master/examples)


