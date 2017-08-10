#!/bin/sh

printHelp() {
    echo "Usage: bash $0 [node|react]"
    exit 1
}

initCommon() {
    mkdir -p src
    npm install --save-dev typescript mocha chai chai-http @types/mocha @types/chai @types/chai-http
}

initNode() {
    npm install --save-dev @types/node
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/node_tsconfig.json -O tsconfig.json
}

initReact() {
    mkdir -p src/components
    npm install --save react react-dom @types/react @types/react-dom
    npm install --save-dev webpack awesome-typescript-loader source-map-loader
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/react_tsconfig.json -O tsconfig.json
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/configs/webpack.config.js
}

if [ $# -ne 1 ]; then
    printHelp()
fi

echo "----- Init Common -----"
case $1 in
    node )
        echo "----- Init Node Project -----"
        initCommon()
        initNode();;
    react )
        echo "----- Init React Project -----"
        initCommon()
        initReact();;
    * )
        printHelp()

exit 0

