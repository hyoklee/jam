set(unitybuild_c "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/tgt.dir/Unity/unity_0_c.c")
file(STRINGS ${unitybuild_c} unitybuild_c_strings)
string(REGEX MATCH ".*#include.*s3.c.*#include.*s1.c.*#include.*s2.c.*" matched_code ${unitybuild_c_strings})
if(NOT matched_code)
  set(RunCMake_TEST_FAILED "Generated unity file doesn't include expected oder of source files")
  return()
endif()
