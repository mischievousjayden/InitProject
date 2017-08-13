#!/bin/sh

printHelp() {
    echo "Usage: bash $0 [node|nodets|reactts]"
    exit 1
}

initNode() {
    echo "----- Init Node Project -----"
    mkdir -p src
    npm install --save-dev mocha chai chai-http
}

initTSCommon() {
    echo "----- Init Typescript Common -----"
    npm install --save-dev typescript @types/mocha @types/chai @types/chai-http
}

initNodeTS() {
    echo "----- Init Node Project with Typescript -----"
    npm install --save-dev @types/node
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/NodeTS/tsconfig.json
}

initReactTS() {
    echo "----- Init React Project with Typescript-----"
    mkdir -p src/components
    npm install --save react react-dom @types/react @types/react-dom
    npm install --save-dev webpack webpack-dev-server html-webpack-plugin awesome-typescript-loader source-map-loader
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/tsconfig.json
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/webpack.config.js
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/src/index.html -O src/index.html
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/src/index.tsx -O src/index.tsx
    echo "Add following on scripts in package.json ..."
    echo '"start": "webpack-dev-server"'
    echo '"build": "webpack"'
    echo '"clean": "rm -rf dist"'
}

if [ $# -ne 1 ]
then
    printHelp $0
fi

case $1 in
    node )
        initNode;;
    nodets )
        initNode
        initTSCommon
        initNodeTS;;
    reactts )
        initNode
        initTSCommon
        initReactTS;;
    * )
        printHelp $0;;
esac

exit 0

