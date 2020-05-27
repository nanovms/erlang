% hi program
  -module(hi).
  -export([start/0]).

  start() ->
       io:fwrite("Hello, world!\n").
