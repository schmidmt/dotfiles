####################
# git_root Changes directory to root of git repository
# GLOBALS:
# ARGUMENTS:
# RETURNS: True if success, false, otherwise
####################
git_root() {
  cd "$(git rev-parse --show-toplevel)"
}
