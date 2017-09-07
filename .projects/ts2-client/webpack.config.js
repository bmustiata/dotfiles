var fs = require("fs")
var CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
  entry: ['babel-polyfill', './src/ts/main.ts'],
  output: {
    filename: 'out/public/js/client.js',
  },
  resolve: {
    extensions: ['', '.ts', '.tsx', '.js']
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
        test: function(name) {
          console.log(name);

          if (/\.tsx?$/.test(name)) {
            return true;
          }

          if (!/\./.test(name)) {
            return true;
          }

          return false;
        },
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

