add_executable(files files.cpp)

find_package(Filesystem)
if (Filesystem_FOUND)
    add_executable(filesystem_manage filesystem.cpp)
    target_link_libraries(filesystem_manage PRIVATE std::filesystem)
    target_compile_definitions(filesystem_manage PRIVATE -DCXX_FILESYSTEM_HEADER=<${CXX_FILESYSTEM_HEADER}>)
    target_compile_definitions(filesystem_manage PRIVATE -DCXX_FILESYSTEM_NAMESPACE=${CXX_FILESYSTEM_NAMESPACE})
endif()