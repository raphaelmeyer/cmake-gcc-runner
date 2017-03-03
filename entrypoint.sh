#!/bin/bash

cd /project/target

# Copy answer to project
cp -r /project/answer/* .

# Compile
if make > /tmp/compilation_logs 2>&1; then
	echo "CG> redirect-streams \"Test results\""

	# Execute test
	"$@"
else
	echo "CG> redirect-streams \"Compilation logs\""

	cat /tmp/compilation_logs
fi
