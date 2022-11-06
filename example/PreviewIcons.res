@deriving(jsConverter)
type iconSet = [
  | #Solid
  | #Regular
  | #Light
  | #Duotone
  | #Brands
]

let iconSets = [#Solid, #Regular, #Light, #Duotone, #Brands]

let getAll = iconSet =>
  switch iconSet {
  | #Solid => Solid_All.all
  | #Regular => Regular_All.all
  | #Light => Light_All.all
  | #Duotone => Duotone_All.all
  | #Brands => Brands_All.all
  }

@react.component
let make = () => {
  let (iconSet, setIconSet) = React.useState(_ => #Solid)
  let (size, setSize) = React.useState(_ => "2x")
  let icons = iconSet->getAll
  <div className="flex flex-col">
    <div className="flex flex-row">
      <span>
        {React.string("Icon set:")}
        <select
          className="ml-1"
          onChange={event => {
            let value = ReactEvent.Form.target(event)["value"]
            setIconSet(_ => value)
          }}>
          {iconSets
          ->Js.Array2.map(s =>
            <option key={s->iconSetToJs} selected={s == iconSet} value={s->iconSetToJs}>
              {React.string(s->iconSetToJs)}
            </option>
          )
          ->React.array}
        </select>
      </span>
      <span className="ml-2">
        {React.string("Icon size:")}
        <select
          className="ml-1"
          onChange={event => {
            let value = ReactEvent.Form.target(event)["value"]
            setSize(_ => value)
          }}>
          {["xs", "sm", "md", "lg", "2x", "3x", "4x", "5x", "6x"]
          ->Js.Array2.map(s =>
            <option key=s selected={s == size} value=s> {React.string(s)} </option>
          )
          ->React.array}
        </select>
      </span>
    </div>
    {React.string(`${icons->Js.Array.length->Js.Int.toString} ${iconSet->iconSetToJs} icons`)}
    <div className="md:grid md:grid-cols-5 md:gap-6">
      {icons
      ->Js.Array2.map(icon => {
        let name = icon->IconObject.iconName
        <div key=name className="flex items-center justify-between flex-wrap border-2 rounded p-2">
          <span> {React.string(name)} </span> <Icon icon size />
        </div>
      })
      ->React.array}
    </div>
  </div>
}
