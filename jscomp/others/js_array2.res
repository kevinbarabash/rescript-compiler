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

type t<'a> = array<'a>
type array_like<'a>

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
@send external copyWithin: (t<'a>, ~to_: int) => t<'a> = "copyWithin" /* ES2015 */
@send external copyWithinFrom: (t<'a>, ~to_: int, ~from: int) => t<'a> = "copyWithin" /* ES2015 */
@send
external copyWithinFromRange: (t<'a>, ~to_: int, ~start: int, ~end_: int) => t<'a> =
  "copyWithin" /* ES2015 */

@send external fillInPlace: (t<'a>, 'a) => t<'a> = "fill" /* ES2015 */
@send external fillFromInPlace: (t<'a>, 'a, ~from: int) => t<'a> = "fill" /* ES2015 */
@send external fillRangeInPlace: (t<'a>, 'a, ~start: int, ~end_: int) => t<'a> = "fill" /* ES2015 */

@ocaml.doc(
  " https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push "
)
@send
@return(undefined_to_opt)
external pop: t<'a> => option<'a> = "pop"
@send external push: (t<'a>, 'a) => int = "push"
@send @variadic external pushMany: (t<'a>, array<'a>) => int = "push"

@send external reverseInPlace: t<'a> => t<'a> = "reverse"

@send @return(undefined_to_opt) external shift: t<'a> => option<'a> = "shift"

@send external sortInPlace: t<'a> => t<'a> = "sort"
@send external sortInPlaceWith: (t<'a>, @uncurry ('a, 'a) => int) => t<'a> = "sort"

@send @variadic
external spliceInPlace: (t<'a>, ~pos: int, ~remove: int, ~add: array<'a>) => t<'a> = "splice"
@send external removeFromInPlace: (t<'a>, ~pos: int) => t<'a> = "splice"
@send external removeCountInPlace: (t<'a>, ~pos: int, ~count: int) => t<'a> = "splice"
/* screwy naming, but screwy function */

@send external unshift: (t<'a>, 'a) => int = "unshift"
@send @variadic external unshiftMany: (t<'a>, array<'a>) => int = "unshift"

/* Accessor functions
 */
@send @deprecated("append is not type-safe. Use `concat` instead, and see #1884")
external append: (t<'a>, 'a) => t<'a> = "concat"
@send external concat: (t<'a>, t<'a>) => t<'a> = "concat"
@send @variadic external concatMany: (t<'a>, array<t<'a>>) => t<'a> = "concat"

/* TODO: Not available in Node V4 */
@send @ocaml.doc(" ES2016 ")
external includes: (t<'a>, 'a) => bool = "includes"

@send external indexOf: (t<'a>, 'a) => int = "indexOf"
@send external indexOfFrom: (t<'a>, 'a, ~from: int) => int = "indexOf"

@send external joinWith: (t<'a>, string) => string = "join"

@send external lastIndexOf: (t<'a>, 'a) => int = "lastIndexOf"
@send external lastIndexOfFrom: (t<'a>, 'a, ~from: int) => int = "lastIndexOf"

@send external slice: (t<'a>, ~start: int, ~end_: int) => t<'a> = "slice"
@send external copy: t<'a> => t<'a> = "slice"
@send external sliceFrom: (t<'a>, int) => t<'a> = "slice"

@send external toString: t<'a> => string = "toString"
@send external toLocaleString: t<'a> => string = "toLocaleString"

/* Iteration functions
 */
/* commented out until bs has a plan for iterators
external entries : 'a t -> (int * 'a) array_iter = "" [@@bs.send] (* ES2015 *)
*/

@send external every: (t<'a>, @uncurry ('a => bool)) => bool = "every"
@send external everyi: (t<'a>, @uncurry ('a, int) => bool) => bool = "every"

@ocaml.doc(" should we use `bool` or `boolean` seems they are intechangeable here ") @send
external filter: (t<'a>, @uncurry ('a => bool)) => t<'a> = "filter"
@send external filteri: (t<'a>, @uncurry ('a, int) => bool) => t<'a> = "filter"

@send @return({undefined_to_opt: undefined_to_opt})
external find: (t<'a>, @uncurry ('a => bool)) => option<'a> = "find" /* ES2015 */
@send @return({undefined_to_opt: undefined_to_opt})
external findi: (t<'a>, @uncurry ('a, int) => bool) => option<'a> = "find" /* ES2015 */

@send external findIndex: (t<'a>, @uncurry ('a => bool)) => int = "findIndex" /* ES2015 */
@send external findIndexi: (t<'a>, @uncurry ('a, int) => bool) => int = "findIndex" /* ES2015 */

@send external forEach: (t<'a>, @uncurry ('a => unit)) => unit = "forEach"
@send external forEachi: (t<'a>, @uncurry ('a, int) => unit) => unit = "forEach"

/* commented out until bs has a plan for iterators
external keys : 'a t -> int array_iter = "" [@@bs.send] (* ES2015 *)
*/

@send external map: (t<'a>, @uncurry ('a => 'b)) => t<'b> = "map"
@send external mapi: (t<'a>, @uncurry ('a, int) => 'b) => t<'b> = "map"

@send external reduce: (t<'a>, @uncurry ('b, 'a) => 'b, 'b) => 'b = "reduce"
@send external reducei: (t<'a>, @uncurry ('b, 'a, int) => 'b, 'b) => 'b = "reduce"

@send external reduceRight: (t<'a>, @uncurry ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
@send external reduceRighti: (t<'a>, @uncurry ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"

@send external some: (t<'a>, @uncurry ('a => bool)) => bool = "some"
@send external somei: (t<'a>, @uncurry ('a, int) => bool) => bool = "some"

/* commented out until bs has a plan for iterators
external values : 'a t -> 'a array_iter = "" [@@bs.send] (* ES2015 *)
*/
external unsafe_get: (array<'a>, int) => 'a = "%array_unsafe_get"
external unsafe_set: (array<'a>, int, 'a) => unit = "%array_unsafe_set"
