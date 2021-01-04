# Font Awesome Pro in ReasonML

## Usage

```reason
<FontAwesomePro.Icon icon=FontAwesomePro.Duotone.faArrowRight />

<FontAwesomePro.Icon
  icon=FontAwesomePro.Solid.faCheck
  className="PrimaryIcon"
/>
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

## Compiler Commands

```
yarn re:clean
yarn re:build
yarn re:watch
```
