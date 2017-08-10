#!/bin/sh

printHelp() {
    echo "Usage: bash $0 [node|react]"
    exit 1
}

initCommon() {
    echo "----- Init Common -----"
    mkdir -p src
    npm install --save-dev typescript mocha chai chai-http @types/mocha @types/chai @types/chai-http
}

initNode() {
    echo "----- Init Node Project -----"
    npm install --save-dev @types/node
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/node_tsconfig.json -O tsconfig.json
}

initReact() {
    echo "----- Init React Project -----"
    mkdir -p src/components
    npm install --save react react-dom @types/react @types/react-dom
    npm install --save-dev webpack awesome-typescript-loader source-map-loader
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/react_tsconfig.json -O tsconfig.json
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/webpack.config.js
}

if [ $# -ne 1 ]
then
    printHelp $0
fi

case $1 in
    node )
        initCommon
        initNode;;
    react )
        initCommon
        initReact;;
    * )
        printHelp $0;;
esac

exit 0

