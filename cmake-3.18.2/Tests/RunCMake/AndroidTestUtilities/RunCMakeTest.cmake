include(RunCMake)

function(run_ATU case target)
  # Use a single build tree for a few tests without cleaning.
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${case}-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
  file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
  if(target)
    set(build_args --target ${target})
  else()
    set(build_args)
  endif()
  run_cmake(${case})
  run_cmake_command(${case}Build ${CMAKE_COMMAND} --build . --config Debug ${build_args})
endfunction()

run_ATU(SetupTest1 "")
run_ATU(SetupTest2 "tests")
run_ATU(SetupTest3 "tests")
run_ATU(SetupTest4 "")
