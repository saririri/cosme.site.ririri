const { environment } = require('@rails/webpacker');

// Babel ローダーを取得
const babelLoader = environment.loaders.get('babel');

// Babel ローダーにプラグインを追加
babelLoader.options.plugins = [
  ...(babelLoader.options.plugins || []), // 既存のプラグインを保持
  '@babel/plugin-proposal-private-methods', // 新しいプラグインを追加
];

module.exports = environment;
