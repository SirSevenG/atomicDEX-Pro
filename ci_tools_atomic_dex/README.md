# AtomicDEX Pro alpha build instructions

## Prerequisites

- Visual Studio 2019 (Windows) with [Desktop development with C++](https://docs.microsoft.com/en-gb/cpp/build/vscpp-step-0-installation?view=vs-2019).
- Clang C++ 17 compiler (clang-8 minimum)
    - on macOS Catalina, Apple Clang 11.0 is picked by default 
- CMake 3.14 minimum (https://cmake.org/download/)

## Install dependencies

### Install QT

Follow the [QT installation (5.14) instructions](https://www.qt.io/download). 


### Install Windows dependencies

In your powershell (as admin) execute: 

```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop install nim --global
scoop install llvm --global
scoop install ninja --global
scoop install cmake --global
scoop install git --global
```

- next add a `QT_INSTALL_CMAKE_PATH` environment variable pointing to the msvc_2017x64 location

e.g.: `set QT_INSTALL_CMAKE_PATH "C:\Qt\5.14.1\msvc2017_64"`


### Install macOS dependencies

Ensure you have [brew](https://brew.sh) and the macOS [command line tools](https://developer.apple.com/downloads) installed.

```shell
brew install nim cmake ninja git gcc
```

Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profile:
 * `QT_INSTALL_CMAKE_PATH` equal to the CMake QT path
 * `QT_ROOT` equal to the QT root installation folder


e.g.:
```bash
export QT_INSTALL_CMAKE_PATH=/Users/SatoshiNakamoto/Qt/5.14.0/clang_64/lib/cmake
export QT_ROOT=/Users/SatoshiNakamoto/Qt/5.14.0
```

### Install Linux dependencies

In your terminal (shell,...) execute:

```shell
sudo apt-get install -y ninja-build cmake git

curl https://nim-lang.org/choosenim/init.sh -sSf | sh

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 9

git clone https://github.com/KomodoPlatform/libwally-core.git
cd libwally-core
./tools/autogen.sh
./configure --disable-shared
sudo make -j2 install
```

Use the most recently installed `clang` version:

```
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-9 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-9 100
```


Add the following environment variables to your `~/.bashrc` or `~/.zshrc` profiles:
 * `QT_INSTALL_CMAKE_PATH` equal to the CMake QT path
 * `QT_ROOT` equal to the QT root installation folder

e.g.:
```bash
export QT_INSTALL_CMAKE_PATH=~/Qt/5.14.0/gcc/lib/cmake
export QT_ROOT=~/Qt/5.14.0
```

## Build AtomicDEX Pro 

### Windows

In your x64 Visual Studio command prompt, from within the `ci_tools_atomic_dex` folder, type:

```bash
nimble build
./ci_tools_atomic_dex.exe build release
./ci_tools_atomic_dex.exe build debug
```

### macOS & Linux

In your command line, from within the `ci_tools_atomic_dex`, run:

```bash
nimble build
./ci_tools_atomic_dex build debug
./ci_tools_atomic_dex build release
```

## Bundle AtomicDEX Pro

### Windows

In your x64 Visual Studio command prompt, from within the `ci_tools_atomic_dex` folder, type:

```
nimble build
ci_tools_atomic_dex.exe build release
ci_tools_atomic_dex.exe bundle release
ci_tools_atomic_dex.exe build debug
ci_tools_atomic_dex.exe bundle debug
```

### OSX

In your command line, from within the `ci_tools_atomic_dex`, run:

```
nimble build
./ci_tools_atomic_dex bundle release
./ci_tools_atomic_dex bundle debug
```


