// Testacular configuration


// base path, that will be used to resolve files and exclude
basePath = 'temp';


// list of files / patterns to load in the browser
files = [
    MOCHA,
    MOCHA_ADAPTER,

    REQUIRE,
    REQUIRE_ADAPTER,

    // !! libs required for test framework
    {pattern: 'test/vendor/chai.js', included: false},

    // !! put what's in your requirejs 'shim' config here
    'scripts/vendor/angular.js',
    'test/vendor/angular-mocks.js',

    // !! all src and test modules (included: false)
    {pattern: 'scripts/**/*.js', included: false},
    {pattern: 'test/spec/**/*.js', included: false},

    // !! test main require module last
    'test/main.js'
];


// list of files to exclude
exclude = [

];


// test results reporter to use
// possible values: dots || progress
reporter = 'dots';


// web server port
port = 8080;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari
// - PhantomJS
browsers = ['PhantomJS'];


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
