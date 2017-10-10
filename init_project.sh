#!/bin/sh

printHelp() {
    echo "Usage: bash $0 [nodejs|reactjs|nodets|reactts]"
    exit 1
}

initJSUnitTest() {
    echo "----- Init JS Unit Test -----"
    npm install --save-dev mocha chai chai-http
    echo "Add following in package.json ..."
    echo '"test": "mocha"'
}

initReactJS() {
    echo "----- Init ReactJS Project -----"

    mkdir -p src/components

    npm install --save react react-dom
    npm install --save-dev webpack webpack-dev-server html-webpack-plugin
    npm install --save-dev babel-core babel-loader babel-preset-env babel-preset-react

    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactJS/webpack.config.js
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactJS/src/index.html -O src/index.html
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactJS/src/index.jsx -O src/index.jsx
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactJS/src/components/Layout.jsx -O src/components/Layout.jsx

    echo "Add following in package.json ..."
    echo '"build": "webpack"'
    echo '"start-dev": "webpack-dev-server"'
    echo '"clean": "rm -rf dist"'
}

initTSCommon() {
    echo "----- Init Typescript Common -----"
    npm install --save-dev typescript @types/node
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/NodeTS/tsconfig.json
}

initTSUnitTest() {
    echo "----- Init TS Unit Test -----"
    npm install --save-dev @types/mocha @types/chai @types/chai-http
}

initReactTS() {
    echo "----- Init React Project with Typescript -----"

    mkdir -p src/components

    npm install --save-dev typescript @types/node
    npm install --save react react-dom
    npm install --save-dev @types/react @types/react-dom
    npm install --save-dev webpack webpack-dev-server html-webpack-plugin
    npm install --save-dev awesome-typescript-loader source-map-loader

    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/tsconfig.json
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/webpack.config.js
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/src/index.html -O src/index.html
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/src/index.tsx -O src/index.tsx
    wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/ReactTS/src/components/Layout.tsx -O src/components/Layout.tsx

    echo "Add following in package.json ..."
    echo '"build": "webpack"'
    echo '"start-dev": "webpack-dev-server"'
    echo '"clean": "rm -rf dist"'
}

if [ $# -ne 1 ]
then
    printHelp $0
fi

case $1 in
    nodejs )
        initJSUnitTest;;
    reactjs )
        initJSUnitTest
        initReactJS;;
    nodets )
        initJSUnitTest
        initTSCommon
        initTSUnitTest;;
    reactts )
        initJSUnitTest
        # initTSCommon
        initTSUnitTest
        initReactTS;;
    * )
        printHelp $0;;
esac

exit 0

