module IconStyle = {
  type t =
    | Regular
    | Solid
    | Light
    | Duotone;

  let toString = style =>
    switch (style) {
    | Regular => "regular"
    | Solid => "solid"
    | Light => "light"
    | Duotone => "duotone"
    };
};

module Icon = {
  type t;
  type svgPath =
    | SinglePath(string)
    | DualPath(string, string);

  [@bs.get] external prefix: t => string = "prefix";
  [@bs.get] external iconName: t => string = "iconName";

  exception InvalidPrefix(string);

  let style = icon =>
    switch (icon->prefix) {
    | "far" => IconStyle.Regular
    | "fas" => Solid
    | "fal" => Light
    | "fad" => Duotone
    | prefix => raise(InvalidPrefix(prefix))
    };
};

module Library = {
  type t;

  [@bs.module "@fortawesome/fontawesome-svg-core"]
  external library: t = "library";
  [@bs.send] external add: (t, Icon.t) => unit = "add";
};

module IconComponent = {
  module JsWrapper = {
    [@bs.module "@fortawesome/react-fontawesome"] [@react.component]
    external make:
      (
        ~icon: (string, string),
        ~className: string=?,
        ~transform: string=?,
        ~color: string=?
      ) =>
      React.element =
      "FontAwesomeIcon";
  };

  [@react.component]
  let make = (~icon: Icon.t, ~className=?, ~transform=?, ~color=?) => {
    Library.(add(library, icon));
    <JsWrapper
      icon=Icon.(icon->prefix, icon->iconName)
      ?className
      ?transform
      ?color
    />;
  };
};
