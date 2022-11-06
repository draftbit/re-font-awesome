# Font Awesome in Rescript

## Usage

```reason
// Free libraries
<FontAwesome.Icon icon=FontAwesome.FreeRegular.faCheck />
<FontAwesome.Icon icon=FontAwesome.FreeSolid.faXRay className="MyIcon" />

// Pro libraries (requires a font-awesome token, see below)
<FontAwesome.Icon
  icon=FontAwesome.Duotone.faBanjo
  className="PrimaryIcon"
/>

<FontAwesome.Icon icon=FontAwesome.Light.faHockeyPuck />
```

## Installation & dependencies

This library uses optional dependencies for the individual font libraries, so make sure you include the ones you want to use in your project. For example:

```
$ yarn add '@fortawesome/pro-regular-svg-icons@^5'
$ yarn add '@fortawesome/free-solid-svg-icons@^5'
```

_NOTE:_ In order to use the `-pro` libraries you must have a token for font awesome in your `.npmrc`. As an example:

```
@fortawesome:registry=https://npm.fontawesome.com/
//npm.fontawesome.com/:_authToken=XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXX
```

## Generate the binding files

The reason bindings for each font style are generated by a script `genbindings.js`, which you can run directly or with:

```
yarn gen-icon-bindings
```

This should be run any time the FontAwesome version changes, to keep the list of icons up to date.

## Preview Example

A small React application is provided to preview the icons and serve as an example of how to use the components. Its code lives in the `example` directory. It can be run with `yarn example:start` and will be run on port `1234` by default.

## Compiler Commands

```
yarn re:clean
yarn re:build
yarn re:watch
```
