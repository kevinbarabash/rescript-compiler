let zed = As_identifier_constants.zed

type point = {
    x: int,
    y: int,
    @as(zed) z: int,
}

let p: point = {x: 5, y: 10, z: 25}

Js.log(p)
