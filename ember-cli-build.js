'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');
const mergeTrees = require('broccoli-merge-trees');
const pickFiles = require('broccoli-funnel');

module.exports = function(defaults) {

  let app = new EmberApp(defaults, {
    'ember-bootstrap': {
      'bootstrapVersion': 4,
      'importBootstrapFont': true,
      'importBootstrapCSS': true,
      'importBootstrapTheme': true,
      'whitelist': ['bs-alert', 'bs-button', 'bs-collapse', 'bs-modal', 'bs-nav', 'bs-navbar', 'bs-tab']
    }
  });

  // Use `app.import` to add additional libraries to the generated
  // output files.
  //
  // If you need to use different assets in different
  // environments, specify an object as the first parameter. That
  // object's keys should be the environment name and the values
  // should be the asset to use in that environment.
  //
  // If the library that you are including contains AMD or ES6
  // modules that you would like to import into your application
  // please specify an object with the list of modules as keys
  // along with the exports of each module as its value.

  // --- Matter.js (2D physics engine) dependencies ---
  app.import('node_modules/matter-js/build/matter.js');
  app.import({
    development: 'node_modules/matter-js/build/matter-dev.js',
    production:  'node_modules/matter-js/build/matter.min.js'
  });
  let svgImages = 'app/svgs';
  let matterjsAssests = new pickFiles(svgImages, {
    srcDir: 'techstack',
    files: ['coffeescript-logo.svg',
            'emberjs-logo.svg',
            'broccoli-logo.svg',
            'html5-logo.svg',
            'handlebars-logo.svg',
            'bootstrap-logo.svg',
            'jquery-logo.svg',
            'impress-js-logo.svg',
            'mapbox-logo.svg',
            'matter-js-logo.svg'],
    destDir: '/assets/images'
  });

  return new mergeTrees([app.toTree(), matterjsAssests]);
};
