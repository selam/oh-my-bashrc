if [ -e /usr/bin/gofmt ]; then
    if [ -e ${HOME}/workspace ]; then
    	export GOPATH="${HOME}/workspace/go"
        export PATH="${HOME}/workspace/go/bin:${PATH}"
    fi
fi
