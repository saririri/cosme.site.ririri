const { environment } = require('@rails/webpacker');

// Babel ローダーを取得
const babelLoader = environment.loaders.get('babel');

if (babelLoader) { 
    // Babel ローダーにプラグインを追加 
    babelLoader.options = babelLoader.options || {};
    babelLoader.options.plugins = [ 
        ...(babelLoader.options.plugins || []), // 既存のプラグインを保持
        '@babel/plugin-proposal-private-methods', // 新しいプラグインを追加 
        ]; 
    } else {
             console.error('Babel loader not found!');
         }

         environment.config.set('entry', './app/javascript/packs/application.js'); 
         
module.exports = environment;
