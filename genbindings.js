/* eslint-disable no-console */
const iconObjectTypeName = "IconObject.t";
[
  ["regular", "pro"],
  ["solid", "pro"],
  ["light", "pro"],
  ["duotone", "pro"],
  ["regular", "free"],
  ["solid", "free"],
].forEach(([style, tier]) => {
  const libName = `@fortawesome/${tier}-${style}-svg-icons`;
  const lib = require(libName);
  const iconNames = Object.keys(lib).filter((s) => s.match(/fa[A-Z][A-Za-z]+/));
  const bindings = iconNames.map(
    (n) =>
      `@module("${libName}")\nexternal ${n}: ${iconObjectTypeName} = "${n}";`
  );
  const capitalizedStyle = style[0].toUpperCase() + style.slice(1);
  const moduleName = `${tier === "free" ? "Free" : ""}${capitalizedStyle}`;
  const moduleContents = bindings.join("\n\n");
  const bindingPath = `src/${moduleName}.res`;
  require("fs").writeFileSync(bindingPath, moduleContents);
  console.log(`Generated ${bindingPath}`);
});
