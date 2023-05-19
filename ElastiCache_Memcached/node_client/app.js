var Memcached = require('memcached');

//var clusterEndpoint = "<INSERT_CLUSTER_ENDPOINT>";
var clusterEndpoint = "deletemeeccluster.llgnjm.cfg.use2.cache.amazonaws.com";

var memcached = new Memcached(clusterEndpoint+':11211');

function setValue(key, value) {
  /* Set 'key' to 'value' */
  memcached.set('foo', 'bar', 30, function (err) { 
    if (err) {
      console.log("setValue(key: " + key + "):: SET ERROR: " + err);
    } else {
      console.log("setValue(key: " + key + ", value: " + value + "):: set with 30 second timeout.");
    }
  });
}

function getValue(key) {
  /* get 'value' of 'key' */
  memcached.get(key, function (err, data) {
    if (err) {
      console.log("getValue("+key+"):: GET ERROR: " + err);
    } else {
      console.log("getValue("+key+"):: value: " + data);
    }
  });
}


// Set a value
console.log("Calling putValue");
setValue("now", Date.now());

// Read the value
setTimeout(
  function() { 
    console.log("Calling getValue 5 seconds after put"); 
    getValue("now"); 
  }, 5000);

// Read the value after the timeout
setTimeout(
  function() { 
    console.log("Calling getValue 31 seconds after put"); 
    getValue("now"); 
  }, 31000);
