@module("sql") @variadic external sql: (array<string>, array<string>) => string = "default"

let table = "users"
let id = "5"

let query = sql`SELECT * FROM ${table} WHERE id = ${id}`
