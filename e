#!/bin/bash

if [[ $TERM =~ ^xterm ]]; then
	gvim "$@"
else
	vim "$@"
fi
