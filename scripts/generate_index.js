const fs = require("fs");
const path = require("path");

function directoryStructure(dir) {
    let structure = {};
    fs.readdirSync(dir).forEach(entry => {
        let fullPath = path.join(dir, entry);
        if (fs.lstatSync(fullPath).isDirectory()) {
            structure[entry] = directoryStructure(fullPath);
        } else {
            structure[entry] = entry;
        }
    });
    return structure;
}

const dataPaths = ["moments", "signals", "trendlines"];

for (const dataPath of dataPaths) {
    const directory = path.join(process.cwd(), dataPath);
    const structure = directoryStructure(directory);
    const buildDir = path.join(process.cwd(), "build");
    if (!fs.existsSync(buildDir)) {
        fs.mkdirSync(buildDir);
    }
    fs.writeFileSync(path.join(buildDir, `${dataPath}.json`), JSON.stringify(structure, null, 4));
    fs.writeFileSync(path.join(process.cwd(), "_data", `${dataPath}.json`), JSON.stringify(structure, null, 4));
}
