# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/ssd/projects/llvm-pass

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/ssd/projects/llvm-pass/build

# Include any dependencies generated for this target.
include CMakeFiles/llvm_pass.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/llvm_pass.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/llvm_pass.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/llvm_pass.dir/flags.make

CMakeFiles/llvm_pass.dir/main.cpp.o: CMakeFiles/llvm_pass.dir/flags.make
CMakeFiles/llvm_pass.dir/main.cpp.o: ../main.cpp
CMakeFiles/llvm_pass.dir/main.cpp.o: CMakeFiles/llvm_pass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/ssd/projects/llvm-pass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/llvm_pass.dir/main.cpp.o"
	/mnt/ssd/llvm-project/build/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/llvm_pass.dir/main.cpp.o -MF CMakeFiles/llvm_pass.dir/main.cpp.o.d -o CMakeFiles/llvm_pass.dir/main.cpp.o -c /mnt/ssd/projects/llvm-pass/main.cpp

CMakeFiles/llvm_pass.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm_pass.dir/main.cpp.i"
	/mnt/ssd/llvm-project/build/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/ssd/projects/llvm-pass/main.cpp > CMakeFiles/llvm_pass.dir/main.cpp.i

CMakeFiles/llvm_pass.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm_pass.dir/main.cpp.s"
	/mnt/ssd/llvm-project/build/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/ssd/projects/llvm-pass/main.cpp -o CMakeFiles/llvm_pass.dir/main.cpp.s

# Object files for target llvm_pass
llvm_pass_OBJECTS = \
"CMakeFiles/llvm_pass.dir/main.cpp.o"

# External object files for target llvm_pass
llvm_pass_EXTERNAL_OBJECTS =

llvm_pass: CMakeFiles/llvm_pass.dir/main.cpp.o
llvm_pass: CMakeFiles/llvm_pass.dir/build.make
llvm_pass: CMakeFiles/llvm_pass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/ssd/projects/llvm-pass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable llvm_pass"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm_pass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/llvm_pass.dir/build: llvm_pass
.PHONY : CMakeFiles/llvm_pass.dir/build

CMakeFiles/llvm_pass.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/llvm_pass.dir/cmake_clean.cmake
.PHONY : CMakeFiles/llvm_pass.dir/clean

CMakeFiles/llvm_pass.dir/depend:
	cd /mnt/ssd/projects/llvm-pass/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/ssd/projects/llvm-pass /mnt/ssd/projects/llvm-pass /mnt/ssd/projects/llvm-pass/build /mnt/ssd/projects/llvm-pass/build /mnt/ssd/projects/llvm-pass/build/CMakeFiles/llvm_pass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/llvm_pass.dir/depend

