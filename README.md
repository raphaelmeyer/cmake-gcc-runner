# cmake-gcc-runner

This is a C/C++ runner for CMake projects (based on GCC).

## How to Use it

```yaml
runner:
  name: codingame/cmake-gcc-runner
  version: 1.1.0-gcc-6.3
```

Your project will be compiled one with:

```
cmake .
make
```

And on each run, `make` will be executed and the command specified in the markdown file will be executed.

## Example

In this example, the unit testing framework "Catch" is used. Here's the content of the CMakeLists.txt file:

```
cmake_minimum_required(VERSION 2.8.9)
project (tests)
add_executable(tests tests.cpp factorial.cpp factorial.h)

# Includes Catch in the project:
add_subdirectory(catch)
include_directories(${CATCH_INCLUDE_DIR} ${COMMON_INCLUDES})
enable_testing(true)  # Enables unit-testing.

add_dependencies(tests catch)

add_test(factorial ./tests [factorial])
```

Here's the stub (factorial.cpp):

```C++
unsigned int Factorial( unsigned int number ) {
    return number <= 1 ? number : Factorial(number-1)*number;
}
```

And the main file (tests.cpp):

```C++
#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"
#include "factorial.h"

TEST_CASE( "Factorials are computed", "[factorial]" ) {
    REQUIRE( Factorial(1) == 1 );
    REQUIRE( Factorial(2) == 2 );
    REQUIRE( Factorial(3) == 6 );
    REQUIRE( Factorial(10) == 3628800 );
}
```

In the markdown file, you must specify the command used to execute your test.

```markdown
@[Example]({"stubs": ["factorial.cpp"], "command": "./tests [factorial]"})
```
