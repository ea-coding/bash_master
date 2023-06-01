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

# Bash Background
echo "Before we jump into some exercises, let us learn a little more about Bash."
sleep 2
echo "First of all... What is Bash?"
sleep 2
echo "Bash is a Unix shell and command language (thanks wikipedia)."
sleep 2
echo "In these tutorials, we will focus on Bash as a command language."
sleep 2
echo "In particular, we will learn how you can control your machine using Bash commands and how to write Bash scripts."
echo
sleep 3

# Lesson 1 Logistics
echo "Okay, let's get started!"
sleep 2
echo "In this lesson, we will talk about some useful Bash commands to control your machine."
sleep 3
echo "In particular, we are going to learn about these powerful commands:"
sleep 2
echo "'pwd', 'ls', 'cd', 'mkdir', 'touch', 'find', 'cp' and 'mv'"
sleep 2
echo "If you know these commands, feel free to skip to lesson 2."
echo
sleep 2


# Bash Directory traversals and manipulation
echo "Okay, let's get started!"
sleep 2
echo "In bash, we can type commands into our shell and they yield a certain result."
sleep 2
echo "To follow along this lesson, feel free to open up a different terminal."
sleep 2
echo "It is also fine to put your commands into the input prompt for our purposes."
sleep 2
echo "The input prompts will look as follows."
sleep 2
read -p "Type the command here: " command1
echo "Got command $command1. Cool let's move on!"
echo
sleep 2

# Bash pwd
echo "Let's start with the 'pwd' command."
sleep 2
echo "This command stands for print working directory (a lot of Bash commands are abbreviations)."
sleep 2
echo "As the name suggests, it prints the current working directory."
sleep 2
read -p "Type the 'pwd' command: " pwd_command
check_command "$pwd_command" "pwd"
while [[ "$pwd_command" != "pwd" ]]; do
    read -p "Oops. This is not the pwd command. Try again: " pwd_command
done
pwd_output=$(pwd)
sleep 2
echo "Wow that was so cool!"
sleep 2
echo "We figured out that you are currently in following directory: $pwd_output"
echo
sleep 2

# Bash cd command
echo "We have learned out first bash command: pwd. We can find out which directory we are in."
sleep 2
echo "But what if we want to change directories?"
sleep 2
echo "There is another command that will help us do that."
sleep 2
echo "It is the 'cd' command. cd stands for... change directory (another cool abbreviaton)."
sleep 2
echo "We can use it by putting the name of the destination directory right after it. Example: cd my_dir"
sleep 2
#echo "To get to the directory from which the current program is running, type the folowing command:"
script_directory=$(dirname "$0")
cd "$script_directory"
cd ..
echo "Check our current working directory with a previously learned command."
sleep 2
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
echo "Congratulations, you have succesfully switched into the directory of lesson1."
sleep 2
echo "Now it's time to switch back to the directory before it."
sleep 2
print_and_wait 2 "To do so, we are going to use a neat little trick."
print_and_wait 2 "Each directory contains two other directories by default."
print_and_wait 2 "It contains a representation of itself, a directory called '.'"
print_and_wait 2 "It contains a representation of the directory abvoe it, called '..'"
print_and_wait 2 "If we want to access the directory right before the current one..."
print_and_wait 2 "we can simply call 'cd ..', just like with any other directory."
read -p "Try it out: " cd_command_input4
check_command "$cd_command_input4" "cd .."
cd ..
read -p "Now print the current working directory again: " cd_command_input5
check_command "$cd_command_input5" "pwd"
pwd

# cd_command1="cd $script_directory"

# echo "$cd_command1"
# sleep 2
# read -p "Type the command here: " cd_command1_input
# sleep 2
# check_command "$cd_command1_input" "$cd_command1"
# sleep 2
# echo "Now we are in the directory of lesson1! Great job!"




# do pwd to see how directory changes as we traverse

# cd in absolute paths 
# cd one directory relative
# do cd ..



# Bash ls command
# Try ls
# Bash flags

# Lesson 1 Challenge
echo "Great! Now that you have completed lesson1, I have a challenge for you."
sleep 2
echo "In order to complete this challenge, please only use your terminal."
sleep 2
echo "Run the challenge1.sh file (with this command: 'sh challenge1.sh). Have fun!"
sleep 2
