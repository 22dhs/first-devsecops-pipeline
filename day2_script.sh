#!/bin/bash

# 1. Create a fake secret file to simulate a developer's mistake
echo "DATABASE_PASSWORD=SuperSecret123" > secrets.txt

# 2. Print out what the permissions look like right now
echo "Checking original file permissions..."
ls -l secrets.txt

# 3. THE DEVSECOPS FIX: Lock it down! 
# 'chmod 600' means ONLY the owner can read/write this file. Everyone else is blocked.
echo "Securing the file now..."
chmod 600 secrets.txt

# 4. Print the new secure permissions
echo "New secure permissions applied:"
ls -l secrets.txt
