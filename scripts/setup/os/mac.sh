IS_M1_MAC=false

if sysctl -n machdep.cpu.brand_string 2> /dev/null | grep -q "^Apple M1"
then
    IS_M1_MAC=true
fi

if "$IS_M1_MAC" && [[ $(uname -p) == "arm" ]]
then
    echo
    echo "Let's install Rosetta for M1 chip compatibility..."
    sleep 0.5

    sudo softwareupdate --install-rosetta
fi

export HOMEBREW_NO_ENV_HINTS=true
# If Homebrew is not installed install it, otherwise update it
if [[ $(command -v brew) == "" ]]
then
    echo
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Homebrew on M1 macs installs to /opt/homebrew instead of /usr/local, so won't be picked up
    # without some help
    if "$IS_M1_MAC" && command -v brew >/dev/null
    then
        # Modify both the bash and zsh profiles to make sure the configuration gets picked up
        # regardless of shell
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> tee -a ~/.profile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> tee -a ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo
    echo "Updating Homebrew..."
    brew update > /dev/null
fi


echo
echo "Homebrew is ready for use"
sleep 1


if [[ $(command -v gh) == "" ]]
then
    echo
    echo "Installing script dependencies..."
    brew install --quiet gh ansible
fi

sleep 1
echo
echo "Dependencies installed..."
