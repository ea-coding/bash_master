#!/usr/local/bin/bash

# Lesson 2: 
# Introduction to files and directories in Bash with piping.
# Commands covered: mkdir, touch, rmdir, rm, cp, mv, cat, putting data into files, grep, wc

script_dir="$(dirname "$(readlink -f "$0")")"

change_to_lesson2_directory() {
    cd "$script_dir"
}

# Checks whether given command is what we expected
check_command() {
    local given_input="$1"
    local expected_input="$2"
    while [[ "$given_input" != "$expected_input" ]]; do
        read -p "Oops. This is not the $expected_input command. Try again: " given_input
    done
    echo "Well done!"
}

read_and_exec_command() {
    local expected="$1"
    local output_message="$2"
    local print_output="$3"
    read -p "$output_message " given
    check_command "$given" "$expected"
    if [[ "$print_output" != "false" ]]
    then
        echo "Output: "
    fi
    eval "$expected"
}

print_and_wait() {
    local time="$1"
    local statement="$2"
    echo "$statement"
    sleep "$time"
}

# Removes all files and directories from lesson2_dir
clean_files_and_directories() {
    change_to_lesson2_directory
    cd lesson2_dir
    # remove all files and directories
}

welcome_message() {
    print_and_wait 2 "Hi, welcome to lesson 2! If you do not know about flags or the pwd, cd, ls, echo and cat commands, check out lesson 1!"
    print_and_wait 2 "In this lesson we are going to cover how to work with files and directories in shell scripting."
    print_and_wait 2 "More specifically, we are going to explore the mkdir, touch, rmdir, rm, cp, mv, cat, grep and wc commands."
    print_and_wait 2 "In addition, we are going to look at putting text into files."
    print_and_wait 2 "Ready? Let's get started!"
}


full_tutorial() {
    clean_files_and_directories
    welcome_message
}
