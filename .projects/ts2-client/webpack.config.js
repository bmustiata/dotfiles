var fs = require("fs")

module.exports = {
  entry: ['babel-polyfill', './src/ts/main.ts'],
  output: {
    filename: 'out/main.js',
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
  devtool: 'source-map'
}

