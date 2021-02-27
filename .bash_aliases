shopt -s expand_aliases

# Clang-tools alias
alias clang_tidy_ros='run-clang-tidy -p $CATKIN_WS/build/ ' 
# Apply clang-format on current directory
alias clang_format_directory='clang-format-10 -i -style=file *.cpp *.h src/*.cpp include/*.h' 

