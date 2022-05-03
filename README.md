# Dart-Ctags
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![image](https://user-images.githubusercontent.com/54878755/166392857-0ea4c753-e811-4e5d-bb32-ac7b19d787d3.png)
## What it is

By Dart, Generate Ctags support for Vim [Tagbar](https://github.com/preservim/tagbar).

generated Ctags index file contains scope and access information about classes' widget method and so on.

Enjoy!

## Requirement

* [NeoVim](https://neovim.io/)
* [Tagbar](https://github.com/preservim/tagbar)
* [Flutter](https://flutter.dev)

## Installation
```dart
git clone https://github.com/yoehwan/dart_ctags.git
cd dart_ctags
dart pub global activate -s path .
```
## Usage
```
Usage:
        dart_ctags [Options] [File(s)].

Available Options:

-h, --help             Show help
-l, --line-numbers     Add Line Number
-o, --output=<File>    Output file
```