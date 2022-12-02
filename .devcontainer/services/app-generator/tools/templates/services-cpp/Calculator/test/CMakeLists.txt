add_executable(__service__-test src/__service__-test.cpp)
target_include_directories(__service__-test PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
    include
    ../include
    # Todo - get testing working
)
target_link_libraries(__service__-test psitestlib-debug)
set_target_properties(__service__-test PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${ARTIFACT_DIR}/__service__/test)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)
