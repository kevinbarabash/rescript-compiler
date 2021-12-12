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

  " JavaScript Date API "
)

type t

@send @ocaml.doc(" returns the primitive value of this date, equivalent to getTime ")
external valueOf: t => float = "valueOf"

@new @ocaml.doc(" returns a date representing the current time ")
external make: unit => t = "Date"

@new external fromFloat: float => t = "Date"
@new external fromString: string => t = "Date"

@new external makeWithYM: (~year: float, ~month: float, unit) => t = "Date"
@new external makeWithYMD: (~year: float, ~month: float, ~date: float, unit) => t = "Date"
@new
external makeWithYMDH: (~year: float, ~month: float, ~date: float, ~hours: float, unit) => t =
  "Date"
@new
external makeWithYMDHM: (
  ~year: float,
  ~month: float,
  ~date: float,
  ~hours: float,
  ~minutes: float,
  unit,
) => t = "Date"
@new
external makeWithYMDHMS: (
  ~year: float,
  ~month: float,
  ~date: float,
  ~hours: float,
  ~minutes: float,
  ~seconds: float,
  unit,
) => t = "Date"

@val("Date.UTC") external utcWithYM: (~year: float, ~month: float, unit) => float = ""
@val("Date.UTC")
external utcWithYMD: (~year: float, ~month: float, ~date: float, unit) => float = ""
@val("Date.UTC")
external utcWithYMDH: (~year: float, ~month: float, ~date: float, ~hours: float, unit) => float = ""
@val("Date.UTC")
external utcWithYMDHM: (
  ~year: float,
  ~month: float,
  ~date: float,
  ~hours: float,
  ~minutes: float,
  unit,
) => float = ""
@val("Date.UTC")
external utcWithYMDHMS: (
  ~year: float,
  ~month: float,
  ~date: float,
  ~hours: float,
  ~minutes: float,
  ~seconds: float,
  unit,
) => float = ""

@val("Date.now") @ocaml.doc(" returns the number of milliseconds since Unix epoch ")
external now: unit => float = ""

@new @deprecated("Please use `fromString` instead") external parse: string => t = "Date"

@val("parse") @scope("Date") @ocaml.doc(" returns NaN if passed invalid date string ")
external parseAsFloat: string => float = ""

@send @ocaml.doc(" return the day of the month (1-31) ")
external getDate: t => float = "getDate"

@send @ocaml.doc(" returns the day of the week (0-6) ")
external getDay: t => float = "getDay"

@send external getFullYear: t => float = "getFullYear"
@send external getHours: t => float = "getHours"
@send external getMilliseconds: t => float = "getMilliseconds"
@send external getMinutes: t => float = "getMinutes"
@send @ocaml.doc(" returns the month (0-11) ")
external getMonth: t => float = "getMonth"

@send external getSeconds: t => float = "getSeconds"
@send @ocaml.doc(" returns the number of milliseconds since Unix epoch ")
external getTime: t => float = "getTime"

@send external getTimezoneOffset: t => float = "getTimezoneOffset"
@send @ocaml.doc(" return the day of the month (1-31) ")
external getUTCDate: t => float = "getUTCDate"

@send @ocaml.doc(" returns the day of the week (0-6) ")
external getUTCDay: t => float = "getUTCDay"

@send external getUTCFullYear: t => float = "getUTCFullYear"
@send external getUTCHours: t => float = "getUTCHours"
@send external getUTCMilliseconds: t => float = "getUTCMilliseconds"
@send external getUTCMinutes: t => float = "getUTCMinutes"
@send @ocaml.doc(" returns the month (0-11) ")
external getUTCMonth: t => float = "getUTCMonth"

@send external getUTCSeconds: t => float = "getUTCSeconds"
@send @deprecated("use `getFullYear` instead") external getYear: t => float = "getYear"

@send external setDate: (t, float) => float = "setDate"
@send external setFullYear: (t, float) => float = "setFullYear"
@send external setFullYearM: (t, ~year: float, ~month: float, unit) => float = "setFullYear"
@send
external setFullYearMD: (t, ~year: float, ~month: float, ~date: float, unit) => float =
  "setFullYear"
@send external setHours: (t, float) => float = "setHours"
@send external setHoursM: (t, ~hours: float, ~minutes: float, unit) => float = "setHours"
@send
external setHoursMS: (t, ~hours: float, ~minutes: float, ~seconds: float, unit) => float =
  "setHours"
@send
external setHoursMSMs: (
  t,
  ~hours: float,
  ~minutes: float,
  ~seconds: float,
  ~milliseconds: float,
  unit,
) => float = "setHours"
@send external setMilliseconds: (t, float) => float = "setMilliseconds"
@send external setMinutes: (t, float) => float = "setMinutes"
@send external setMinutesS: (t, ~minutes: float, ~seconds: float, unit) => float = "setMinutes"
@send
external setMinutesSMs: (t, ~minutes: float, ~seconds: float, ~milliseconds: float, unit) => float =
  "setMinutes"
@send external setMonth: (t, float) => float = "setMonth"
@send external setMonthD: (t, ~month: float, ~date: float, unit) => float = "setMonth"
@send external setSeconds: (t, float) => float = "setSeconds"
@send
external setSecondsMs: (t, ~seconds: float, ~milliseconds: float, unit) => float = "setSeconds"
@send external setTime: (t, float) => float = "setTime"
@send external setUTCDate: (t, float) => float = "setUTCDate"
@send external setUTCFullYear: (t, float) => float = "setUTCFullYear"
@send external setUTCFullYearM: (t, ~year: float, ~month: float, unit) => float = "setUTCFullYear"
@send
external setUTCFullYearMD: (t, ~year: float, ~month: float, ~date: float, unit) => float =
  "setUTCFullYear"
@send external setUTCHours: (t, float) => float = "setUTCHours"
@send external setUTCHoursM: (t, ~hours: float, ~minutes: float, unit) => float = "setUTCHours"
@send
external setUTCHoursMS: (t, ~hours: float, ~minutes: float, ~seconds: float, unit) => float =
  "setUTCHours"
@send
external setUTCHoursMSMs: (
  t,
  ~hours: float,
  ~minutes: float,
  ~seconds: float,
  ~milliseconds: float,
  unit,
) => float = "setUTCHours"
@send external setUTCMilliseconds: (t, float) => float = "setUTCMilliseconds"
@send external setUTCMinutes: (t, float) => float = "setUTCMinutes"
@send
external setUTCMinutesS: (t, ~minutes: float, ~seconds: float, unit) => float = "setUTCMinutes"
@send
external setUTCMinutesSMs: (
  t,
  ~minutes: float,
  ~seconds: float,
  ~milliseconds: float,
  unit,
) => float = "setUTCMinutes"
@send external setUTCMonth: (t, float) => float = "setUTCMonth"
@send external setUTCMonthD: (t, ~month: float, ~date: float, unit) => float = "setUTCMonth"
@send external setUTCSeconds: (t, float) => float = "setUTCSeconds"
@send
external setUTCSecondsMs: (t, ~seconds: float, ~milliseconds: float, unit) => float =
  "setUTCSeconds"
@send external setUTCTime: (t, float) => float = "setTime"
@send @deprecated("use `setFullYear` instead") external setYear: (t, float) => float = "setYear"

@send external toDateString: t => string = "toDateString"
@send @deprecated("use `toUTCString` instead") external toGMTString: t => string = "toGMTString"

@send external toISOString: t => string = "toISOString"
@send
@deprecated(
  "This method is unsafe. It will be changed to return option in a future release. Please use toJSONUnsafe instead."
)
external toJSON: t => string = "toJSON"
@send external toJSONUnsafe: t => string = "toJSON"
@send
external toLocaleDateString: t => string =
  "toLocaleDateString" /* TODO: has overloads with somewhat poor browser support */
@send
external toLocaleString: t => string =
  "toLocaleString" /* TODO: has overloads with somewhat poor browser support */
@send
external toLocaleTimeString: t => string =
  "toLocaleTimeString" /* TODO: has overloads with somewhat poor browser support */
@send external toString: t => string = "toString"
@send external toTimeString: t => string = "toTimeString"
@send external toUTCString: t => string = "toUTCString"
