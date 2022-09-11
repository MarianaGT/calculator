const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $:'jquery/src/jquery',
        JQuery: 'jquery/src/jquery'
    }))
module.exports = environment
