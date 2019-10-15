#!/bin/bash
set -ex

if ! [ -x "$(command -v xcodegen)" ]; then
  echo "Installing XcodeGen." >&2
  brew update && brew install xcodegen
fi

echo "Generating project file..."
xcodegen generate --spec $path_to_spec

# Options:
#   --cache-path <value>     Where the cache file will be loaded from and save to. Defaults to ~/.xcodegen/cache/{SPEC_PATH_HASH}
#   -c, --use-cache          Use a cache for the xcodegen spec. This will prevent unnecessarily generating the project if nothing has changed
#   -h, --help               Show help information
#   -p, --project <value>    The path to the directory where the project should be generated. Defaults to the directory the spec is in. The filename is defined in the project spec
#   -q, --quiet              Suppress all informational and success output
#   -s, --spec <value>       The path to the project spec file. Defaults to project.yml


#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
#envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
