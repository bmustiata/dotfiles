var fs = require("fs")
var CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
  entry: ['babel-polyfill', './src/ts/main.ts'],
  output: {
    filename: 'out/public/js/client.js',
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.tsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader?presets=es2015!ts-loader',
      }
    ]
  },
  plugins: [
    new CopyWebpackPlugin([
    {
        from: 'src/html',
        to: 'out/public'
    }
    ])
  ],
  devtool: 'source-map'
}

