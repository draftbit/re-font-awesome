/*
   This binding matches with the React version of Font Awesome defined here:
   https://github.com/FortAwesome/react-fontawesome/blob/master/src/components/FontAwesomeIcon.js#L62-L118
 */

@module("@fortawesome/react-fontawesome") @react.component
external make: (
  ~icon: IconObject.t,
  ~className: string=?,
  ~title: string=?,
  ~transform: string=?,
  ~color: string=?,
  ~swapOpacity: bool=?,
  ~listItem: bool=?,
  ~fixedWidth: bool=?,
  ~flip: [#horizontal | #vertical | #both]=?,
  ~pull: [#right | #left]=?,
  ~spin: bool=?,
  ~pulse: bool=?,
  ~rotation: int=?,
  ~size: IconSize.t=?,
  ~style: ReactDOM.Style.t=?,
  ~beat: bool=?,
  ~border: bool=?,
  ~bounce: bool=?,
  ~fade: bool=?,
  ~flash: bool=?,
  ~inverse: bool=?,
  ~shake: bool=?,
  ~spinPulse: bool=?,
  ~spinReverse: bool=?,
  ~onClick: ReactEvent.Mouse.t => unit=?,
) => React.element = "FontAwesomeIcon"
