'use strict';

var As_identifier_constants = require("./as_identifier_constants.js");

var p = {
  x: 5,
  y: 10,
  [zed]: 25
};

console.log(p);

var zed = As_identifier_constants.zed;

exports.zed = zed;
exports.p = p;
/*  Not a pure module */
