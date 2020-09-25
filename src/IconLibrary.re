// Font awesome icon library type
type t;

// Library global object
[@bs.module "@fortawesome/fontawesome-svg-core"]
external library: t = "library";

// Add a font to the library. Called under the hood in the icon component.
[@bs.send] external add: (t, IconObject.t) => unit = "add";
