#---------------------------------------------------------------------------
# Copyright 2011 The Open Source Electronic Health Record Agent
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#---------------------------------------------------------------------------
find_path(TEST_VISTA_FRESH_M_DIR NAMES VistA-M DOC "Path to the folder that contains the routines and globals from OSEHRA")
list(APPEND freshinfo TEST_VISTA_FRESH_M_DIR)
option(TEST_VISTA_FRESH_CUSTOM_REFRESH "Use a custom script to refresh the VistA Databases" OFF)
mark_as_advanced(TEST_VISTA_FRESH_CUSTOM_REFRESH)
include(ListOfVistARoutines)

if(TEST_VISTA_FRESH_CUSTOM_REFRESH)
  set(TEST_VISTA_FRESH_CUSTOM_COMMAND "" CACHE STRING "Command to run in place of the ImportRG refresh.
  Both the executable path in quotation marks and the path to the file to execute are required")
  mark_as_advanced(TEST_VISTA_FRESH_CUSTOM_COMMAND)
endif()

set(TEST_VISTA_FRESH_GLOBALS_IMPORT_TIMEOUT 3600 CACHE STRING "Timeout in seconds for importing globals")
set(TEST_VISTA_SETUP_SITE_NAME "DEMO.OSEHRA.ORG" CACHE STRING "Name to set for the site address when initializing VistA instance.  Default is 'DEMO.OSEHRA.ORG'")
set(TEST_VISTA_SETUP_PRIMARY_HFS_DIRECTORY "@" CACHE PATH "Absolute path to the system temp directory.  The default of '@' will cause the system to use the working directory of the process as the temp directory.  This path has a limit of 50 characters.  Avoid Windows paths with a '~' ")

foreach(fvariable ${freshinfo})
  if(NOT ${fvariable})
    message(SEND_ERROR "The value for ${fvariable} needs to be set for TEST_VISTA_FRESH to be run successfully.")
  endif(NOT ${fvariable})
endforeach(fvariable ${freshinfo})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/ImportRG.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/ImportRG.cmake @ONLY)

set(logfile "${VISTA_BINARY_DIR}/Testing/Log/RoutineImport.log")
set(RoutineImportFile "${VISTA_BINARY_DIR}/routines.ro")

set(RoutineImportDir "${TEST_VISTA_FRESH_GTM_ROUTINE_DIR}")
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/RoutineImport.py.in ${CMAKE_CURRENT_BINARY_DIR}/VistARoutineImport.py)

set(logfile "${VISTA_BINARY_DIR}/Testing/Log/GlobalImport.log")
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/GlobalImport.py.in ${CMAKE_CURRENT_BINARY_DIR}/GlobalImport.py)
set(logfile "${VISTA_BINARY_DIR}/Testing/Log/Initialize.log")
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Initialize.py.in ${CMAKE_CURRENT_BINARY_DIR}/Initialize.py)
set(logfile "${VISTA_BINARY_DIR}/Testing/Log/PostImport.log")
if(GTM_DIST)
  file(GLOB ImportRoutines "${CMAKE_CURRENT_SOURCE_DIR}/*.ro")
  foreach(RoutineImportFile ${ImportRoutines})
    get_filename_component(routineName "${RoutineImportFile}" NAME_WE)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/RoutineImport.py.in ${CMAKE_CURRENT_BINARY_DIR}/${routineName}Import.py)
  endforeach()
endif()
if(VISTA_HAVE_BUILD_TOOL)
  # Mark the FreshVistA target as part of the ALL target if this
  # undocumented option is set (for use by dashboard scripts).
  if(TEST_VISTA_FRESH_ALL)
    set(all ALL)
  else()
    set(all "")
  endif()
  add_custom_target(FreshVistA ${all} COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/ImportRG.cmake)

  if(VISTA_PRECOMPILE_ALL_ROUTINES)

    foreach(mroutine ${TEST_VISTA_FRESH_GTM_ROUTINES_LIST})
      get_filename_component(name_without_extension ${mroutine} NAME_WE)
      set(target_object_file ${name_without_extension}.o)
      set(target_object_file_with_path ${TEST_VISTA_FRESH_GTM_OBJECT_DIR}/${target_object_file})
      set(source_routine_file_with_path ${TEST_VISTA_FRESH_GTM_ROUTINE_DIR}/${mroutine})
      # Could set here set(ENV{gtm_destdir} "base of the debian path")
      # as well as the other environment variables needed by fis-gtm to run.
      add_custom_command(
        OUTPUT ${target_object_file_with_path}
        DEPENDS ${source_routine_file_with_path}
        WORKING_DIRECTORY ${TEST_VISTA_FRESH_GTM_OBJECT_DIR}
        COMMAND  ${GTM_DIST}/mumps -object=${target_object_file_with_path} ${source_routine_file_with_path}
        )
      list(APPEND list_of_object_files ${target_object_file_with_path})
    endforeach(mroutine)

    add_library(vista-foia SHARED ${list_of_object_files})
    set_property(TARGET vista-foia PROPERTY LINKER_LANGUAGE C)
    add_dependencies(vista-foia FreshVistA)

  endif()

else()
  set_property(GLOBAL APPEND PROPERTY VISTA_BUILD_SCRIPTS ${CMAKE_CURRENT_BINARY_DIR}/ImportRG.cmake)
endif()
