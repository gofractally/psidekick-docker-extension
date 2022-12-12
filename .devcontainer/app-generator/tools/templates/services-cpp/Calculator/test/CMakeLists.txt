function(add_test name)
    set(TARGET ${name}-test)
    add_executable(${TARGET} ${ARGN})
    target_include_directories(${TARGET} PUBLIC
      ../
      include/
     ${CMAKE_CURRENT_LIST_DIR})
    target_link_libraries(${TARGET} psitestlib)
    set_target_properties(${TARGET} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${ARTIFACT_DIR_1}/test)
endfunction(add_test)

add_test(__service__ test.cpp)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)
