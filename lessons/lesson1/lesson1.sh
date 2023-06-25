#!/usr/local/bin/bash

# Lesson 1: Basics
# General introduction to shell commands and flags.
# Commands covered: 'pwd', 'ls', 'pwd', 'echo', 'cat'.


script_dir="$(dirname "$(readlink -f "$0")")"

change_to_lesson1_directory() {
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

print_valid_flag_error() {
    echo "Please provide a valid flag."
    echo "Valid flags are: -pwd, -cd, -ls, -flags, -challenge"
}

# Prints welcome message
welcome_message() {
    # Welcome message
    read -p "Please enter your name: " name
    echo "Hello $name! Welcome to Bash Master!"
    read -p "Are you ready to learn some bash: " response
    while [[ "$response" != "yes" && "$response" != "Yes" ]]; do
        echo "Let's get some more excitement for bash learning!"
        read -p "Are you ready to learn some bash (respond with 'yes'): " response
    done
    echo "Amazing! Let's get the party started!"
    echo
}

print_bash_background() {
    # Bash Background
    print_and_wait 2 "Before we jump into some exercises, let us learn a little more about Bash."
    print_and_wait 2 "First of all... What is Bash?"
    print_and_wait 2 "Bash is a Unix shell and command language (thanks wikipedia)."
    print_and_wait 2 "In these tutorials, we will focus on Bash as a command language."
    print_and_wait 3 "In particular, we will learn how you can control your machine using Bash commands and how to write Bash scripts."
    echo 
}


print_logistics() {
    # Lesson 1 Contents
    print_and_wait 2 "Okay, let's get started!"
    print_and_wait 2 "In this lesson, we will talk about some useful Bash commands to control your machine."
    print_and_wait 2 "In particular, we are going to learn about these powerful commands:"
    print_and_wait 2 "'pwd', 'cd', 'ls', 'echo'"
    print_and_wait 2 "In addition, we are going to learn about flags!"
    print_and_wait 2 "If you know these commands, feel free to skip to lesson 2."
    echo

    # Logistics explanation
    # Bash Directory traversals and manipulation
    print_and_wait 2 "Okay, let's get started!"
    print_and_wait 2 "In bash, we can type commands into our shell and they yield a certain result."
    print_and_wait 2 "To follow along this lesson, feel free to open up a different terminal."
    print_and_wait 2 "It is also fine to put your commands into the input prompt for our purposes."
    print_and_wait 2 "The input prompts will look as follows."
    read -p "Type 'hello' here: " command1
    check_command "$command1" "hello"
    print_and_wait 2 "Let's move on!"
    echo
}


pwd_tutorial() {
    # Bash pwd
    change_to_lesson1_directory
    print_and_wait 2 "Let's start with the 'pwd' command."
    print_and_wait 2 "This command stands for print working directory (a lot of Bash commands are abbreviations)."
    print_and_wait 2 "As the name suggests, it prints the current working directory."
    read_and_exec_command "pwd" "Type the 'pwd' command here:"
    pwd_output=$(pwd)
    print_and_wait 2 "We figured out that you are currently in following directory: $pwd_output"
    echo
}

cd_tutorial() {
    # Bash cd command
    print_and_wait 2 "We have learned out first bash command: pwd. We can find out which directory we are in."
    print_and_wait 2 "But what if we want to change directories?"
    print_and_wait 2 "There is another command that will help us do that."
    print_and_wait 2 "It is the 'cd' command. cd stands for... change directory (another cool abbreviaton)."
    print_and_wait 2 "We can use it by putting the name of the destination directory right after it. Example: cd my_dir"
    #echo "To get to the directory from which the current program is running, type the folowing command:"
    change_to_lesson1_directory
    cd ..
    print_and_wait 2 "Check our current working directory with a previously learned command."
    read_and_exec_command "pwd" "Type the command here:"
    read_and_exec_command "cd lesson1" "Now, change the directory to be lesson1:" "false"
    read_and_exec_command "pwd" "Now, print the current working directory again:"
    print_and_wait 2 "Congratulations, you have succesfully switched into the directory of lesson1."
    print_and_wait 2 "Now it's time to switch back to the directory before it."
    print_and_wait 2 "To do so, we are going to use a neat little trick."
    print_and_wait 2 "Each directory contains two other directories by default."
    print_and_wait 2 "It contains a representation of itself, a directory called '.'"
    print_and_wait 2 "It contains a representation of the directory abvoe it, called '..'"
    print_and_wait 2 "If we want to access the directory right before the current one..."
    print_and_wait 2 "...we can simply call 'cd ..', just like with any other directory."
    read_and_exec_command "cd .." "Try it out:" "false"
    read_and_exec_command "pwd" "Now print the current working directory again:"
    print_and_wait 2 "Great! Now, we know how to change directories!"
    echo
}


ls_tutorial() {
    change_to_lesson1_directory
    print_and_wait 2 "What if we don't know which directories we can change to from our current working directory?"
    print_and_wait 2 "For this to work, we need to know which directories are inside our current working directory."
    print_and_wait 2 "There is a useful command to do this: the 'ls' command (this stands for list)"
    print_and_wait 2 "The 'ls' command lists the files and directories in the current working directory."
    # Enote: Currently bug here
    read_and_exec_command "pwd" "Print the current working directory:"
    read_and_exec_command "ls" "Now list the files in the current working directory:"
    print_and_wait 2 "Great, now we can see the files in the current directory!"
    print_and_wait 2 "We see that we have a file called lesson1.sh and a file challenge1.sh"
    print_and_wait 2 "We also have a direcotry called interesting_dir"
    print_and_wait 2 "Now change the directory to interesting_dir"
    read_and_exec_command "cd interesting_dir" "Type the command here:" "false"
    read_and_exec_command "pwd" "Check your current working directory:"
    read_and_exec_command "ls" "Now list the contents of this directory:" 
    print_and_wait 2 "Amazing! You have learned how the ls command works!"
    echo
}

flags_tutorial() {
    print_and_wait 2 "Let us now learn about flags!"
    print_and_wait 2 "Flags are options that you can set when executing a command."
    print_and_wait 2 "To do this use the following syntax: command -flag1 -flag2"
    print_and_wait 2 "This is very abstract, so let's see a specific example."
    print_and_wait 2 "Do you remember the 'ls' command?"
    print_and_wait 2 "Well it turns out that it can do more than you might have initially thought."
    print_and_wait 2 "Let's explore some of the flags that you can set"
    print_and_wait 2 "A cool flag that you can use for the ls command is the -l flag."
    print_and_wait 2 "This lists all files in long format, giving more information about the files."
    print_and_wait 2 "Before we see what this looks like, let's print the current working directory."
    change_to_lesson1_directory
    read_and_exec_command "pwd" "Enter the appropriate command:"
    print_and_wait 2 "Great! Now change the directory to interesting_dir"
    read_and_exec_command "cd interesting_dir" "Enter the appropriate command:" "false"
    read_and_exec_command "ls -l" "Now try the ls command with the -l flag:"
    # Enote: Maybe explain output
    # print_and_wait 2 "The output of this is a little tricky to parse, but let's go through it."
    print_and_wait 2 "Another amazing flag that we can use the ls command with is the -a flag."
    print_and_wait 2 "This makes ls show you all files, including hidden files."
    print_and_wait 2 "What are hidden files, you might ask. Well let's run the ls -a command and find out."
    read_and_exec_command "ls -a" "Try the ls command with the -a flag:"
    print_and_wait 2 "Inspect the output. Do you see the .secret_file.txt?"
    print_and_wait 2 "It turns out that you can create hidden files and directories."
    print_and_wait 2 "These files start with a . and cannot be viewed directly by users."
    print_and_wait 2 "Now that we have learned about these two cool flags, let's see how we can combine them."
    print_and_wait 2 "You can combine flags as follows: command -flag1 -flag2"
    read_and_exec_command "ls -l -a" "Try it out with 'ls -l -a':"
    print_and_wait 2 "Another way to combine flags is to simply put the letters after one another."
    read_and_exec_command "ls -la" "Try this out 'ls -la':"
    print_and_wait 2 "Amazing! Now we know how to use flags!"

    # ENote: Explain man here?
    # print_and_wait 2 "To look up the flags that you can use with a specific command type 'man command_name'."
    # print_and_wait 2 "For example, you can run the command 'man ls'."
    # print_and_wait 2 "This will show you different flags that you can set."
    # read -p "Try it out with the ls command: " flags_input2
    # check_command "$flags_input2" "man ls"
    # man ls
}

echo_tutorial() {
    print_and_wait 2 "Let's now learn about another useful command: the 'echo' command."
    print_and_wait 2 "This command write text to standard output."
    print_and_wait 2 "You can think of this simply as printing the text that you provide."
    print_and_wait 2 "So, how does it actually work? Well, you simply write echo and then the text."
    print_and_wait 2 "For example, we could write 'echo Hello World'."
    read_and_exec_command "echo Hello World" "Try it out:"
    print_and_wait 2 "Awesome! Now, we know the echo command!"
    echo
}

cat_tutorial() {
    change_to_lesson1_directory
    print_and_wait 2 "Let us end this lesson by learning about the 'cat' command."
    print_and_wait 2 "This command doesn't have anything to do with the pet. It is rather short for concatenate."
    print_and_wait 2 "The cat commands concatenates the output of different files and prints it."
    print_and_wait 2 "We use this command by typing 'cat' and then the files that we want to print."
    print_and_wait 2 "Let's see what files we have in our working directory."
    read_and_exec_command "ls" "Enter the appropriate command:"
    print_and_wait 2 "Did you spot the files example_file1.txt and example_file2.txt?"
    print_and_wait 2 "We can write something like 'cat example_file1.txt' to print the contents of file example_file1.txt."
    read_and_exec_command "cat example_file1.txt" "Try it out:"
    print_and_wait 2 "Amazing! But the second half of the poem is missing."
    print_and_wait 2 "Let's print the entire poem by using cat for both the example_file1.txt and example_file2.txt files."
    read_and_exec_command "cat example_file1.txt example_file2.txt" "Try it out:"
    print_and_wait 2 "Awesome! One could say that I'm something of a poet myself."
    print_and_wait 2 "We can use flags for the 'cat' command as well."
    print_and_wait 2 "When we use the '-n' flag, then we can see the line number of the printed lines in their respective files."
    read_and_exec_command "cat -n example_file1.txt example_file2.txt" "Try it out with example_file1.txt example_file2.txt:"
    print_and_wait 2 "Amazing! Now you now about cat!"
    echo
}



print_challenge() {
    # Lesson 1 Challenge
    print_and_wait 2 "Great! Now that you have completed lesson1, I have a challenge for you."
    print_and_wait 2 "In order to complete this challenge, please only use your terminal."
    print_and_wait 2 "Run the challenge1.sh file (with this command: 'sh challenge1.sh). Have fun!"
}


full_tutorial() {
    welcome_message
    print_bash_background
    print_logistics
    pwd_tutorial
    cd_tutorial
    ls_tutorial
    flags_tutorial
    echo_tutorial
    cat_tutorial
    print_challenge
} 

argc=$#

declare -A key_to_function
key_to_function[0]="pwd_tutorial"
key_to_function[1]="cd_tutorial"
key_to_function[2]="ls_tutorial"
key_to_function[3]="flags_tutorial"
key_to_function[4]="echo_tutorial"
key_to_function[5]="cat_tutorial"
key_to_function[10]="print_challenge"

declare -A command_to_key
command_to_key["-pwd"]=0
command_to_key["-cd"]=1
command_to_key["-ls"]=2
command_to_key["-flags"]=3
command_to_key["-echo"]=4
command_to_key["-cat"]=5
command_to_key["-challenge"]=10

# Check bash version
echo "$BASH_VERSION"

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

