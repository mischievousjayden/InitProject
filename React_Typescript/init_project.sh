#!/bin/bash

mkdir -p dist src/components
npm install --save react react-dom @types/react @types/react-dom
npm install --save-dev webpack typescript awesome-typescript-loader source-map-loader
wget https://raw.githubusercontent.com/mischievousjayden/InitProject/master/React_Typescript/tsconfig.json

