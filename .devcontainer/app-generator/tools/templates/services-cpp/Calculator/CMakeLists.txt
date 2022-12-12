# All cmake projects need these
cmake_minimum_required(VERSION 3.16)
project(__service__)

set(ARTIFACT_DIR_1 ${CMAKE_CURRENT_LIST_DIR}/build/artifacts)
set(ARTIFACT_DIR_2 ${CMAKE_CURRENT_LIST_DIR}/../artifacts)

# Generate compile_commands.json to aid vscode and other editors
set(CMAKE_EXPORT_COMPILE_COMMANDS on)

# psidk requires C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Libraries for building services and tests
find_package(psidk REQUIRED)

# Build example.wasm service
add_executable(__service__ __service__.cpp)
target_link_libraries(__service__ psibase-service-simple-malloc)
target_include_directories(__service__ PUBLIC include)
set_target_properties(__service__ PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${ARTIFACT_DIR_1})
add_custom_command(TARGET __service__
                   POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:__service__> ${ARTIFACT_DIR_2}/__service__/$<TARGET_FILE_NAME:__service__>)


# Add unit tests
add_subdirectory(test)

# These symlinks help vscode
execute_process(COMMAND ln -sfT ${psidk_DIR} ${CMAKE_CURRENT_BINARY_DIR}/psidk)
execute_process(COMMAND ln -sfT ${WASI_SDK_PREFIX} ${CMAKE_CURRENT_BINARY_DIR}/wasi-sdk)
