echo
echo "Let's check your git configuration..."
sleep 0.5

email=$(git config --global --get user.email)
name=$(git config --global --get user.name)

if [ "$email" != "git" -a "$name" != "git" -a "$name" -a "$email" ]
then 
    echo
    echo "Git looks like it's already set up!"
    echo
    echo "We'll run a few preliminary tasks and then need some more input from you."
    sleep 1
fi

if [ ! "$email" -o "$email" = "git" ]
then 
    echo
    echo "What email address is associated with GitHub?"
    read email;
    $(git config --global --add user.email "$email")
    echo
    echo "Git now knows your email is: $email"
    sleep 0.5
fi

if [ ! "$name" -o "$name" = "git" ]
then 
    echo
    echo "What's your name?"
    read name;
    $(git config --global --add user.name "$name")
    echo
    echo "Git now knows your name is: $name"
    sleep 0.5
fi

if [[ "$(gh config list)" != *"ssh"* ]]
then
    echo
    echo "Signing you into the GitHub CLI..."
    echo "This will automatically configure an SSH key for you"
    sleep 2
    # This command will prompt the user to connect to GH via a web browser, generating an SSH key as needed
    gh auth login
fi
