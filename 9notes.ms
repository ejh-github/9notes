.TL
Nein Notes
.AU
Elias Howell
.AI
Texas Tech University

.NH
Temporary Display Timeout Fix
.LP
echo hwblank off >> /dev/vgactl

.NH
Updating Your System
.LP
sysupdate
.LP
cd /sys/src
.LP
mk install
.LP
mk clean
.LP
reboot

.NH
Installing Git9
.LP
cd /tmp
.LP
hget https://orib.dev/git/git9/HEAD/snap.tar.gz | tar xvz
.LP
cd git9
.LP
mk all
.LP
mk install
.LP
mkdir $home/src
.LP
git/clone gits://orib.dev/git9
.LP
cd git9
.LP
mk all
.LP
mk install
.LP
mkdir -p $home/lib/git
.LP
mkdir -p $home/lib/git
.LP
echo '
.LP
[user]
.LP
name=Dan Quayle
.LP
email=quayle@idiot.gov
.LP
\' > $home/lib/git/config

.NH
Installing Netsurf
.LP
mkdir $home/src
.LP
cd $home/src
.LP
git/clone git://github.com/netsurf-plan9/nsport
.LP
cd nsport
.LP
fetch clone git
.LP
cd nsport
.LP
mk
.LP
mk install

.NH
Installing OpenBSD In VMX
.LP
hget https://cdn.openbsd.org/pub/OpenBSD/6.4/amd64/install64.fs >install64.fs
.LP
hget https://cdn.openbsd.org/pub/OpenBSD/6.4/amd64/bsd >bsd
.LP
hget https://cdn.openbsd.org/pub/OpenBSD/6.4/amd64/bsd.rd >bsd.rd
.LP
mkdir -p vmx/vm
.LP
dd </dev/zero -of vmx/vm/openbsd -bs 1 -count 1 -seek `{echo '20*1024*1024*1024-1' | pc -n}
.LP
chmod +t vmx/vm/openbsd
.LP
vmx -M 3G -n ether0 -d vmx/vm/openbsd -d install64.fs -v vesa:1920x1080 bsd.rd
.LP
vmx -M 3G -n ether0 -d vmx/vm/openbsd -v vesa:1920x1080 bsd 'device=sd0a'

.NH
Fix Time
.LP
aux/timesync -r

.NH
SSH Setup
.LP
auth/rsagen -t 'service=ssh' >$home/lib/sshkey
.LP
auth/rsa2ssh $home/lib/sshkey >$home/lib/sshkey.pub
.LP
cat $home/lib/sshkey >/mnt/factotum/ctl

.NH
Shithub
.SH
Creating a Repository
.LP
rcpu -h shithub.us -c newrepo -d 'description here' -c 'glenda@9front.gov' reponame
.LP
mkdir reponame
.LP
cd reponame
.LP
git/init -u hjgit://shithub.us/glenda/reponame
.LP
touch file.c
.LP
git/add file.c
.LP
git/commit -m 'first commit' file.c
.LP
git/push
.SH
Accessing Repos
.LP
rcpu -h shithub.us
.LP
cd /usr/git/glenda

