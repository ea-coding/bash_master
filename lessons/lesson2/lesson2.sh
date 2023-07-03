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
    rm -rf lesson2_dir/*
}

lesson1_referral() {
    print_and_wait 2 "Hi, welcome to lesson 2!"
    print_and_wait 2 "If you do not know about flags or the pwd, cd, ls, echo and cat commands, check out lesson 1!"
    echo
}

welcome_message() {
    print_and_wait 2 "In this lesson we are going to cover how to work with files and directories in shell scripting."
    print_and_wait 2 "More specifically, we are going to explore the mkdir, touch, rmdir, rm, cp, mv, grep and wc commands."
    print_and_wait 2 "In addition, we are going to look at putting text into files."
    print_and_wait 2 "Ready? Let's get started!"
    echo
}

mkdir_tutorial() {
    change_to_lesson2_directory
    print_and_wait 2 "We are now going to learn about the mkdir command."
    print_and_wait 2 "mkdir stands for make directory"
    print_and_wait 2 "And as the name suggests, it allows you to make a new directory."
    print_and_wait 2 "You make a new directory by typing 'mkdir directory_name'"
    print_and_wait 2 "Let's try it out!"
    read_and_exec_command "pwd" "Print the current working directory:"
    read_and_exec_command "cd lesson2_dir" "Change the directory to lesson2_dir:"
    read_and_exec_command "pwd" "Print the current working directory again:"
    read_and_exec_command "ls" "Now list the contents of this directory:"
    read_and_exec_command "mkdir new_dir" "Now make a new directory called 'new_dir':"
    read_and_exec_command "ls" "Now list the contents of this directory again:"
    print_and_wait 2 "Amazing! Let's now learn about a useful mkdir flag."
    print_and_wait 2 "It's the -p flag. It not only allows you to create a directory, but also all intermediate directories."
    print_and_wait 2 "Say, I want to create a directory called inner_dir inside a directory called outer_dir..."
    print_and_wait 2 "... and both directories don't exist, we can create both as follows:"
    print_and_wait 2 "mdkir -p outer_dir/inner_dir"
    read_and_exec_command "ls" "Check the contents of the current working directory:"
    read_and_exec_command "mkdir -p outer_dir/inner_dir" "Now create the directory inner_dir inside of the directory outer_dir:"
    read_and_exec_command "ls" "Check the contents of the current working directory again:"
    read_and_exec_command "cd outer_dir" "Now change the directory to be outer_dir:"
    read_and_exec_command "pwd" "Print the working directory:"
    read_and_exec_command "ls" "Check the contents of the the directory:"
    print_and_wait 2 "Amazing work!"
    echo
    change_to_lesson2_directory
    clean_files_and_directories
}

touch_tutorial() {
    change_to_lesson2_directory
    print_and_wait 2 "We will now learn about the 'touch' command."
    print_and_wait 2 "Similar to the mkdir command, the touch command allows you to create a new file."
    print_and_wait 2 "We would do so as follows: touch file.txt."
    read_and_exec_command "cd lesson2_dir" "Change the directory to lesson2_dir:"
    read_and_exec_command "pwd" "Print the current working directory:"
    read_and_exec_command "mkdir file_dir" "Now, create a directory called 'file_dir':"
    read_and_exec_command "ls" "List the contents of the current working directory:"
    read_and_exec_command "cd file_dir" "Now change the directory to this new directory:"
    read_and_exec_command "touch file.txt" "Now create a file called 'file.txt':"
    read_and_exec_command "ls" "List the contents of the current working directory:"
    print_and_wait 2 "If you want to create multiple files at once, you can just specify multiple filenames after the touch command."
    read_and_exec_command "touch first_file.txt second_file.txt" "Create two files: first_file.txt and second_file.txt:"
    read_and_exec_command "ls" "List the contents of the directory:"
    print_and_wait 2 "Amazing, now we know how the 'touch' command works!"
    echo
    change_to_lesson2_directory
    clean_files_and_directories
}

full_tutorial() {
    welcome_message
    mkdir_tutorial
    touch_tutorial
}


argc=$#

declare -A key_to_function
key_to_function[0]="mkdir_tutorial"
key_to_function[1]="touch_tutorial"
key_to_function[2]="rm_tutorial"
key_to_function[3]="cp_tutorial"
key_to_function[4]="mv_tutorial"
key_to_function[5]="grep_tutorial"
key_to_function[6]="wc_tutorial"
key_to_function[10]="print_challenge"

declare -A command_to_key
command_to_key["-mkdir"]=0
command_to_key["-touch"]=1
command_to_key["-rm"]=2
command_to_key["-cp"]=3
command_to_key["-mv"]=4
command_to_key["-grep"]=5
command_to_key["-wc"]=6
command_to_key["-challenge"]=10

# Check bash version
echo "$BASH_VERSION"

clean_files_and_directories
lesson1_referral

if [ $argc -gt 10 ]
then
    echo "Number of command line arguments is too large (must be less than 9)."

elif [ $argc -eq 0 ]
then 
    full_tutorial
else

    # Use associative array as set
    declare -A seen_set

    for input in "$@"
    do
        # is valid input
        if [[ ${command_to_key[$input]+_} ]]
        then
            # command does not already exist
            new_key=${command_to_key["$input"]}
            if [[ ! ${seen_set[$new_key]} ]]
            then
                seen_set[$new_key]=1
            fi
        fi
    done

    sorted_keys=($(echo "${!seen_set[@]}" | tr ' ' '\n' | sort -n))

    for key in "${sorted_keys[@]}"
    do
        eval "${key_to_function[$key]}"
    done
fi
