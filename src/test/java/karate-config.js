function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
// Generate Global variable from PizzaToken.feature file using callSingle()
  var result = karate.callSingle('classpath:examples/users/PizzaToken.feature');
  config.token = result.token;
  config.table = result.table;
  return config;
}