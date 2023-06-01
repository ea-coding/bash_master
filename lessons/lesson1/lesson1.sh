#!/bin/bash

# Welcome message
read -p "Please enter your name: " name
echo "Hello $name! Welcome to Bash Master!"
read -p "Are you ready to learn some bash: " response
echo "response is $response"

while [[ "$response" != "yes" && "$response" != "Yes" ]]; do
    echo "Let's get some more excitement for bash learning!"
    read -p "Are you ready to learn some bash (respond with 'yes'): " response
done
echo "Amazing! Let's get the party started!"

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
sleep 3

echo "Okay, let's get started!"
sleep 2
echo "In this lesson, we will talk about some useful Bash commands to control your machine."
sleep 3
echo "In particular, we are going to learn about these powerful commands:"
sleep 2
echo "'pwd', 'ls', 'cd', 'mkdir', 'touch', 'find', 'cp' and 'mv'"
sleep 2
echo "If you know these commands, feel free to skip to lesson 2."
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

# Bash pwd
echo "Let's start with the 'pwd' command."
sleep 2
echo "This command stands for print working directory (a lot of Bash commands are abbreviations)."
sleep 2
echo "As the name suggests, it prints the current working directory."
sleep 2
read -p "Type the 'pwd' command: " pwd_command
while [[ "$pwd_command" != "pwd" ]]; do
    read -p "Oops. This is not the pwd command. Try again: " pwd_command
done
pwd_output=$(pwd)
sleep 1
echo "Wow that was so cool!"
echo "We figured out that you are currently in following directory: $pwd_output"

# Bash cd command
