// Karma configuration
// Generated on Wed Feb 25 2015 19:08:56 GMT+0000 (WET)

module.exports = function(config) {
  config.set({

    plugins: [
	    'karma-jquery',
	    'karma-mocha',
	    'karma-chrome-launcher',
	    'karma-firefox-launcher',
	    'karma-phantomjs-launcher',
	    'karma-html2js-preprocessor',
	    'karma-sinon'
    ],
    
    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['mocha','jquery-1.8.3','sinon'],
    

    client: {
          mocha: {
            ui: 'tdd'
          }
    },
    
    
    // list of files / patterns to load in the browser
    files: [
      'public/tests/test.html',
      'public/tests/*.js',
      'http://127.0.0.1:5000/views/tests.js',
      'http://127.0.0.1:5000/views/main.js',
      //'https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js',
      //'https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'
    ],
    
    
    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
          'public/tests/test.html': ['html2js']
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome', 'Firefox' , 'PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
