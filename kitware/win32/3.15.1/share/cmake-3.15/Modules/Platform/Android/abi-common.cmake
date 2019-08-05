string(APPEND _ANDROID_ABI_INIT_CFLAGS
  " -funwind-tables"
  " -no-canonical-prefixes"
  )

if(CMAKE_ANDROID_NDK AND NOT CMAKE_ANDROID_NDK_DEPRECATED_HEADERS)
  string(APPEND _ANDROID_ABI_INIT_CFLAGS " -D__ANDROID_API__=${CMAKE_SYSTEM_VERSION}")
endif()

if(NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE
    AND NOT CMAKE_SYSTEM_VERSION VERSION_LESS 16)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

cmake_policy(GET CMP0083 _CMP0083)
if(_CMP0083 STREQUAL NEW)
  # PIE Flags are managed by compiler configuration files
  if(CMAKE_SYSTEM_VERSION VERSION_GREATER_EQUAL 16)
    # ensure PIE flags are passed to the linker
    set(CMAKE_C_LINK_PIE_SUPPORTED YES CACHE INTERNAL "PIE (C)")
    set(CMAKE_CXX_LINK_PIE_SUPPORTED YES CACHE INTERNAL "PIE (CXX)")
    if(CMAKE_SYSTEM_VERSION VERSION_GREATER_EQUAL 21)
      # no PIE executable are no longer supported
      set(CMAKE_C_LINK_NO_PIE_SUPPORTED NO CACHE INTERNAL "NO_PIE (C)")
      set(CMAKE_CXX_LINK_NO_PIE_SUPPORTED NO CACHE INTERNAL "NO_PIE (CXX)")
    endif()
  endif()
else()
  if(CMAKE_POSITION_INDEPENDENT_CODE)
    string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -fPIE -pie")
  endif()
endif()
unset(_CMP0083)

string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -Wl,--gc-sections")

if(NOT _ANDROID_ABI_INIT_EXE_LDFLAGS_NO_nocopyreloc)
  string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -Wl,-z,nocopyreloc")
endif()
