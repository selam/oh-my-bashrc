# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/workspace/android-sdk" ] ; then
    export PATH="$HOME/workspace/android-sdk/tools:$HOME/workspace/android-sdk/platform-tools:$PATH"
    export ANDROID_HOME="$HOME/workspace/android-sdk"
fi

