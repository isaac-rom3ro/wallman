#!/bin/bash

background_path=""
lib_background="feh"

echo -n "Please provide the path of your background: "
read background_path

function check_package_manager()
{
  if command -v apt >/dev/null 2>&1; then
    echo "apt"
  fi
}

package_manager=$(check_package_manager)

if $package_manager list --installed 2>/dev/null | grep -q "^$PACKAGE/"; then
  echo "$package_manager is installed"
else
  echo "not installed"
fi
