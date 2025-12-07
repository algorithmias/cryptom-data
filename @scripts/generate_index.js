const fs = require('fs');
const path = require('path');

function directoryStructure(dir) {
  let structure = {};
  fs.readdirSync(dir).forEach(entry => {
    let fullPath = path.join(dir, entry);
    if (fs.lstatSync(fullPath).isDirectory()) {
      structure[entry] = directoryStructure(fullPath);
    } else {
      structure[entry] = "";
    }
  });
  return structure;
}

function makeDirectory(buildPath) {
  if (!fs.existsSync(buildPath)) {
    fs.mkdirSync(buildPath);
  }

}

const dataPaths = ['analogia', 'moments', 'signals', 'trendlines'];

for (const dataPath of dataPaths) {
  const directory = path.join(process.cwd(), dataPath);
  const structure = directoryStructure(directory);

  const rootDirectory = path.join(process.cwd());
  makeDirectory(rootDirectory);
  fs.writeFileSync(path.join(rootDirectory, `${dataPath}.json`), JSON.stringify(structure, null, 4));

  const buildDirectory = path.join(process.cwd(), '_data');
  makeDirectory(buildDirectory);
  fs.writeFileSync(path.join(buildDirectory, `${dataPath}.json`), JSON.stringify(structure, null, 4));
}
