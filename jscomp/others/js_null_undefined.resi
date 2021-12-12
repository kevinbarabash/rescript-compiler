@@ocaml.text(
  /* Copyright (C) 2015-2016 Bloomberg Finance L.P.
   *
   * This program is free software: you can redistribute it and/or modify
   * it under the terms of the GNU Lesser General Public License as published by
   * the Free Software Foundation, either version 3 of the License, or
   * (at your option) any later version.
   *
   * In addition to the permissions granted to you by the LGPL, you may combine
   * or link a "work that uses the Library" with a publicly distributed version
   * of this file to produce a combined library or application, then distribute
   * that combined work under the terms of your choosing, with no requirement
   * to comply with the obligations normally placed on you by section 4 of the
   * LGPL version 3 (or the corresponding section of a later version of the LGPL
   * should you choose to use a later version).
   *
   * This program is distributed in the hope that it will be useful,
   * but WITHOUT ANY WARRANTY; without even the implied warranty of
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   * GNU Lesser General Public License for more details.
   *
   * You should have received a copy of the GNU Lesser General Public License
   * along with this program; if not, write to the Free Software
   * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

  " Contains functionality for dealing with values that can be both `null` and `undefined` "
)

@ocaml.doc(" Local alias for `'a Js.null_undefined` ")
type t<+'a> = Js.null_undefined<'a>

@ocaml.doc(" Constructs a value of `'a Js.null_undefined` containing a value of `'a` ")
external return: 'a => t<'a> = "%identity"

@ocaml.doc(" Returns `true` if the given value is `null` or `undefined`, `false` otherwise ")
external isNullable: t<'a> => bool = "#is_nullable"

@ocaml.doc(" The `null` value of type `'a Js.null_undefined` ")
external null: t<'a> = "#null"

@ocaml.doc(" The `undefined` value of type `'a Js.null_undefined` ")
external undefined: t<'a> = "#undefined"

@ocaml.doc("
  Maps the contained value using the given function

  If `'a Js.null_undefined` contains a value, that value is unwrapped, mapped to a `'b` using
  the given function `a' -> 'b`, then wrapped back up and returned as `'b Js.null_undefined`

  ```
  let maybeGreetWorld (maybeGreeting: string Js.null_undefined) =
    Js.Undefined.bind maybeGreeting (fun greeting -> greeting ^ \" world!\")
  ```
")
let bind: (t<'a>, (. 'a) => 'b) => t<'b>

@ocaml.doc("
  Iterates over the contained value with the given function

  If `'a Js.null_undefined` contains a value, that value is unwrapped and applied to
  the given function.

  ```
  let maybeSay (maybeMessage: string Js.null_undefined) =
    Js.Null_undefined.iter maybeMessage (fun message -> Js.log message)
  ```
")
let iter: (t<'a>, (. 'a) => unit) => unit

@ocaml.doc("
  Maps `'a option` to `'a Js.null_undefined`

  `Some a` -> `return a`
  `None` -> `undefined`
")
let fromOption: option<'a> => t<'a>

@deprecated("Use fromOption instead") let from_opt: option<'a> => t<'a>

@ocaml.doc("
  Maps `'a Js.null_undefined` to `'a option`

  `return a` -> `Some a`
  `undefined` -> `None`
  `null` -> `None`
")
external toOption: t<'a> => option<'a> = "#nullable_to_opt"

@deprecated("Use toOption instead") external to_opt: t<'a> => option<'a> = "#nullable_to_opt"
