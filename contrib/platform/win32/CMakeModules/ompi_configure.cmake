#
# Copyright (c) 2007-2010 High Performance Computing Center Stuttgart, 
#                         University of Stuttgart.  All rights reserved.
# Copyright (c) 2008      The University of Tennessee and The University
#                         of Tennessee Research Foundation.  All rights
#                         reserved.
# $COPYRIGHT$
# 
# Additional copyrights may follow
# 
# $HEADER$
#


INCLUDE (CheckIncludeFileCXX)
INCLUDE (CheckIncludeFile)
INCLUDE (CheckFunctionExists)
INCLUDE (CheckSymbolExists)
INCLUDE (CheckLibraryExists)
INCLUDE (CheckTypeSize)
INCLUDE (CheckStructHasMember)
INCLUDE (CheckCXXSourceCompiles)
INCLUDE (CheckCSourceCompiles)
INCLUDE (ompi_define)
INCLUDE (ompi_base_checks)
INCLUDE (opal_functions)
INCLUDE (get_c_alignment)
INCLUDE (check_c_type_exists)
INCLUDE (check_c_inline)
INCLUDE (check_bool)

OPTION(OPAL_CONFIG_REGEN "Whether we want to regenerate the configure template file." OFF)

IF(${OPAL_CONFIG_REGEN} STREQUAL "ON")
  SET(WRITE_CONFIG_DONE FALSE CACHE INTERNAL "Whether to regenerate configure template.")
ENDIF(${OPAL_CONFIG_REGEN} STREQUAL "ON")

IF(NOT WRITE_CONFIG_DONE)
  FILE(REMOVE ${OpenMPI_BINARY_DIR}/opal/include/opal_config.h.cmake)
  FILE(APPEND ${OpenMPI_BINARY_DIR}/opal/include/opal_config.h.cmake
    "/* opal/include/opal_config.h.cmake.  Generated by CMake.  */

/* -*- c -*-
 *
 * Copyright (c) 2004-2005 The Trustees of Indiana University.
 *                         All rights reserved.
 * Copyright (c) 2004-2005 The Trustees of the University of Tennessee.
 *                         All rights reserved.
 * Copyright (c) 2004-2005 High Performance Computing Center Stuttgart, 
 *                         University of Stuttgart.  All rights reserved.
 * Copyright (c) 2004-2005 The Regents of the University of California.
 *                         All rights reserved.
 * $COPYRIGHT$
 * 
 * Additional copyrights may follow
 * 
 * $HEADER$
 *
 * Function: - OS, CPU and compiler dependent configuration 
 */

#ifndef OPAL_CONFIG_H
#define OPAL_CONFIG_H
\n\n
")
ENDIF(NOT WRITE_CONFIG_DONE)


OMPI_DEF(PACKAGE_NAME "Open MPI" "Define to the full name of this package." 1 1)

OMPI_DEF(PACKAGE_TARNAME "openmpi" "Define to the one symbol short name of this package." 1 1)

OMPI_DEF(OPAL_PACKAGE_STRING "Open MPI $ENV{USERNAME}@$ENV{COMPUTERNAME} Distribution" "Package/branding string for Open MPI" 1 1)

OMPI_DEF(PACKAGE_BUGREPORT "http://www.open-mpi.org/community/help/" "Define to the address where bug reports for this package should be sent." 1 1)

OMPI_DEF(OMPI_CONFIGURE_HOST $ENV{COMPUTERNAME} "Host on which configuration has been done." 1 1)

OMPI_DEF(OMPI_CONFIGURE_USER $ENV{USERNAME} "User who has done the configuration." 1 1)

OMPI_DEF(OMPI_BUILD_USER $ENV{USERNAME} "User who has built the package." 1 1)

OMPI_DEF(OMPI_BUILD_HOST $ENV{COMPUTERNAME} "Host on which the package has been built." 1 1)

OMPI_DEF(OPAL_ARCH "${CMAKE_SYSTEM_PROCESSOR} ${CMAKE_SYSTEM}" "OMPI architecture string" 1 1)


INCLUDE(ompi_get_version)

OMPI_DEF(OMPI_RELEASE_DATE ${RELEASE_DATE} "Release date of the package" 1 1)

OMPI_DEF(OPAL_RELEASE_DATE ${RELEASE_DATE} "Release date of the package" 1 1)

OMPI_DEF(ORTE_RELEASE_DATE ${RELEASE_DATE} "Release date of the package" 1 1)

OMPI_DEF(PACKAGE_VERSION ${OPAL_VERSION} "Define to the version of this package." 1 1)

OMPI_DEF(PACKAGE_STRING "Open MPI ${PACKAGE_VERSION}" "Define to the full name and version of this package." 1 1)


# Get current time and date.
EXECUTE_PROCESS(COMMAND cmd /C time /t
                OUTPUT_VARIABLE    CURRENT_TIME)

EXECUTE_PROCESS(COMMAND cmd /C date /t
                OUTPUT_VARIABLE    CURRENT_DATE)

STRING (REPLACE "\n" "" CURRENT_TIME ${CURRENT_TIME})
STRING (REPLACE "\n" "" CURRENT_DATE ${CURRENT_DATE})
SET (OMPI_CONFIGURE_DATE "${CURRENT_TIME} ${CURRENT_DATE}" CACHE INTERNAL "OMPI_CONFIGURE_DATE")
SET (OMPI_BUILD_DATE "${CURRENT_TIME} ${CURRENT_DATE}" CACHE INTERNAL "OMPI_BUILD_DATE")

OMPI_DEF(OMPI_CONFIGURE_DATE "${CURRENT_TIME} ${CURRENT_DATE}" "Configuration date." 1 1)
OMPI_DEF(OMPI_BUILD_DATE "${CURRENT_TIME} ${CURRENT_DATE}" "Build date." 1 1)

OMPI_DEF(OMPI_BUILD_CFLAGS "/Od /Gm /EHsc /RTC1 /MDd" "C flags" 1 1)


SET(OMPI_BUILD_CPPFLAGS "\"-I${OpenMPI_SOURCE_DIR}/
  -I${OpenMPI_SOURCE_DIR}/opal
  -I${OpenMPI_SOURCE_DIR}/opal/include
  -I${OpenMPI_SOURCE_DIR}/ompi
  -I${OpenMPI_SOURCE_DIR}/ompi/include
  -I${OpenMPI_SOURCE_DIR}/orte
  -I${OpenMPI_SOURCE_DIR}/orte/include
  -I${OpenMPI_BINARY_DIR}/
  -I${OpenMPI_BINARY_DIR}/opal
  -I${OpenMPI_BINARY_DIR}/opal/include
  -I${OpenMPI_BINARY_DIR}/ompi
  -I${OpenMPI_BINARY_DIR}/ompi/include
  -I${OpenMPI_BINARY_DIR}/orte
  -I${OpenMPI_BINARY_DIR}/orte/include
  -I${OpenMPI_SOURCE_DIR}/contrib/platform/win32\"")


OMPI_DEF(OMPI_BUILD_CXXFLAGS "/Od /Gm /EHsc /RTC1 /MDd" "C++ flags" 1 1)

SET(OMPI_BUILD_CXXCPPFLAGS ${OMPI_BUILD_CPPFLAGS})

OMPI_DEF(OMPI_BUILD_FFLAGS " " "F77 flags." 1 1)

OMPI_DEF(OMPI_BUILD_FCFLAGS " " "F90 flags." 1 1)

OMPI_DEF(OMPI_BUILD_LDFLAGS " " "LD flags." 1 1)

OMPI_DEF(OMPI_BUILD_LIBS " " "Link libraries." 1 1)

OMPI_DEF(OMPI_F90_BUILD_SIZE "small" "F90 build size." 1 1)

OMPI_DEF(OMPI_BTL_SM_HAVE_KNEM 0 "If btl sm has knem." 0 1)

IF(WIN32 AND MSVC)
  INCLUDE(ompi_check_Microsoft)
  OMPI_DEF(COMPILER_FAMILYNAME MICROSOFT "Compiler family name" 1 1)
  OMPI_DEF(COMPILER_VERSION ${MSVC_VERSION} "Compiler version" 0 1)
  OMPI_DEF(OPAL_BUILD_PLATFORM_COMPILER_FAMILYID 14 "Compiler family ID" 0 1)
  OMPI_DEF(OPAL_BUILD_PLATFORM_COMPILER_FAMILYNAME ${COMPILER_FAMILYNAME} "Compiler family name" 0 1)
  OMPI_DEF(OPAL_BUILD_PLATFORM_COMPILER_VERSION_STR ${MSVC_VERSION} "Compiler version" 0 1)
ENDIF(WIN32 AND MSVC)


###################################################################
#                              Options                            #
###################################################################

OPAL_WITH_OPTION_MIN_MAX_VALUE(processor_name 256 16 1024)

OPAL_WITH_OPTION_MIN_MAX_VALUE(error_string 256 64 1024)

OPAL_WITH_OPTION_MIN_MAX_VALUE(object_name 64 64 256)

OPAL_WITH_OPTION_MIN_MAX_VALUE(info_key 36 34 255)

OPAL_WITH_OPTION_MIN_MAX_VALUE(info_val 256 32 1024)

OPAL_WITH_OPTION_MIN_MAX_VALUE(port_name 1024 255 2048)

OPAL_WITH_OPTION_MIN_MAX_VALUE(datarep_string 128 64 256)

OMPI_DEF_CACHE_VAR(OMPI_EXT_COMPONENTS Example STRING "Specify user defined MPI Extended Interface Components. (not implemented on Windows)" 1 1)

OMPI_DEF_OPT(MCA_mtl_DIRECT_CALL "Whether mtl should use direct calls instead of components." OFF)

OMPI_DEF_OPT(MCA_pml_DIRECT_CALL "Whether pml should use direct calls instead of components." OFF)

OMPI_DEF_OPT(MPI_PARAM_CHECK "Whether we want to check MPI parameters always, never, or decide at run-time." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_DEBUG "Whether we want developer-level debugging code or not." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_HETEROGENEOUS_SUPPORT "Enable features required for heterogeneous support." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_MEM_DEBUG "Whether we want the memory debug or not." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_MEM_PROFILE "Whether we want the memory profiling or not." OFF)

OMPI_DEF_OPT(OMPI_ENABLE_MPI_PROFILING "Whether we want MPI profiling or not." ON)

OMPI_DEF_OPT(OPAL_ENABLE_MPI_THREADS "Whether we should enable support for multiple user threads." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_PROGRESS_THREADS "Whether we should use progress threads rather than polling." OFF)

OMPI_DEF_OPT(OPAL_ENABLE_PTY_SUPPORT "Whether we should use progress threads rather than polling." OFF)

OMPI_DEF_OPT ( OMPI_GROUP_SPARSE "Wether we want sparse process groups." OFF)

OMPI_DEF_OPT (OMPI_PROVIDE_MPI_FILE_INTERFACE "Whether OMPI should provide MPI File interface" ON)

OMPI_DEF_OPT(OMPI_WANT_CXX_BINDINGS "Whether we want MPI cxx support or not." ON)

OMPI_DEF_OPT(OMPI_WANT_F77_BINDINGS "Whether we want MPI F77 support or not." OFF)

OMPI_DEF_OPT(OMPI_WANT_F90_BINDINGS "Whether we want MPI F90 support or not." OFF)

OMPI_DEF_OPT(OMPI_WANT_MPI_CXX_SEEK "Do we want to try to work around C++ bindings SEEK_* issue?" OFF)

OMPI_DEF_OPT(OMPI_WANT_PERUSE "Whether the peruse interface should be enabled." OFF)

OMPI_DEF_OPT( OPAL_WANT_PRETTY_PRINT_STACKTRACE "Whether we want pretty-print stack trace feature." ON)

OMPI_DEF_OPT( OPAL_WANT_SMP_LOCKS "Whether we want to have smp locks in atomic ops or not." ON)

OMPI_DEF_OPT( OPAL_ENABLE_FT "Enable fault tolerance general components and logic." ON)

OMPI_DEF_OPT( OPAL_ENABLE_FT_CR "Enable fault tolerance checkpoint/restart components and logic." OFF)

OMPI_DEF_OPT( OPAL_ENABLE_FT_THREAD "Enable fault tolerance thread in Open PAL." OFF)

OMPI_DEF_OPT( OPAL_ENABLE_IPV6 "Enable IPv6 support, but only if the underlying system supports it." ON)

OMPI_DEF_OPT( OPAL_ENABLE_TRACE "Enable run-time tracing of internal functions." OFF)

OMPI_DEF_OPT( ORTE_DISABLE_FULL_SUPPORT "Enable full RTE support (Default OFF)." OFF)

OMPI_DEF_OPT( ORTE_WANT_ORTERUN_PREFIX_BY_DEFAULT "Whether we want orterun to effect \"--prefix $prefix\" by default." ON)

OMPI_DEF_OPT( OMPI_WANT_MPI_INTERFACE_WARNING "enable warnings in wrong (e.g. deprecated) usage in user-level code (default: disabled)." OFF)

OMPI_DEF_OPT(ORTE_WANT_CCP "Whether we want to have the CCP remote process launch support." ON)

OMPI_DEF_OPT(OPAL_WANT_LIBLTDL "Whether we want to enable DSO build for Windows." OFF)

OMPI_DEF_OPT(OMPI_WANT_NETWORK_DIRECT "Whether we want to enable Network Direct support." ON)


IF (NOT MSVC)

###################################################################
#                           Check headers                         #
###################################################################


OMPI_CHECK_INCLUDE_FILE (alloca.h HAVE_ALLOCA_H)

OMPI_CHECK_INCLUDE_FILE (arpa/inet.h HAVE_ARPA_INET_H)

OMPI_CHECK_INCLUDE_FILE (crt_externs.h HAVE_CRT_EXTERNS_H)

OMPI_CHECK_INCLUDE_FILE (dirent.h HAVE_DIRENT_H)

OMPI_CHECK_INCLUDE_FILE (dlfcn.h HAVE_DLFCN_H)

OMPI_CHECK_INCLUDE_FILE (err.h HAVE_ERR_H)

OMPI_CHECK_INCLUDE_FILE (execinfo.h HAVE_EXECINFO_H)

OMPI_CHECK_INCLUDE_FILE (fcntl.h HAVE_FCNTL_H)

OMPI_CHECK_INCLUDE_FILE (grp.h HAVE_GRP_H)

OMPI_CHECK_INCLUDE_FILE (ifaddrs.h HAVE_IFADDRS_H)

OMPI_CHECK_INCLUDE_FILE (inttypes.h HAVE_INTTYPES_H)

OMPI_CHECK_INCLUDE_FILE (libcr.h HAVE_LIBCR_H)

OMPI_CHECK_INCLUDE_FILE (libgen.h HAVE_LIBGEN_H)

OMPI_CHECK_INCLUDE_FILE (libutil.h HAVE_LIBUTIL_H)

OMPI_CHECK_INCLUDE_FILE (libxcpu.h HAVE_LIBXCPU_H)

OMPI_CHECK_INCLUDE_FILE (mach/mach_time.h HAVE_MACH_MACH_TIME_H)

OMPI_CHECK_INCLUDE_FILE (mach/mach_vm.h HAVE_MACH_MACH_VM_H)

OMPI_CHECK_INCLUDE_FILE (netdb.h HAVE_NETDB_H)

OMPI_CHECK_INCLUDE_FILE (netinet/in.h HAVE_NETINET_IN_H)

OMPI_CHECK_INCLUDE_FILE (netinet/tcp.h HAVE_NETINET_TCP_H)

OMPI_CHECK_INCLUDE_FILE (net/if.h HAVE_NET_IF_H)

OMPI_CHECK_INCLUDE_FILE (pmapi.h HAVE_PMAPI_H)

OMPI_CHECK_INCLUDE_FILE (poll.h HAVE_POLL_H)

OMPI_CHECK_INCLUDE_FILE (pthread.h HAVE_PTHREAD_H)

OMPI_CHECK_INCLUDE_FILE (pty.h HAVE_PTY_H)

OMPI_CHECK_INCLUDE_FILE (pwd.h HAVE_PWD_H)

OMPI_CHECK_INCLUDE_FILE (regex.h HAVE_REGEX_H)

OMPI_CHECK_INCLUDE_FILE (sched.h HAVE_SCHED_H)

OMPI_CHECK_INCLUDE_FILE (stdbool.h HAVE_STDBOOL_H)

OMPI_CHECK_INCLUDE_FILE (stdint.h HAVE_STDINT_H)

OMPI_CHECK_INCLUDE_FILE (strings.h HAVE_STRINGS_H)

OMPI_CHECK_INCLUDE_FILE (stropts.h HAVE_STROPTS_H)

OMPI_CHECK_INCLUDE_FILE (syslog.h HAVE_SYSLOG_H)

OMPI_CHECK_INCLUDE_FILE (sys/bproc_common.h HAVE_SYS_BPROC_COMMON_H)

OMPI_CHECK_INCLUDE_FILE (sys/bproc.h HAVE_SYS_BPROC_H)

OMPI_CHECK_INCLUDE_FILE (sys/devpoll.h HAVE_SYS_DEVPOLL_H)

OMPI_CHECK_INCLUDE_FILE (sys/epoll.h HAVE_SYS_EPOLL_H)

OMPI_CHECK_INCLUDE_FILE (sys/event.h HAVE_SYS_EVENT_H)

OMPI_CHECK_INCLUDE_FILE (sys/fcntl.h HAVE_SYS_FCNTL_H)

OMPI_CHECK_INCLUDE_FILE (sys/ioctl.h HAVE_SYS_IOCTL_H)

OMPI_CHECK_INCLUDE_FILE (sys/ipc.h HAVE_SYS_IPC_H)

OMPI_CHECK_INCLUDE_FILE (sys/mman.h HAVE_SYS_MMAN_H)

OMPI_CHECK_INCLUDE_FILE (sys/param.h HAVE_SYS_PARAM_H)

OMPI_CHECK_INCLUDE_FILE (sys/queue.h HAVE_SYS_QUEUE_H)

OMPI_CHECK_INCLUDE_FILE (sys/resource.h HAVE_SYS_RESOURCE_H)

OMPI_CHECK_INCLUDE_FILE (sys/select.h HAVE_SYS_SELECT_H)

OMPI_CHECK_INCLUDE_FILE (sys/socket.h HAVE_SYS_SOCKET_H)

OMPI_CHECK_INCLUDE_FILE (sys/sockio.h HAVE_SYS_SOCKIO_H)

OMPI_CHECK_INCLUDE_FILE (sys/statvfs.h HAVE_SYS_STATVFS_H)

OMPI_CHECK_INCLUDE_FILE (sys/sysctl.h HAVE_SYS_SYSCTL_H)

OMPI_CHECK_INCLUDE_FILE (sys/time.h HAVE_SYS_TIME_H)

OMPI_CHECK_INCLUDE_FILE (sys/tree.h HAVE_SYS_TREE_H)

OMPI_CHECK_INCLUDE_FILE (sys/uio.h HAVE_SYS_UIO_H)

OMPI_CHECK_INCLUDE_FILE (sys/utsname.h HAVE_SYS_UTSNAME_H)

OMPI_CHECK_INCLUDE_FILE (sys/wait.h HAVE_SYS_WAIT_H)

OMPI_CHECK_INCLUDE_FILE (termios.h HAVE_TERMIOS_H)

OMPI_CHECK_INCLUDE_FILE (sys/time.h HAVE_TIMERADD)


OMPI_CHECK_INCLUDE_FILE (ucontext.h HAVE_UCONTEXT_H)

OMPI_CHECK_INCLUDE_FILE (ulimit.h HAVE_ULIMIT_H)

OMPI_CHECK_INCLUDE_FILE (unistd.h HAVE_UNISTD_H)

OMPI_CHECK_INCLUDE_FILE (util.h HAVE_UTIL_H)

OMPI_CHECK_INCLUDE_FILE (utmp.h HAVE_UTMP_H)

OMPI_CHECK_INCLUDE_FILE (mx_extension.h MX_HAVE_EXTENSIONS_H)


###################################################################
#                          Check functions                        #
###################################################################

OMPI_CHECK_FUNCTION_EXISTS (asprintf HAVE_ASPRINTF)

OMPI_CHECK_FUNCTION_EXISTS (backtrace HAVE_BACKTRACE)

OMPI_CHECK_FUNCTION_EXISTS (cnos_pm_barrier HAVE_CNOS_PM_BARRIER)

OMPI_CHECK_FUNCTION_EXISTS (dirname HAVE_DIRNAME)

OMPI_CHECK_FUNCTION_EXISTS (dlsym HAVE_DLSYM)

OMPI_CHECK_FUNCTION_EXISTS (epoll HAVE_EPOLL)

OMPI_CHECK_FUNCTION_EXISTS (epoll_ctl HAVE_EPOLL_CTL)

OMPI_CHECK_FUNCTION_EXISTS (fcntl HAVE_FCNTL)

OMPI_CHECK_FUNCTION_EXISTS (fork HAVE_FORK)

OMPI_CHECK_FUNCTION_EXISTS (getpwuid HAVE_GETPWUID)

OMPI_CHECK_FUNCTION_EXISTS (gettimeofday HAVE_GETTIMEOFDAY)

OMPI_CHECK_FUNCTION_EXISTS (htonl HAVE_HTONL)

OMPI_CHECK_FUNCTION_EXISTS (htons HAVE_HTONS)

OMPI_CHECK_FUNCTION_EXISTS (ibv_fork_init HAVE_IBV_FORK_INIT)

OMPI_CHECK_FUNCTION_EXISTS (ibv_get_device_list HAVE_IBV_GET_DEVICE_LIST)

OMPI_CHECK_FUNCTION_EXISTS (ibv_resize_cq HAVE_IBV_RESIZE_CQ)

OMPI_CHECK_FUNCTION_EXISTS (killrank HAVE_KILLRANK)

OMPI_CHECK_FUNCTION_EXISTS (kqueue KQUEUE)

OMPI_CHECK_FUNCTION_EXISTS (mach_vm_read HAVE_MACH_MACH_VM_READ)

OMPI_CHECK_FUNCTION_EXISTS (mach_vm_region HAVE_MACH_VM_REGION)

OMPI_CHECK_FUNCTION_EXISTS (mallopt HAVE_MALLOPT)

OMPI_CHECK_FUNCTION_EXISTS (mmap HAVE_MMAP)

OMPI_CHECK_FUNCTION_EXISTS (ntohl HAVE_NTOHL)

OMPI_CHECK_FUNCTION_EXISTS (ntohs HAVE_NTOHS)

OMPI_CHECK_FUNCTION_EXISTS (openpty HAVE_OPENPTY)

OMPI_CHECK_FUNCTION_EXISTS (pipe HAVE_PIPE)

OMPI_CHECK_FUNCTION_EXISTS (pm_cycles HAVE_PM_CYCLES)

OMPI_CHECK_FUNCTION_EXISTS (poll HAVE_POLL)

OMPI_CHECK_FUNCTION_EXISTS (posix_memalign HAVE_POSIX_MEMALIGN)

OMPI_CHECK_FUNCTION_EXISTS (printstack HAVE_PRINTSTACK)

OMPI_CHECK_FUNCTION_EXISTS (ptsname HAVE_PTSNAME)

OMPI_CHECK_FUNCTION_EXISTS (regcmp HAVE_REGCMP)

OMPI_CHECK_FUNCTION_EXISTS (regexec HAVE_REGEXEC)

OMPI_CHECK_FUNCTION_EXISTS (regfree HAVE_REGFREE)

OMPI_CHECK_FUNCTION_EXISTS (sched_yield HAVE_SCHED_YIELD)

OMPI_CHECK_FUNCTION_EXISTS (select HAVE_SELECT)

OMPI_CHECK_FUNCTION_EXISTS (setsid HAVE_SETSID)

OMPI_CHECK_FUNCTION_EXISTS (sigtimedwait HAVE_SIGTIMEDWAIT)

OMPI_CHECK_FUNCTION_EXISTS (snprintf HAVE_SNPRINTF)

OMPI_CHECK_FUNCTION_EXISTS (strsignal HAVE_STRSIGNAL)

OMPI_CHECK_FUNCTION_EXISTS (syscall HAVE_SYSCALL)

OMPI_CHECK_FUNCTION_EXISTS (sysconf HAVE_SYSCONF)

OMPI_CHECK_FUNCTION_EXISTS (syslog HAVE_SYSLOG)

OMPI_CHECK_FUNCTION_EXISTS (tcgetpgrp HAVE_TCGETPGRP)

OMPI_CHECK_FUNCTION_EXISTS (vasprintf HAVE_VASPRINTF)

OMPI_CHECK_FUNCTION_EXISTS (vm_read_overwrite HAVE_VM_READ_OVERWRITE)

OMPI_CHECK_FUNCTION_EXISTS (waitpid HAVE_WAITPIN)

OMPI_CHECK_FUNCTION_EXISTS (_NSGetEnviron HAVE__NSGETENVIRON)

OMPI_CHECK_FUNCTION_EXISTS (__mmap HAVE___MMAP)

OMPI_CHECK_FUNCTION_EXISTS (__munmap HAVE___MUNMAP)

OMPI_CHECK_SYMBOL_EXISTS (F_SETFD fcntl.h HAVE_SETFD)

OMPI_CHECK_SYMBOL_EXISTS (TAILQ_FOREACH "sys/queue.h" HAVE_TAILQFOREACH) 

OMPI_CHECK_SYMBOL_EXISTS (IBV_EVENT_CLIENT_REREGISTER "" HAVE_DECL_IBV_EVENT_CLIENT_REREGISTER)

OMPI_CHECK_SYMBOL_EXISTS (RLIMIT_NPROC "" HAVE_DECL_RLIMIT_NPROC)

OMPI_CHECK_SYMBOL_EXISTS (sbrk "" HAVE_DECL_SBRK)

OMPI_CHECK_SYMBOL_EXISTS (__func__ "" HAVE_DECL___FUNC__)

OMPI_CHECK_STRUCT_HAS_MEMBER(ppc_thread_state_t srr0 mach/ppc/thread_status.h HAVE_PPC_THREAD_STATE_T_SRR0)

OMPI_CHECK_STRUCT_HAS_MEMBER(siginfo_t si_band sys/siginfo.h HAVE_SIGINFO_T_SI_BAND)

OMPI_CHECK_STRUCT_HAS_MEMBER(siginfo_t si_fd sys/siginfo.h HAVE_SIGINFO_T_SI_FD)

OMPI_CHECK_STRUCT_HAS_MEMBER("struct dirent" d_type dirent.h HAVE_STRUCT_DIRENT_D_TYPE)

ENDIF (NOT MSVC)

###################################################################
#                         Check data type                         #
###################################################################


OMPI_CHECK_TYPES(char CHAR none c)

OMPI_CHECK_TYPES(wchar WCHAR none c)

OMPI_CHECK_TYPES(double DOUBLE none c)

OMPI_CHECK_TYPES(float FLOAT none c)

OMPI_CHECK_TYPES(int INT none c)

OMPI_CHECK_BOOL()

OMPI_CHECK_TYPES(short SHORT none c)

OMPI_CHECK_TYPES(long LONG none c)

OMPI_CHECK_TYPES("long double" LONG_DOUBLE none c)

OMPI_CHECK_TYPES("long long" LONG_LONG none c)

OMPI_CHECK_TYPES ("unsigned int" UNSIGNED_INT none c)

OMPI_CHECK_TYPES ("unsigned short" UNSIGNED_SHORT none c)

OMPI_CHECK_TYPES ("unsigned long long" UNSIGNED_LONG_LONG none c)

OMPI_CHECK_TYPES("unsigned long double" UNSIGNED_LONG_DOUBLE none c)

OMPI_CHECK_TYPES ("unsigned char" UNSIGNED_CHAR none c)

OMPI_CHECK_TYPES("float _Complex" FLOAT_COMPLEX none c)

OMPI_CHECK_TYPES("double _Complex" DOUBLE_COMPLEX none c)

OMPI_CHECK_TYPES("long double _Complex" LONG_DOUBLE_COMPLEX none c)

OMPI_CHECK_TYPES(size_t SIZE_T none c)

OMPI_CHECK_TYPES(ssize_t SSIZE_T none c)

OMPI_CHECK_TYPES("void *" VOID_P none c)

OMPI_CHECK_TYPES(pid_t PID_T "int" c)

OMPI_CHECK_TYPES(ptrdiff_t PTRDIFF_T "int" c)

OMPI_CHECK_TYPES (mode_t MODE_T none c)

OMPI_CHECK_TYPES (int8_t INT8_T none c)

OMPI_CHECK_TYPES (int16_t INT16_T none c)

OMPI_CHECK_TYPES (int32_t INT32_T none c)

OMPI_CHECK_TYPES (int64_t INT64_T none c)

OMPI_CHECK_TYPES (int128_t INT128_T none c)

OMPI_CHECK_TYPES (intptr_t INTPTR_T none c)

OMPI_CHECK_TYPES (uint8_t UINT8_T none c)

OMPI_CHECK_TYPES (uint16_t UINT16_T none c)

OMPI_CHECK_TYPES (uint32_t UINT32_T none c)

OMPI_CHECK_TYPES (uint64_t UINT64_T none c)

OMPI_CHECK_TYPES (uint128_t UINT128_T none c)

OMPI_CHECK_TYPES (uintptr_t UINTPTR_T none c)


###################################################################
#                      Check Fortran 77 types                     #
###################################################################
INCLUDE(setup_F77)
INCLUDE(f77_check)
INCLUDE(f77_check_real16_c_equiv)
INCLUDE(f77_get_value_true)
INCLUDE(f77_get_fortran_handle_max)

IF(WIN32)
  OMPI_DEF(ompi_fortran_bogus_type_t "int" "A bogus type that allows us to have sentinel type values that are still valid." 0 1)
ENDIF(WIN32)

# We want to set the #define's for all of these, so invoke the macros
# regardless of whether we have F77 support or not.
OMPI_F77_CHECK("LOGICAL" "yes" "char;int;long long;long" "-1")
OMPI_F77_CHECK("LOGICAL*1" "yes" "char;short;int;long long;long" "1")
OMPI_F77_CHECK("LOGICAL*2" "yes" "short;int;long long;long" "2")
OMPI_F77_CHECK("LOGICAL*4" "yes" "int;long long;long" "4")
OMPI_F77_CHECK("LOGICAL*8" "yes" "int;long long;long" "8")
OMPI_F77_CHECK("INTEGER" "yes" "int;long long;long" "-1")
OMPI_F77_CHECK("INTEGER*1" "no" "char;short;int;long long;long" "1")
OMPI_F77_CHECK("INTEGER*2" "no" "short;int;long long;long" "2")
OMPI_F77_CHECK("INTEGER*4" "no" "int;long long;long" "4")
OMPI_F77_CHECK("INTEGER*8" "no" "int;long long;long" "8")
OMPI_F77_CHECK("INTEGER*16" "no" "int;long long;long" "16")

OMPI_F77_CHECK("REAL" "yes" "float;double;long double" "-1")
OMPI_F77_CHECK("REAL*2" "no" "float;double;long double" "2")
OMPI_F77_CHECK("REAL*4" "no" "float;double;long double" "4")
OMPI_F77_CHECK("REAL*8" "no" "float;double;long double" "8")
OMPI_F77_CHECK("REAL*16" "no" "float;double;long double" "16")
OMPI_F77_CHECK("DOUBLE PRECISION" "yes" "float;double;long double" "-1")

OMPI_F77_CHECK("COMPLEX" "yes" "" "-1")

# The complex*N tests are a bit different (note: the complex tests are
# the same as all the rest, because complex is a composite of two
# reals, which we *have* to have.  It's only the complex*N tests that
# are different).  The fortran complex types are composites of the
# real*(N/2) types.  So for us to support complex*N, two conditions
# must be true:
#
# a) we must support real*(N/2) (i.e., compiler supports it and we
#    have a back-end C type for it)
# b) compiler supports complex*N

OMPI_F77_CHECK("COMPLEX*8" "no" "" "8")
OMPI_F77_CHECK("COMPLEX*16" "no" "" "16")
OMPI_F77_CHECK("COMPLEX*32" "no" "" "32")

OMPI_F77_CHECK_REAL16_C_EQUIV()

# Regardless of whether we have fortran bindings, or even a fortran
# compiler, get the max value for a fortran MPI handle (this macro
# handles the case where we don't have a fortran compiler).

OMPI_F77_GET_FORTRAN_HANDLE_MAX()

#
# Check for Fortran compilers value of TRUE and for the correct assumption
# on LOGICAL for conversion into what C considers to be a true value
#
OMPI_F77_GET_VALUE_TRUE()
#OMPI_F77_CHECK_LOGICAL_ARRAY

#
# There are 2 layers to the MPI f77 layer. The only extra thing that
# determine f77 bindings is that fortran can be disabled by user. In
# such cases, we need to not build the target at all.  One layer
# generates MPI_f77* bindings. The other layer generates PMPI_f77*
# bindings. The following conditions determine whether each (or both)
# these layers are built.
#
# Superceeding clause:
#   - fortran77 bindings should be enabled, else everything is
#     disabled
# 1. MPI_f77* bindings are needed if:
#   - Profiling is not required
#   - Profiling is required but weak symbols are not
#     supported
# 2. PMPI_* bindings are needed if profiling is required.  Hence we
# define 2 conditionals which tell us whether each of these layers
# need to be built or NOT
#

IF(NOT WANT_MPI_PROFILING OR OMPI_PROFILING_COMPILE_SEPARATELY AND  OMPI_WANT_F77_BINDINGS)
  SET(WANT_MPI_F77_BINDINGS_LAYER 1)
ELSE(NOT WANT_MPI_PROFILING OR OMPI_PROFILING_COMPILE_SEPARATELY AND  OMPI_WANT_F77_BINDINGS)
  SET(WANT_MPI_F77_BINDINGS_LAYER 0) 
ENDIF(NOT WANT_MPI_PROFILING OR OMPI_PROFILING_COMPILE_SEPARATELY AND  OMPI_WANT_F77_BINDINGS)

IF(WANT_MPI_PROFILING AND OMPI_WANT_F77_BINDINGS)
  SET(WANT_MPI_F77_BINDINGS_LAYER 1)
ELSE(WANT_MPI_PROFILING AND OMPI_WANT_F77_BINDINGS)
  SET(WANT_MPI_F77_BINDINGS_LAYER 0) 
ENDIF(WANT_MPI_PROFILING AND OMPI_WANT_F77_BINDINGS)


IF(WIN32)

  OMPI_DEF(OMPI_HAVE_CXX_EXCEPTION_SUPPORT 0 "Whether or not we have compiled with C++ exceptions support" 0 1)

  OMPI_DEF(OPAL_C_HAVE_VISIBILITY 1 "Whether C compiler supports -fvisibility." 0 1)

  OMPI_DEF(restrict " " "Define to equivalent of C99 restrict keyword, or to nothing if this is not supported.\n   Do not define if restrict is supported directly." 0 1)

  OMPI_DEF(MCA_timer_IMPLEMENTATION_HEADER "opal/mca/timer/windows/timer_windows.h" "Header to include for timer implementation." 1 1)

  OMPI_DEF(OPAL_ASSEMBLY_ARCH "OMPI_WINDOWS" "Architecture type of assembly to use for atomic operations." 0 1)

  OMPI_DEF(OPAL_HAVE_POSIX_THREADS 0 "Do we have POSIX threads." 0 1)

  OMPI_DEF(OPAL_HAVE_WEAK_SYMBOLS 0 "Wehther we have weak symbols or not" 0 1)

  OMPI_DEF(OPAL_HAVE_SOLARIS_THREADS 0 "Do we have native Solaris threads." 0 1)

  OMPI_DEF(MCA_memcpy_IMPLEMENTATION_HEADER "opal/mca/memcpy/base/memcpy_base_default.h" "Header to include for memcpy implementation." 1 1)

  OMPI_DEF(OMPI_MPI_OFFSET_TYPE "long long" "Type of MPI_Offset." 0 1)

  OMPI_DEF(HAVE_DECL___FUNC__ 0 "Define to 1 if you have the declaration of `__func__', and to 0 if you don't." 0 1)

  OMPI_DEF_CACHE(MCA_mtl_DIRECT_CALL_COMPONENT " " STRING "Name of component to use for direct calls, if MCA_mtl_DIRECT_CALL is 1." 1 1)

  OMPI_DEF_CACHE(MCA_mtl_DIRECT_CALL_HEADER " " STRING "Header mtl includes to be direct called." 1 1)

  OMPI_DEF_CACHE(MCA_pml_DIRECT_CALL_COMPONENT " " STRING "Name of component to use for direct calls, if MCA_pml_DIRECT_CALL is 1." 1 1)

  OMPI_DEF_CACHE(MCA_pml_DIRECT_CALL_HEADER " " STRING "Header pml includes to be direct called." 1 1)

  CHECK_C_INLINE()

ENDIF(WIN32)


GET_FILENAME_COMPONENT(C_COMPILER_NAME ${CMAKE_C_COMPILER} NAME_WE)

OMPI_DEF(OPAL_CC ${C_COMPILER_NAME} "OMPI underlying C compiler name." 1 1)

OMPI_DEF(OPAL_CC_ABSOLUTE ${CMAKE_C_COMPILER} "OMPI underlying C compiler absolute path." 1 1)

OMPI_DEF(WRAPPER_EXTRA_CFLAGS " " "Additional CFLAGS to pass through the wrapper compilers." 1 1)

OMPI_DEF(WRAPPER_EXTRA_CXXFLAGS " " "Additional CXXFLAGS to pass through the wrapper compilers." 1 1)

OMPI_DEF(WRAPPER_EXTRA_FCFLAGS " " "Additional FCFLAGS to pass through the wrapper compilers." 1 1)

OMPI_DEF(WRAPPER_EXTRA_FFLAGS " " "Additional FFLAGS to pass through the wrapper compilers." 1 1)

OMPI_DEF(WRAPPER_EXTRA_LDFLAGS " " "Additional LDFLAGS to pass through the wrapper compilers." 1 1)

OMPI_DEF(WRAPPER_EXTRA_LIBS " " "Additional LIBS to pass through the wrapper compilers." 1 1)


GET_FILENAME_COMPONENT(CXX_COMPILER_NAME ${CMAKE_CXX_COMPILER} NAME_WE)
OMPI_DEF(OMPI_CXX ${CXX_COMPILER_NAME} "OMPI underlying C++ compiler name." 1 1)

OMPI_DEF(OMPI_CXX_ABSOLUTE ${CMAKE_CXX_COMPILER} "OMPI underlying C++ compiler absolute path." 1 1)

IF(OMPI_WANT_F77_BINDINGS)
  GET_FILENAME_COMPONENT(F77_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME_WE)
  OMPI_DEF(OMPI_F77 ${F77_COMPILER_NAME} "OMPI underlying Fortran 77 compiler name." 1 1)
  OMPI_DEF(OMPI_F77_ABSOLUTE ${CMAKE_Fortran_COMPILER} "OMPI underlying Fortran 77 compiler absolute path" 1 1)
ELSE(OMPI_WANT_F77_BINDINGS)
  OMPI_DEF(OMPI_F77 "none" "OMPI underlying Fortran 77 compiler name." 1 1)
  OMPI_DEF(OMPI_F77_ABSOLUTE "none" "OMPI underlying Fortran 77 compiler absolute path" 1 1)
ENDIF(OMPI_WANT_F77_BINDINGS)

IF(OMPI_WANT_F90_BINDINGS)
  GET_FILENAME_COMPONENT(F90_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME_WE)
  OMPI_DEF(OMPI_F90 ${F90_COMPILER_NAME} "OMPI underlying Fortran 90 compiler name." 1 1)
  OMPI_DEF(OMPI_F90_ABSOLUTE ${CMAKE_Fortran_COMPILER} "OMPI underlying Fortran 90 compiler absolute path" 1 1)
ELSE(OMPI_WANT_F90_BINDINGS)
  OMPI_DEF(OMPI_F90 "none" "OMPI underlying Fortran 90 compiler name." 1 1)
  OMPI_DEF(OMPI_F90_ABSOLUTE "none" "OMPI underlying Fortran 90 compiler absolute path" 1 1)
ENDIF(OMPI_WANT_F90_BINDINGS)

IF(HAVE_LONG_LONG)
  OMPI_DEF(OPAL_HAVE_LONG_LONG 1 "Do not use outside of mpi.h.\n   Define to 1 if the system has the type 'long long'." 0 1)
ENDIF(HAVE_LONG_LONG)

IF(HAVE_PTRDIFF_T)
  OMPI_DEF(OPAL_PTRDIFF_TYPE "ptrdiff_t" "Type to use for ptrdiff_t." 0 0)
ENDIF(HAVE_PTRDIFF_T)

#The same logic as in opal_stdint.h
#8-bit
IF(NOT HAVE_UINT8_T AND SIZEOF_CHAR EQUAL 1)
  OMPI_DEF(OPAL_ALIGNMENT_INT8 ${OPAL_ALIGNMENT_CHAR} "Alignment of `int8_t'." 0 1)
ELSE(NOT HAVE_UINT8_T AND SIZEOF_CHAR EQUAL 1)
  MESSAGE(FATAL_ERROR "Failed to define 8-bit types.")
ENDIF(NOT HAVE_UINT8_T AND SIZEOF_CHAR EQUAL 1)

#16-bit
IF(NOT HAVE_INT16_T AND SIZEOF_SHORT EQUAL 2)
  OMPI_DEF(OPAL_ALIGNMENT_INT16 ${OPAL_ALIGNMENT_SHORT} "Alignment of `int16_t'." 0 1)
ELSE(NOT HAVE_INT16_T AND SIZEOF_SHORT EQUAL 2)
  MESSAGE(FATAL_ERROR "Failed to define 8-bit types.")
ENDIF(NOT HAVE_INT16_T AND SIZEOF_SHORT EQUAL 2)

#32-bit
IF(NOT HAVE_INT32_T AND SIZEOF_INT EQUAL 4)
  OMPI_DEF(OPAL_ALIGNMENT_INT32 ${OPAL_ALIGNMENT_INT} "Alignment of `int32_t'." 0 1)
ELSEIF(NOT HAVE_INT32_T AND SIZEOF_LONG EQUAL 4)
  OMPI_DEF(OPAL_ALIGNMENT_INT32 ${OPAL_ALIGNMENT_LONG} "Alignment of `int32_t'." 0 1)
ELSE(NOT HAVE_INT32_T AND SIZEOF_INT EQUAL 4)
  MESSAGE(FATAL_ERROR "Failed to define 8-bit types.")
ENDIF(NOT HAVE_INT32_T AND SIZEOF_INT EQUAL 4)

#64-bit
IF(NOT HAVE_INT64_T AND SIZEOF_INT EQUAL 8)
  OMPI_DEF(OPAL_ALIGNMENT_INT64 ${OPAL_ALIGNMENT_INT} "Alignment of `int64_t'." 0 1)
ELSEIF(NOT HAVE_INT64_T AND SIZEOF_LONG EQUAL 8)
  OMPI_DEF(OPAL_ALIGNMENT_INT64 ${OPAL_ALIGNMENT_LONG} "Alignment of `int64_t'." 0 1)
ELSEIF(NOT HAVE_INT64_T AND HAVE_LONG_LONG AND SIZEOF_LONG_LONG EQUAL 8)
  OMPI_DEF(OPAL_ALIGNMENT_INT64 ${OPAL_ALIGNMENT_LONG_LONG} "Alignment of `int64_t'." 0 1)
ELSE(NOT HAVE_INT64_T AND SIZEOF_INT EQUAL 8)
  MESSAGE(FATAL_ERROR "Failed to define 8-bit types.")
ENDIF(NOT HAVE_INT64_T AND SIZEOF_INT EQUAL 8)


IF(NOT WRITE_CONFIG_DONE)
  FILE(APPEND ${OpenMPI_BINARY_DIR}/opal/include/opal_config.h.cmake
    "#include \"opal_config_bottom.h\"\n#endif /* OPAL_CONFIG_H */\n")
  SET(WRITE_CONFIG_DONE TRUE CACHE INTERNAL "Whether to regenerate configure template.")
ENDIF(NOT WRITE_CONFIG_DONE)

CONFIGURE_FILE(${OpenMPI_BINARY_DIR}/opal/include/opal_config.h.cmake ${OpenMPI_BINARY_DIR}/opal/include/opal_config.h)
