#!/bin/ksh
# module : su wrapper
# vim: ts=4 sw=4 sts=4 et
function suwrapper
{
        typeset PASSWD=$(cat $PASSWDFILE)

        /usr/bin/expect<<EOD >/dev/null
        spawn su - "-c $@"
        expect {
                "*assword:" { send "$PASSWD\r"; exp_continue }
        }
        catch wait result
        set OS_ERROR [ lindex \$result 2 ]
        if { \$OS_ERROR == -1 } {
                puts "Fail to exec"
                exit 127
        }
        set STATUS [ lindex \$result 3 ]

        exit \$STATUS
EOD
}
