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

@@deprecated("Use Belt.Array instead")

type t<'a> = array<'a>

let filterInPlace: ((. 'a) => bool, t<'a>) => unit

let empty: t<'a> => unit

let pushBack: ('a, t<'a>) => unit

@ocaml.doc(" shallow copy ")
let copy: t<'a> => t<'a>

let memByRef: ('a, t<'a>) => bool

let iter: ((. 'a) => unit, t<'a>) => unit
let iteri: ((. int, 'a) => unit, t<'a>) => unit

/* [@@deprecated "Use Js.List.toVector instead"] */
/* val ofList : 'a list -> 'a t */
/* removed, we choose that [`Js.List`]() depends on Vector to avoid cylic dependency
 */

let toList: t<'a> => list<'a>

let map: ((. 'a) => 'b, t<'a>) => t<'b>
let mapi: ((. int, 'a) => 'b, t<'a>) => t<'b>
let foldLeft: ((. 'a, 'b) => 'a, 'a, t<'b>) => 'a
let foldRight: ((. 'b, 'a) => 'a, t<'b>, 'a) => 'a
@ocaml.doc(" **return** the length (number of elements) of the given array. ")
external length: t<'a> => int = "%array_length"

@ocaml.doc("
  `Array.get a n` returns the element number `n` of array `a`.
  The first element has number 0.
  The last element has number `Array.length a - 1`.
  You can also write `a.(n)` instead of `Array.get a n`.

  **raise** `Invalid_argument \"index out of bounds\"`
  if `n` is outside the range 0 to `Array.length a - 1`.
")
external get: (t<'a>, int) => 'a = "%array_safe_get"

@ocaml.doc("
  `Array.set a n x` modifies array `a` in place, replacing
  element number `n` with `x`.
  You can also write `a.(n) <- x` instead of `Array.set a n x`.

  **raise** `Invalid_argument \"index out of bounds\"`
  if `n` is outside the range 0 to `Array.length a - 1`.
")
external set: (t<'a>, int, 'a) => unit = "%array_safe_set"

@ocaml.doc("
  `Array.make n x` returns a fresh array of length `n`,
  initialized with `x`.
  All the elements of this new array are initially
  physically equal to `x` (in the sense of the `==` predicate).
  Consequently, if `x` is mutable, it is shared among all elements
  of the array, and modifying `x` through one of the array entries
  will modify all other entries at the same time.

  **raise** `Invalid_argument` if `n < 0` or `n > Sys.max_array_length`.
  If the value of `x` is a floating-point number, then the maximum
  size is only `Sys.max_array_length / 2`.
")
external make: (int, 'a) => t<'a> = "?make_vect"

@ocaml.doc("
  **param** n size

  **param** fn callback

  **raise** RangeError when `n` is negative
")
let init: (int, (. int) => 'a) => t<'a>

@ocaml.doc(" `append x a` returns a fresh array with x appended to a ")
let append: ('a, t<'a>) => t<'a>

external unsafe_get: (t<'a>, int) => 'a = "%array_unsafe_get"
external unsafe_set: (t<'a>, int, 'a) => unit = "%array_unsafe_set"
