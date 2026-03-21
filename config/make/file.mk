# ******************
# *** Main Files ***
# ******************

SOURCE_FILE_MAIN_C := ./src/main.c
OBJECT_FILE_MAIN_C := ./build/obj/main.c.o

# ***************************
# *** Static Dependencies ***
# ***************************

LIBRARY_FILE_STATIC_BERKLY   := $(LIBRARY_FOLDER_BERKLY)/libdb-5.3.a
LIBRARY_FILE_STATIC_COBOL    := $(LIBRARY_FOLDER_COBOL)/libcob.a
LIBRARY_FILE_STATIC_GMP      := $(LIBRARY_FOLDER_GMP)/libgmp.a
LIBRARY_FILE_STATIC_LIBZ     := $(LIBRARY_FOLDER_LIBZ)/libz.a
LIBRARY_FILE_STATIC_LZMA     := $(LIBRARY_FOLDER_LZMA)/liblzma.a
LIBRARY_FILE_STATIC_NCURSESW := $(LIBRARY_FOLDER_NCURSESW)/libncursesw.a
LIBRARY_FILE_STATIC_PANELW   := $(LIBRARY_FOLDER_PANELW)/libpanelw.a
LIBRARY_FILE_STATIC_TINFO    := $(LIBRARY_FOLDER_TINFO)/libtinfo.a
LIBRARY_FILE_STATIC_XML2     := $(LIBRARY_FOLDER_XML2)/libxml2.a

# ************************
# *** Shared Libraries ***
# ************************

LIBRARY_FILE_SHARED_C     := libc.so
LIBRARY_FILE_SHARED_M     := libm.so
LIBRARY_FILE_SHARED_CJSON := libcjson.so

# ************************
# *** Static Libraries ***
# ****

# ****************
# *** Binaries ***
# ****************

BINARY_FILE_EXECUTABLE_TEST := $(BUILD_FOLDER_BIN)/test

BINARY_FILE_LIBRARY_STATIC_RDB := librdb.a
BINARY_FILE_LIBRARY_SHARED_RDB := librdb.so

BINARY_FILE_LIBRARY_STATIC_VERSION := librdb.a.1
BINARY_FILE_LIBRARY_SHARED_VERSION := librdb.so.1