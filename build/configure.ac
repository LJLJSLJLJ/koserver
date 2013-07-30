AC_PREREQ([2.59])
AC_INIT([snoxd-koserver], [0.1], [http://github.com/twostars/snoxd-koserver/issues], [snoxd-koserver], [http://github.com/twostars/snoxd-koserver/])

AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([../src/shared/config.h])
AM_INIT_AUTOMAKE([1.10 no-define])

# Initialise libtool
# shared/static
LT_INIT([static])

AC_LANG([C++])
AC_PROG_CXX

# Checking for C++11 (required)
echo "ensuring C++11 is available..."
AX_CXX_COMPILE_STDCXX_11([noext], [mandatory])

# Check for debug flag
AC_ARG_ENABLE([debug],
  [AS_HELP_STRING([--enable-debug],
    [enable debug build, default off])],
  [BUILD_TYPE="DEBUG"],
  [BUILD_TYPE="NDEBUG"])
AC_SUBST([BUILD_TYPE])
AM_CONDITIONAL([DEBUG_BUILD], [test x$BUILD_TYPE = xDEBUG])

# Check for ODBC headers 
AC_CHECK_HEADER([sql.h], [], [AC_MSG_ERROR([Couldn't find sql.h... please setup unixODBC first.])])
AC_CHECK_HEADER([sqlext.h], [], [AC_MSG_ERROR([Couldn't find sqlext.h... please setup unixODBC first.])])
AC_CHECK_HEADER([sqltypes.h], [], [AC_MSG_ERROR([Couldn't find sqltypes.h... please setup unixODBC first.])])

# Get unixODBC headers 
AC_ARG_WITH([unixODBC-headers],
  [AS_HELP_STRING([--with-unixODBC-headers],
    [location of the unixODBC headers, defaults to /usr/local/include])],
  [UNIXODBC_HEADERS="-I$withval"],
  [UNIXODBC_HEADERS='-I/usr/local/include'])
AC_SUBST([UNIXODBC_HEADERS])

# Get unixODBC libraries
AC_ARG_WITH([unixODBC-libs],
  [AS_HELP_STRING([--with-unixODBC-libs],
    [location of the unixODBC libraries])],
  [UNIXODBC_LIBS="-L$withval -lodbc"],
  [UNIXODBC_LIBS='-lodbc'])
AC_SUBST([UNIXODBC_LIBS])

AC_CONFIG_FILES([Makefile])

AC_PROG_INSTALL
AC_OUTPUT
