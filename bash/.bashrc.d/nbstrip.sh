#!/bin/sh
# .bashrc.d/nbstrip.sh: Add function to handle ipynb filtering with jq
# vim: ts=2 sw=2 cc=80

nbstrip() {
	if ! which jq >/dev/null; then
		echo "jq is required to use nbstrip" >&2
		return 1
	fi
	jq --indent 1 \
	    '(.cells[] | select(has("outputs")) | .outputs) = []
	     | (.cells[] | select(has("execution_count")) | .execution_count) = null
	     | .metadata = {"language_info": {"name": "python", "pygments_lexer": "ipython3"}}
	     | .cells[].metadata = {}
	    ' "$@"
	return $?
}
