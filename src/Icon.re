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
let make = (~icon: IconObject.t, ~className=?, ~transform=?, ~color=?) => {
  IconLibrary.(add(library, icon));
  <JsWrapper
    icon=IconObject.(icon->prefix, icon->iconName)
    ?className
    ?transform
    ?color
  />;
};
