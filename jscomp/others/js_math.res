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

  " JavaScript Math API "
)

@ocaml.doc(" Euler's number ") @val @scope("Math") external _E: float = "E"

@ocaml.doc(" natural logarithm of 2 ") @val @scope("Math") external _LN2: float = "LN2"

@ocaml.doc(" natural logarithm of 10 ") @val @scope("Math") external _LN10: float = "LN10"

@ocaml.doc(" base 2 logarithm of E ") @val @scope("Math") external _LOG2E: float = "LOG2E"

@ocaml.doc(" base 10 logarithm of E ") @val @scope("Math") external _LOG10E: float = "LOG10E"

@ocaml.doc(" Pi... (ratio of the circumference and diameter of a circle) ") @val @scope("Math")
external _PI: float = "PI"

@ocaml.doc(" square root of 1/2 ") @val @scope("Math") external _SQRT1_2: float = "SQRT1_2"

@ocaml.doc(" square root of 2 ") @val @scope("Math") external _SQRT2: float = "SQRT2"

@ocaml.doc(" absolute value ") @val @scope("Math") external abs_int: int => int = "abs"

@ocaml.doc(" absolute value ") @val @scope("Math") external abs_float: float => float = "abs"

@ocaml.doc(" arccosine in radians, can return NaN ") @val @scope("Math")
external acos: float => float = "acos"

@ocaml.doc(" hyperbolic arccosine in raidans, can return NaN, ES2015 ") @val @scope("Math")
external acosh: float => float = "acosh"

@ocaml.doc(" arcsine in radians, can return NaN ") @val @scope("Math")
external asin: float => float = "asin"

@ocaml.doc(" hyperbolic arcsine in raidans, ES2015 ") @val @scope("Math")
external asinh: float => float = "asinh"

@ocaml.doc(" arctangent in radians ") @val @scope("Math") external atan: float => float = "atan"

@ocaml.doc(" hyperbolic arctangent in radians, can return NaN, ES2015 ") @val @scope("Math")
external atanh: float => float = "atanh"

@ocaml.doc(" arctangent of the quotient of x and y, mostly... this one's a bit weird ")
@val
@scope("Math")
external atan2: (~y: float, ~x: float, unit) => float = "atan2"

@ocaml.doc(" cube root, can return NaN, ES2015 ") @val @scope("Math")
external cbrt: float => float = "cbrt"

@ocaml.doc(" may return values not representable by `int` ") @val @scope("Math")
external unsafe_ceil_int: float => int = "ceil"
@deprecated("Please use `unsafe_ceil_int` instead") let unsafe_ceil = unsafe_ceil_int

@ocaml.doc(" smallest int greater than or equal to the argument ")
let ceil_int = (f: float): int =>
  if f > Js_int.toFloat(Js_int.max) {
    Js_int.max
  } else if f < Js_int.toFloat(Js_int.min) {
    Js_int.min
  } else {
    unsafe_ceil_int(f)
  }
@deprecated("Please use `ceil_int` instead") let ceil = ceil_int

@ocaml.doc(" smallest float greater than or equal to the argument ") @val @scope("Math")
external ceil_float: float => float = "ceil"

@ocaml.doc(" number of leading zero bits of the argument's 32 bit int representation, ES2015 ")
@val
@scope("Math")
external clz32: int => int = "clz32"
/* can convert string, float etc. to number */

@ocaml.doc(" cosine in radians ") @val @scope("Math") external cos: float => float = "cos"

@ocaml.doc(" hyperbolic cosine in radians, ES2015 ") @val @scope("Math")
external cosh: float => float = "cosh"

@ocaml.doc(" natural exponentional ") @val @scope("Math") external exp: float => float = "exp"

@ocaml.doc(" natural exponential minus 1, ES2015 ") @val @scope("Math")
external expm1: float => float = "expm1"

@ocaml.doc(" may return values not representable by `int` ") @val @scope("Math")
external unsafe_floor_int: float => int = "floor"
@deprecated("Please use `unsafe_floor_int` instead") let unsafe_floor = unsafe_floor_int

@ocaml.doc(" largest int greater than or equal to the arugment ")
let floor_int = f =>
  if f > Js_int.toFloat(Js_int.max) {
    Js_int.max
  } else if f < Js_int.toFloat(Js_int.min) {
    Js_int.min
  } else {
    unsafe_floor(f)
  }
@deprecated("Please use `floor_int` instead") let floor = floor_int
@val @scope("Math") external floor_float: float => float = "floor"

@ocaml.doc(" round to nearest single precision float, ES2015 ") @val @scope("Math")
external fround: float => float = "fround"

@ocaml.doc(" pythagorean equation, ES2015 ") @val @scope("Math")
external hypot: (float, float) => float = "hypot"

@ocaml.doc(" generalized pythagorean equation, ES2015 ") @val @variadic @scope("Math")
external hypotMany: array<float> => float = "hypot"

@ocaml.doc(" 32-bit integer multiplication, ES2015 ") @val @scope("Math")
external imul: (int, int) => int = "imul"

@ocaml.doc(" natural logarithm, can return NaN ") @val @scope("Math")
external log: float => float = "log"

@ocaml.doc(" natural logarithm of 1 + the argument, can return NaN, ES2015 ") @val @scope("Math")
external log1p: float => float = "log1p"

@ocaml.doc(" base 10 logarithm, can return NaN, ES2015 ") @val @scope("Math")
external log10: float => float = "log10"

@ocaml.doc(" base 2 logarithm, can return NaN, ES2015 ") @val @scope("Math")
external log2: float => float = "log2"

@ocaml.doc(" max value ") @val @scope("Math") external max_int: (int, int) => int = "max"

@ocaml.doc(" max value ") @val @variadic @scope("Math")
external maxMany_int: array<int> => int = "max"

@ocaml.doc(" max value ") @val @scope("Math") external max_float: (float, float) => float = "max"

@ocaml.doc(" max value ") @val @variadic @scope("Math")
external maxMany_float: array<float> => float = "max"

@ocaml.doc(" min value ") @val @scope("Math") external min_int: (int, int) => int = "min"

@ocaml.doc(" min value ") @val @variadic @scope("Math")
external minMany_int: array<int> => int = "min"

@ocaml.doc(" min value ") @val @scope("Math") external min_float: (float, float) => float = "min"

@ocaml.doc(" min value ") @val @variadic @scope("Math")
external minMany_float: array<float> => float = "min"

@ocaml.doc(" base to the power of the exponent ")
@val
@scope("Math")
@deprecated("use `power_float` instead, the return type may be not int")
external pow_int: (~base: int, ~exp: int) => int = "pow"

@ocaml.doc(" base to the power of the exponent ") @val @scope("Math")
external pow_float: (~base: float, ~exp: float) => float = "pow"

@ocaml.doc(" random number in [0,1) ") @val @scope("Math") external random: unit => float = "random"

@ocaml.doc(" random number in [min,max) ")
let random_int = (min, max) => floor(random() *. Js_int.toFloat(max - min)) + min

@ocaml.doc(" rounds to nearest integer, returns a value not representable as `int` if NaN ")
@val
@scope("Math")
external unsafe_round: float => int = "round"

@ocaml.doc(" rounds to nearest integer ") @val @scope("Math")
external round: float => float = "round"

@ocaml.doc(" the sign of the argument, 1, -1 or 0, ES2015 ") @val @scope("Math")
external sign_int: int => int = "sign"

@ocaml.doc(" the sign of the argument, 1, -1, 0, -0 or NaN, ES2015 ") @val @scope("Math")
external sign_float: float => float = "sign"

@ocaml.doc(" sine in radians ") @val @scope("Math") external sin: float => float = "sin"

@ocaml.doc(" hyperbolic sine in radians, ES2015 ") @val @scope("Math")
external sinh: float => float = "sinh"

@ocaml.doc(" square root, can return NaN ") @val @scope("Math")
external sqrt: float => float = "sqrt"

@ocaml.doc(" tangent in radians ") @val @scope("Math") external tan: float => float = "tan"

@ocaml.doc(" hyperbolic tangent in radians, ES2015 ") @val @scope("Math")
external tanh: float => float = "tanh"

@ocaml.doc(
  " truncate, ie. remove fractional digits, returns a value not representable as `int` if NaN, ES2015 "
)
@val
@scope("Math")
external unsafe_trunc: float => int = "trunc"

@ocaml.doc(
  " truncate, ie. remove fractional digits, returns a value not representable as `int` if NaN, ES2015 "
)
@val
@scope("Math")
external trunc: float => float = "trunc"
