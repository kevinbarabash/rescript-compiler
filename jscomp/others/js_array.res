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

  " JavaScript Array API "
)

@@warning("-103")

type t<'a> = array<'a>
type array_like<'a> = Js_array2.array_like<'a>

/* commented out until bs has a plan for iterators
type 'a array_iter = 'a array_like
*/

@val external from: array_like<'a> => array<'a> = "Array.from" /* ES2015 */
@val
external fromMap: (array_like<'a>, @uncurry ('a => 'b)) => array<'b> = "Array.from" /* ES2015 */
@val external isArray: 'a => bool = "Array.isArray" /* ES2015 */
/* Array.of: seems pointless unless you can bind */ /* ES2015 */

@get external length: array<'a> => int = "length"

/* Mutator functions
 */
@bs.send.pipe(: t<'a> as 'this)
external copyWithin: (~to_: int) => 'this = "copyWithin" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this)
external copyWithinFrom: (~to_: int, ~from: int) => 'this = "copyWithin" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this)
external copyWithinFromRange: (~to_: int, ~start: int, ~end_: int) => 'this =
  "copyWithin" /* ES2015 */

@bs.send.pipe(: t<'a> as 'this) external fillInPlace: 'a => 'this = "fill" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this)
external fillFromInPlace: ('a, ~from: int) => 'this = "fill" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this)
external fillRangeInPlace: ('a, ~start: int, ~end_: int) => 'this = "fill" /* ES2015 */

@ocaml.doc(
  " https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push "
)
@bs.send.pipe(: t<'a> as 'this)
@return(undefined_to_opt)
external pop: option<'a> = "pop"
@bs.send.pipe(: t<'a> as 'this) external push: 'a => int = "push"
@bs.send.pipe(: t<'a> as 'this) @variadic external pushMany: array<'a> => int = "push"

@bs.send.pipe(: t<'a> as 'this) external reverseInPlace: 'this = "reverse"

@bs.send.pipe(: t<'a> as 'this) @return({undefined_to_opt: undefined_to_opt})
external shift: option<'a> = "shift"

@bs.send.pipe(: t<'a> as 'this) external sortInPlace: 'this = "sort"
@bs.send.pipe(: t<'a> as 'this)
external sortInPlaceWith: (@uncurry ('a, 'a) => int) => 'this = "sort"

@bs.send.pipe(: t<'a> as 'this) @variadic
external spliceInPlace: (~pos: int, ~remove: int, ~add: array<'a>) => 'this = "splice"
@bs.send.pipe(: t<'a> as 'this) external removeFromInPlace: (~pos: int) => 'this = "splice"
@bs.send.pipe(: t<'a> as 'this)
external removeCountInPlace: (~pos: int, ~count: int) => 'this = "splice"
/* screwy naming, but screwy function */

@bs.send.pipe(: t<'a> as 'this) external unshift: 'a => int = "unshift"
@bs.send.pipe(: t<'a> as 'this) @variadic external unshiftMany: array<'a> => int = "unshift"

/* Accessor functions
 */
@bs.send.pipe(: t<'a> as 'this) external concat: 'this => 'this = "concat"
@bs.send.pipe(: t<'a> as 'this) @variadic external concatMany: array<'this> => 'this = "concat"

/* TODO: Not available in Node V4 */
@bs.send.pipe(: t<'a> as 'this) @ocaml.doc(" ES2016 ")
external includes: 'a => bool = "includes"

@bs.send.pipe(: t<'a> as 'this) external indexOf: 'a => int = "indexOf"
@bs.send.pipe(: t<'a> as 'this) external indexOfFrom: ('a, ~from: int) => int = "indexOf"

@send @deprecated("please use joinWith instead") external join: t<'a> => string = "join"

@bs.send.pipe(: t<'a> as 'this) external joinWith: string => string = "join"

@bs.send.pipe(: t<'a> as 'this) external lastIndexOf: 'a => int = "lastIndexOf"
@bs.send.pipe(: t<'a> as 'this) external lastIndexOfFrom: ('a, ~from: int) => int = "lastIndexOf"

@bs.send.pipe(: t<'a> as 'this) external slice: (~start: int, ~end_: int) => 'this = "slice"
@bs.send.pipe(: t<'a> as 'this) external copy: 'this = "slice"
@bs.send.pipe(: t<'a> as 'this) external sliceFrom: int => 'this = "slice"

@bs.send.pipe(: t<'a> as 'this) external toString: string = "toString"
@bs.send.pipe(: t<'a> as 'this) external toLocaleString: string = "toLocaleString"

/* Iteration functions
 */
/* commented out until bs has a plan for iterators
external entries : (int * 'a) array_iter = "" [@@bs.send.pipe: 'a t as 'this] (* ES2015 *)
*/

@bs.send.pipe(: t<'a> as 'this) external every: (@uncurry ('a => bool)) => bool = "every"
@bs.send.pipe(: t<'a> as 'this) external everyi: (@uncurry ('a, int) => bool) => bool = "every"

@ocaml.doc(" should we use `bool` or `boolean` seems they are intechangeable here ")
@bs.send.pipe(: t<'a> as 'this)
external filter: (@uncurry ('a => bool)) => 'this = "filter"
@bs.send.pipe(: t<'a> as 'this) external filteri: (@uncurry ('a, int) => bool) => 'this = "filter"

@bs.send.pipe(: t<'a> as 'this) @return({undefined_to_opt: undefined_to_opt})
external find: (@uncurry ('a => bool)) => option<'a> = "find" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this) @return({undefined_to_opt: undefined_to_opt})
external findi: (@uncurry ('a, int) => bool) => option<'a> = "find" /* ES2015 */

@bs.send.pipe(: t<'a> as 'this)
external findIndex: (@uncurry ('a => bool)) => int = "findIndex" /* ES2015 */
@bs.send.pipe(: t<'a> as 'this)
external findIndexi: (@uncurry ('a, int) => bool) => int = "findIndex" /* ES2015 */

@bs.send.pipe(: t<'a> as 'this) external forEach: (@uncurry ('a => unit)) => unit = "forEach"
@bs.send.pipe(: t<'a> as 'this) external forEachi: (@uncurry ('a, int) => unit) => unit = "forEach"

/* commented out until bs has a plan for iterators
external keys : int array_iter = "" [@@bs.send.pipe: 'a t as 'this] (* ES2015 *)
*/

@bs.send.pipe(: t<'a> as 'this) external map: (@uncurry ('a => 'b)) => t<'b> = "map"
@bs.send.pipe(: t<'a> as 'this) external mapi: (@uncurry ('a, int) => 'b) => t<'b> = "map"

@bs.send.pipe(: t<'a> as 'this) external reduce: (@uncurry ('b, 'a) => 'b, 'b) => 'b = "reduce"
@bs.send.pipe(: t<'a> as 'this)
external reducei: (@uncurry ('b, 'a, int) => 'b, 'b) => 'b = "reduce"

@bs.send.pipe(: t<'a> as 'this)
external reduceRight: (@uncurry ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
@bs.send.pipe(: t<'a> as 'this)
external reduceRighti: (@uncurry ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"

@bs.send.pipe(: t<'a> as 'this) external some: (@uncurry ('a => bool)) => bool = "some"
@bs.send.pipe(: t<'a> as 'this) external somei: (@uncurry ('a, int) => bool) => bool = "some"

/* commented out until bs has a plan for iterators
external values : 'a array_iter = "" [@@bs.send.pipe: 'a t as 'this] (* ES2015 *)
*/
external unsafe_get: (array<'a>, int) => 'a = "%array_unsafe_get"
external unsafe_set: (array<'a>, int, 'a) => unit = "%array_unsafe_set"
