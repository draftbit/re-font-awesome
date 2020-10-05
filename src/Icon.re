[@bs.module "@fortawesome/react-fontawesome"] [@react.component]
external make:
  (
    ~icon: IconObject.t,
    ~className: string=?,
    ~title: string=?,
    ~transform: string=?,
    ~color: string=?,
    ~swapOpacity: bool=?,
    ~listItem: bool=?,
    ~fixedWidth: bool=?,
    ~flip: bool=?,
    ~spin: bool=?,
    ~pulse: bool=?,
    ~rotation: int=?
  ) =>
  React.element =
  "FontAwesomeIcon";
