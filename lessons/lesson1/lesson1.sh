#!/bin/bash

# Checks whether given command is what we expected
check_command() {
    local given_input="$1"
    local expected_input="$2"
    while [[ "$given_input" != "$expected_input" ]]; do
        read -p "Oops. This is not the $expected_input command. Try again: " given_input
    done
    echo "Well done!"
}

print_and_wait() {
    local time="$1"
    local statement="$2"
    echo "$statement"
    sleep "$time"
}

print_valid_flag_error() {
    echo "Please provide a valid flag."
    echo "Valid flags are: -pwd, -cd, -challenge"
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
    print_and_wait 2 "'pwd', 'ls', 'cd', 'mkdir', 'touch', 'find', 'cp' and 'mv'"
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
    print_and_wait 2 "Let's start with the 'pwd' command."
    print_and_wait 2 "This command stands for print working directory (a lot of Bash commands are abbreviations)."
    print_and_wait 2 "As the name suggests, it prints the current working directory."
    read -p "Type the 'pwd' command: " pwd_command
    check_command "$pwd_command" "pwd"
    pwd_output=$(pwd)
    sleep 2
    echo "$pwd_output"
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
    script_directory=$(dirname "$0")
    cd "$script_directory"
    cd ..
    print_and_wait 2 "Check our current working directory with a previously learned command."
    read -p "Type it here: " cd_command_input1
    check_command "$cd_command_input1" "pwd"
    pwd
    sleep 2
    read -p "Now, change the directory to be lesson1: " cd_command_input2
    check_command "$cd_command_input2" "cd lesson1"
    cd lesson1
    sleep 2
    read -p "Now, check the current directory again: " cd_command_input3
    check_command "$cd_command_input3" "pwd"
    pwd
    print_and_wait 2 "Congratulations, you have succesfully switched into the directory of lesson1."
    print_and_wait 2 "Now it's time to switch back to the directory before it."
    sleep 2
    print_and_wait 2 "To do so, we are going to use a neat little trick."
    print_and_wait 2 "Each directory contains two other directories by default."
    print_and_wait 2 "It contains a representation of itself, a directory called '.'"
    print_and_wait 2 "It contains a representation of the directory abvoe it, called '..'"
    print_and_wait 2 "If we want to access the directory right before the current one..."
    print_and_wait 2 "...we can simply call 'cd ..', just like with any other directory."
    read -p "Try it out: " cd_command_input4
    check_command "$cd_command_input4" "cd .."
    cd ..
    read -p "Now print the current working directory again: " cd_command_input5
    check_command "$cd_command_input5" "pwd"
    pwd
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
    print_challenge
} 

argc=$#

if [ $argc -eq 0 ]
then 
    full_tutorial
else
    first_arg=$1
    if [ "$first_arg" == "-pwd" ] 
    then
        pwd_tutorial
    elif [ "$first_arg" == "-cd" ]
    then
        cd_tutorial
    elif [ "$first_arg" == "-challenge" ]
    then
        print_challenge
    else
        print_valid_flag_error
    fi
fi



# do pwd to see how directory changes as we traverse

# cd in absolute paths 
# cd one directory relative
# do cd ..



# Bash ls command
# Try ls
# Bash flags

