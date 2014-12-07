#!/bin/sh

# Use P4 as visual merge tool
git config --global merge.tool p4mergetool
git config --global mergetool.p4mergetool.cmd \
"p4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
git config --global mergetool.p4mergetool.trustExitCode false
git config --global mergetool.keepBackup false

# Use P4 as diff tool
git config --global diff.tool p4mergetool
git config --global difftool.p4mergetool.cmd \
"p4merge \$LOCAL \$REMOTE"
