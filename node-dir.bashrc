# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin/node-v4.4.5-linux-x64/" ] ; then
    export PATH="$HOME/.bin/node-v4.4.5-linux-x64/bin:$PATH"
fi
