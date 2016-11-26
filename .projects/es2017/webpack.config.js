var SmartBannerPlugin = require('smart-banner-webpack-plugin');

module.exports = {
  entry: ['babel-polyfill', './src/main.js'],
  output: {
    filename: 'out/main.js',
    library: true,
    libraryTarget : 'commonjs2'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader', // 'babel-loader' is also a valid name to reference
        query: {
          presets: ['es2017', 'es2015']
        }
      }
    ]
  },
  plugins: [
    new SmartBannerPlugin('require("source-map-support/register");\n',
        {raw: true, entryOnly: false })
  ],
  devtool: 'source-map'
}

