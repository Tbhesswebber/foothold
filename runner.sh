#! /bin/bash 


echo "Let's get your computer set up!"
sleep 1

echo
echo "This process will ask a few questions before performing a few provisional installations.  Once you see a message that says, 'Feel free to step away from your computer', you won't need to provide any more input as the process completes."
sleep 2

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        source ./scripts/setup/os/ubuntu.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
        source ./scripts/setup/os/mac.sh
else
    echo ""
    echo ""
    echo "\e[31mThis tool is not configured for use with your operating system.\e[0m"
    echo ""
    echo ""
    exit(1)
fi

source ./scripts/setup/git.sh

sleep 0.5
echo
echo "You should be good to step away from your computer at this point."

ansible-playbook -K ./local.yml
