####################
# git_root Changes directory to root of git repository
# GLOBALS:
# ARGUMENTS:
# RETURNS: True if success, false, otherwise
####################
git_root() {
  local BACKPATH='.'
  while [ ! -d "${BACKPATH}/.git" ]; do
    if [ "$BACKPATH" = '/' ]; then
      echo "This does not appear to be a git repo"
      return 1
    fi
    BACKPATH=$(readlink --canonicalize "${BACKPATH}/..")
  done

  cd "${BACKPATH}"

  # Return True
  return 0
}
