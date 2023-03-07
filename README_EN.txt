* README_EN.txt
* 2023.03.07
* external-tools--cmake

1. DESCRIPTION
2. SOURCES
2.1. Source files
2.2. Download links
3. EXTERNALS
4. TESTS
5. AUTHOR

-------------------------------------------------------------------------------
1. DESCRIPTION
-------------------------------------------------------------------------------
Different cmake command line binary implementations downloaded from different
sources. Collected together for testing purposes.

-------------------------------------------------------------------------------
2. SOURCES
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
2.1. Source files
-------------------------------------------------------------------------------
https://gitlab.kitware.com/cmake/cmake
https://cmake.org/files/

-------------------------------------------------------------------------------
2.2. Download links
-------------------------------------------------------------------------------
* Kitware:
  https://cmake.org/download/

-------------------------------------------------------------------------------
3. EXTERNALS
-------------------------------------------------------------------------------
To checkout externals you must use the
[vcstool](https://github.com/dirk-thomas/vcstool) python module.

NOTE:
  To install the module from the git repository:

  >
  python -m pip install git+https://github.com/dirk-thomas/vcstool

-------------------------------------------------------------------------------
4. TESTS
-------------------------------------------------------------------------------
The directory does include only simple tests just to ensure that the
executables can be invoked.

The full tests are part of another projects:
* `tacklelib/cmake_tests` or `tacklelib--cmake_tests`

-------------------------------------------------------------------------------
5. AUTHOR
-------------------------------------------------------------------------------
andry at inbox dot ru
