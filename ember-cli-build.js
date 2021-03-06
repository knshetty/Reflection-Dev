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

  // --- Image assets ---
  let pngImages = 'app/images';
  let researchInterest_Assests = new pickFiles(pngImages, {
    srcDir: 'research',
    files: ['algo.png',
            'dsl.png',
            'infovis.png',
            'mdsd.png',
            'robotics.png'
           ],
    destDir: '/assets/images/research'
  });
  let projects_Assests = new pickFiles(pngImages, {
    srcDir: 'projects',
    files: ['shirehorse_architecture.svg',
            'friesianhorse_architecture.svg',
            'hackneyhorse_architecture.svg',
            'norfolktrotter_architecture.svg',
            'markhor_architecture.svg',
            'nutcracker_rooks_architecture.svg',
            'hornet_architecture.svg',
            'manucode_snailshell_architecture.svg'
           ],
    destDir: '/assets/images/projects'
  });

  // --- Matter.js (2D physics engine) dependencies ---
  app.import('node_modules/matter-js/build/matter.js');
  app.import({
    development: 'node_modules/matter-js/build/matter-dev.js',
    production:  'node_modules/matter-js/build/matter.min.js'
  });
  let svgImages = 'app/images';
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
            'matter-js-logo.svg',
            'snap-svg-logo.svg'
          ],
    destDir: '/assets/images/techstack'
  });

  return new mergeTrees([app.toTree(), researchInterest_Assests, projects_Assests, matterjsAssests]);
};
