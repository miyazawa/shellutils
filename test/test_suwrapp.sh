#!/usr/bin/ksh
# for suwrap

test_suwrapper()
{
	export PASSWDFILE=./test/fructures/passwd
	export SUTARGET=test001

	. ./lib/suwrapper.sh

	suwrapper whoami
	ret=$?

	assertEquals "return code: " 0 "$ret"
}

. /usr/share/shunit2/shunit2
