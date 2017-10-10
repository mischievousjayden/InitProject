var path = require("path");
var HtmlWebpackPlugin = require("html-webpack-plugin");


module.exports = {
    entry: path.resolve(__dirname, "src/index.jsx"),

    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "bundle.js"
    },

    resolve: {
        extensions: [".jsx", ".js", ".json"]
    },

    module: {
        rules: [
            {
                test: /\.jsx?$/, // .js or jsx
                include: path.resolve(__dirname, "src"),
                exclude: /node_modules/,
                loader: "babel-loader",
                options: {
                    "presets": ["env", "react"]
                }
            }
        ]
    },

    devServer: {
        contentBase: path.join(__dirname, "dist"),
        compress: true,
        port: 8080
    },

    plugins: [
        new HtmlWebpackPlugin({
            template: path.join(__dirname, "src/index.html")
        }),
    ]
};

