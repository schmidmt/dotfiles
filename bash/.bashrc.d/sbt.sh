#!/bin/bash

sbt() {
	local buildsbt_path="$(fsbranchfind build.sbt)"
	local move=false
	if [ $? -eq 0 -a "$PWD" != "$(dirname "${buildsbt_path}")" ]; then
		move=true
		pushd "$(dirname "${buildsbt_path}")"	
	fi
	command sbt "$@"
	local_sbt_exit=$?
	if [ $move = true ]; then
		popd
	fi
	return $local_sbt_exit
}
