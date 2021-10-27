-module(tut4).
-export([list_length/1]).

list_length([]) ->
    io:format("Hello World!~n", []),
    0;
list_length([First | Rest]) ->
    1 + list_length(Rest).
