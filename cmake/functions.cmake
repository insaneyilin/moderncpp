function(target_exception_options TARGET_NAME)
    if (MSVC)
        # MSVC requires this flag if the code uses C++ exception handling
        target_compile_options(${TARGET_NAME} PRIVATE /EHsc)
    endif ()
endfunction()

function(target_bigobj_options TARGET_NAME)
    if (MSVC)
        # MSVC requires this flag if the file has a lot of code
        target_compile_options(${TARGET_NAME} PRIVATE /bigobj)
    endif ()
endfunction()

function(target_pedantic_options TARGET_NAME)
    # Set warning levels to about the same level for MSVC, GCC, and Clang
    if (BUILD_WITH_PEDANTIC_WARNINGS)
        if (MSVC)
            target_compile_options(${TARGET_NAME} PRIVATE /W4 /WX)
        else ()
            target_compile_options(${TARGET_NAME} PRIVATE -Wall -Wextra -pedantic -Werror)
        endif ()
    endif ()
endfunction()

function(target_msvc_compile_options TARGET_NAME DEFINITION)
    if (MSVC)
        target_compile_options(${TARGET_NAME} PUBLIC ${DEFINITION})
    endif ()
endfunction()

function(target_longtests_definitions TARGET_NAME)
    if (BUILD_LONG_TESTS)
        target_compile_definitions(${TARGET_NAME} PUBLIC BUILD_LONG_TESTS)
    endif ()
endfunction()

function(set_master_project_vars)
    if (${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
        set(MASTER_PROJECT ON PARENT_SCOPE)
    else ()
        set(MASTER_PROJECT OFF PARENT_SCOPE)
    endif ()
endfunction()

function(set_debug_booleans)
    if (CMAKE_BUILD_TYPE MATCHES DEBUG)
        set(DEBUG_MODE ON PARENT_SCOPE)
        set(NOT_DEBUG_MODE OFF PARENT_SCOPE)
    else ()
        set(DEBUG_MODE OFF PARENT_SCOPE)
        set(NOT_DEBUG_MODE ON PARENT_SCOPE)
    endif ()
endfunction()