if [[ -e /usr/bin/gofmt || -e ~/.bin/golang/bin/gofmt ]]; then
    if [ -e ${HOME}/workspace ]; then
    	export GOPATH="${HOME}/workspace/go"
        export PATH="${HOME}/workspace/go/bin:${PATH}"
    fi
fi

if [ -e ~/.bin/golang/bin/gofmt ]; then
   export GOROOT=~/.bin/golang
   export PATH="${HOME}/.bin/golang/bin:${PATH}"
fi
