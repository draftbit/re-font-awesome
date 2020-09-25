/* eslint-disable no-console */
const iconObjectTypeName = "IconObject.t";
["regular", "solid", "light", "duotone"].forEach((style) => {
  const libName = `@fortawesome/pro-${style}-svg-icons`;
  const lib = require(libName);
  const iconNames = Object.keys(lib).filter((s) => s.match(/fa[A-Z][A-Za-z]+/));
  const bindings = iconNames.map(
    (n) =>
      `[@bs.module "${libName}"]\nexternal ${n}: ${iconObjectTypeName} = "${n}";`
  );
  const bindingPath = `src/${style[0].toUpperCase() + style.slice(1)}.re`;
  require("fs").writeFileSync(bindingPath, bindings.join("\n\n"));
  console.log(`Generated ${bindingPath}`);
});
