function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://api.demoblaze.com'
  }
  if (env == 'dev') {
    config.userName = 'testPrueb@1'
    config.password = 'Test123'
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}