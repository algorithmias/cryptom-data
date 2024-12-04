#!/bin/sh

node @scripts/generate_index.js
bundle exec jekyll build

# #!/bin/sh
# python generate_directory_index.py
# bundle exec jekyll build