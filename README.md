# Oh My Bashrc

This repo contains my usefull scripts for bashrc for simple needs like activate virtuanenv automaticly or set the gopath in my sessions.

If you have useful .bashrc functions let me know


# Installtion

first clone repo into `~/.bashrc.d` directory
and then edit your ~/.bashrc with your favorite editor and these lines

`git clone http://github.com/selam/oh-my-bashrc ~/.bashrc.d`

```bash
if [ -e ~/.bashrc.d ]; then
	for BASHRC in ~/.bashrc.d/*.bashrc; do
	   source ${BASHRC}
	done
fi
```


# Available commands/shortcuts

`go-deploy`

go-deploy searches first argument inside of your GOPATH's and if found a directory given contains your argument then it looks `deploy.txt` inside of project, if found execute this file line by line, if there is a any error while executing file it stops,

you can define variable and use it inside of deploy.txti you can use directly any variable and commands

each command or defination must be one line 

# Available features

`auto activate virtual env`   

it searches .env dir in current directory if it found execute source .env/bin/activate

`auto export android sdk and platform tools`   

it searches `android-sdk` directory in your $HOME/workspace, if it found export `ANDROID_HOME` and adds `sdk-tools` with `platform-tools` into your `PATH` envrioment variable

`dot bin in home directory`

it search `.bin` directory in your `$HOME`, if it found then adds into your PATH envrioment variable

`auto export GOPATH`

it search `go` directory inside of `$HOME/workspace`, if it found export `GOPATH` envrioment variable and adds `$HOME/workspace/go/bin` directory into your PATH envrioment varibale
