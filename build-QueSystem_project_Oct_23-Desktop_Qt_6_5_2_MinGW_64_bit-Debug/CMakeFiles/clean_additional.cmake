# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appQueSystem_project_Oct_23_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appQueSystem_project_Oct_23_autogen.dir\\ParseCache.txt"
  "appQueSystem_project_Oct_23_autogen"
  )
endif()
