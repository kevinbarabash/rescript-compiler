[@bs.deriving jsConverter]
type itemStatus =
  | [@bs.as 1] Wishlist
  | [@bs.as 2] ForTrade
  | [@bs.as 3] CanCraft
  | [@bs.as 4] CatalogOnly;

let itemStatusToEmoji = itemStatus => {
  switch (itemStatus) {
  | Wishlist => {j|🙏|j}
  | ForTrade => {j|🤝|j}
  | CanCraft => {j|🔨|j}
  | CatalogOnly => {j|📖|j}
  };
};
let itemStatusToString = itemStatus =>
  switch (itemStatus) {
  | Wishlist => "Wishlist"
  | ForTrade => "For Trade"
  | CanCraft => "Can Craft"
  | CatalogOnly => "Catalog"
  };

type item = {
  status: itemStatus,
  note: string,
  timeUpdated: option(float),
  priorityTimestamp: option(float),
};

let itemToJson = (item: item) => {
  Json.Encode.(
    object_(
      [
        Some(("status", int(itemStatusToJs(item.status)))),
        item.note != "" ? Some(("note", string(item.note))) : None,
      ]
      ->Belt.List.keepMap(x => x),
    )
  );
};

let itemFromJson = json => {
  open Json.Decode;
  let status = (json |> field("status", int))->itemStatusFromJs;
  Belt.Option.map(status, status =>
    {
      status,
      note:
        (json |> optional(field("note", string)))
        ->Belt.Option.getWithDefault(""),
      timeUpdated: json |> optional(field("t", Json.Decode.float)),
      priorityTimestamp: json |> optional(field("p", Json.Decode.float)),
    }
  );
};

let getItemKey = (~itemId: int, ~variation: int) => {
  string_of_int(itemId) ++ "@@" ++ string_of_int(variation);
};

let fromItemKey = (~key: string) => {
  let [|itemId, variation|] = key |> Js.String.split("@@");
  let itemId =
    if (itemId |> Js.String.endsWith("r")) {
      Item.itemMap
      ->Js.Dict.get(
          itemId
          |> Js.String.slice(~from=0, ~to_=Js.String.length(itemId) - 1),
        )
      ->Belt.Option.flatMap(item =>
          switch (item.type_) {
          | Item(recipeId) => recipeId
          | Recipe(_) => None
          }
        );
    } else {
      int_of_string_opt(itemId);
    };
  itemId->Belt.Option.map(itemId => (itemId, int_of_string(variation)));
};

type t = {
  id: string,
  username: string,
  email: option(string),
  items: Js.Dict.t(item),
  profileText: string,
  enableCatalogCheckbox: bool,
  followeeIds: option(array(string)),
  discordId: option(string),
};

let fromAPI = (json: Js.Json.t) => {
  Json.Decode.{
    id: json |> oneOf([field("id", string), field("uuid", string)]),
    username: json |> field("username", string),
    email:
      switch (json |> optional(field("email", string))) {
      | Some("") => None
      | Some(email) => Some(email)
      | None => None
      },
    items:
      (json |> field("items", dict(itemFromJson)))
      ->Js.Dict.entries
      ->Belt.Array.keepMap(((itemKey, value)) => {
          Belt.Option.flatMap(value, value => {
            fromItemKey(~key=itemKey)
            ->Belt.Option.flatMap(((itemId, variant)) =>
                Item.itemMap
                ->Js.Dict.get(string_of_int(itemId))
                ->Belt.Option.map(item => (item, variant))
              )
            ->Belt.Option.map(((item, variant)) => {
                let canonicalVariant =
                  Item.getCanonicalVariant(~item, ~variant);
                (
                  getItemKey(~itemId=item.id, ~variation=canonicalVariant),
                  value,
                );
              })
          })
        })
      ->Js.Dict.fromArray,
    profileText:
      json
      |> oneOf([
           field("profileText", string),
           field("metadata", json =>
             (json |> optional(field("profileText", string)))
             ->Belt.Option.getWithDefault("")
           ),
           _ => "",
         ]),
    enableCatalogCheckbox:
      json
      |> oneOf([
           field("settings", json =>
             (json |> optional(field("enableCatalog", bool)))
             ->Belt.Option.getWithDefault(false)
           ),
           field("metadata", json =>
             (json |> optional(field("enableCatalogCheckbox", bool)))
             ->Belt.Option.getWithDefault(false)
           ),
         ]),
    followeeIds: json |> optional(field("followeeIds", array(string))),
    discordId: json |> optional(field("discordId", string)),
  };
};