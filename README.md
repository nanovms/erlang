# erlang
patches for erlang to run on Nanos

Grab Source:
```
wget http://erlang.org/download/otp_src_23.0.tar.gz
```

Patch your repo:
```
patch -p1 -ruN -d ~/otp < 0001-BEAM-embed-erlexec-and-EPMD.patch
patch -p1 -ruN -d ~/otp < 0002-kernel-auth-erl-skip-cookie-file-permission-checks.patch
patch -p1 -ruN -d ~/otp < 0003-erl_child_setup_thread.patch
```

Build:
```
./configure && make
sudo make install
```

Build Hello World:
```
./erl -compile hi
./erl -noshell -s hi start -s init stop
```

Config:
```
{
  "Env": {
    "HOME": "/",
    "ROOTDIR": "/usr/local/lib/erlang",
    "BINDIR": "/usr/local/lib/erlang/erts-11.0/bin",
    "EMU": "beam",
    "PROGNAME": "hi"
  },

  "Args": ["/usr/local/lib/erlang/erts-11.0/bin/erlexec", "-noshell", "-s", "hi", "start", "-s", "init", "stop", "+S", "1"],

  "Files": ["hi.beam"],
  "Dirs": ["usr"]
}
```

More Prep:
```
mkdir -p usr/local/lib
cp -R /usr/local/lib/erlang usr/local/lib/.
cp /usr/local/lib/erlang/erts-11.0/bin/erlexec .
```

RUN

```
ops run -c config.json erlexec

[/usr/local/lib/erlang/erts-11.0/bin/erlexec -noshell -s hi start -s
init stop +S 1]
booting /home/eyberg/.ops/images/erlexec.img ...
assigned: 10.0.2.15
Hello, world!
exit status 1
```
