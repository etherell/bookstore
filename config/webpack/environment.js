const { environment } = require('@rails/webpacker');
const jquery = require('./plugins/jquery')
const webpack = require('webpack');

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default'],
  Rails: ['@rails/ujs']
}));

environment.plugins.prepend('jquery', jquery)
module.exports = environment;
