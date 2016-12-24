

function _traverse() {
  for PTH in "${1}"/*; do
    if [ -L  ${PTH}  ]; then
      continue
    fi
    if [ -d ${PTH} ]; then
      if [ -z "${PTH##*\.git*}" ];  then
         continue
      fi;
      if [ -z "${PTH##*$2*}" ];  then
        if [ -f "${PTH}/deploy.txt" ]; then
          echo "${PTH}"
        fi
          continue
      fi
      _traverse "${PTH}" ${2}
    fi
  done;
}


function go-deploy() {
     # check GOPATH is set
     if [ "${GOPATH}x" == "x" ]; then
       echo "GOPATH is not set as ENV variable"
       return -1
     fi;

     # check if any argument is given
     if [ $1 == "" ]; then
       echo "You must give a argument to deploy "
       return -1
     fi

     # search GOAPTH's, more than one path is ok
     while IFS=':' read -ra _PATHS; do
       for _PATH in "${_PATHS[@]}"; do
         count=0
         # search in path's for given project name
         PROJECTS=`_traverse "${_PATH}/src" "${1}"`
         #how many project we found
         for project in  $PROJECTS; do
           # do we have a deploy.txt in project root?
             count=$(( $count + 1 ))
         done;

        # more than one project in same gopath than we have a conflict
        if [ $count -eq 2 ]; then
           echo "we found a conflict, multiple '${1}' in same GOPATH;  resolving this issue you make sure to"
           echo "give more distinct name or path file project"
           return -1
        fi;

        if [[ $count -eq 0 ||  -z $PROJECTS ]]; then
          echo "${1} is not found in GOPATH envs, make sure you have deploy.txt in your project root"
          return -1
        fi

        # execute deploy.txt
        while IFS="" read -r line; do
          eval ${line}
          if [ "$?" -ne 0 ]; then
            echo "We got error while executing ${line}"
            return -1
          fi;
        done < "${PROJECTS}/deploy.txt";
        return 0
       done
     done <<< $GOPATH
}
