npm install
npm install hexo-deployer-git --save

npm uninstall hexo-renderer-marked --save
npm install hexo-renderer-kramed --save
cp config/index.js node_modules/kramed/lib/rules/inline.js -a

npm uninstall hexo-asset-image --save
npm install https://github.com/CodeFalling/hexo-asset-image --save
cp config/index.js node_modules/hexo-asset-image/index.js -a
