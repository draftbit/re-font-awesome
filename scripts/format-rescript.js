/* eslint-disable no-console */
const { basename } = require("path");
const { lstatSync } = require("fs");
const formatRescriptFile = require("../formatRescriptFile");
const fileNames = process.argv.slice(2);

if (!fileNames.length) {
  throw new Error(`Usage: ${basename(__filename)} <fileName> [<fileName>...]`);
}

let hasError = false;

fileNames.forEach((fileName) => {
  if (!fileName.endsWith(".res")) {
    throw new Error(`Not a rescript file: ${fileName}`);
  }

  if (lstatSync(fileName).isSymbolicLink()) {
    console.log(`Ignoring symlink ${fileName}`);
    return;
  }

  try {
    formatRescriptFile(fileName);
    console.log("Formatted", fileName);
  } catch {
    hasError = true;
  }
});

if (hasError) {
  process.exit(1);
}
