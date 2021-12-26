'use strict';

var Sql = require("sql").default;

var table = "users";

var id = "5";

var query = Sql([
      "SELECT * FROM ",
      " WHERE id = ",
      ""
    ], table, id);

exports.table = table;
exports.id = id;
exports.query = query;
/* query Not a pure module */
