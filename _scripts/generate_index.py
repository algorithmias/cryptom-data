import os
import json

def directory_structure(dir):
    structure = {}
    for entry in os.listdir(dir):
        path = os.path.join(dir, entry)
        if os.path.isdir(path):
            structure[entry] = directory_structure(path)
        else:
            structure[entry] = entry
    return structure

moments_dir = os.path.join(os.getcwd(), 'moments')
moments_structure = directory_structure(moments_dir)

with open(os.path.join(os.getcwd(), '_site', 'moments_index.json'), 'w') as file:
    json.dump(moments_structure, file, indent=4)