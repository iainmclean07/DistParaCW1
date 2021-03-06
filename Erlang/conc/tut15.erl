-module(tut15).
-export([start/0, ping/2, pong/0]).

ping(0, Pong_PID) ->
    pong ! finished,
    io:format("ping finished~n", []);
ping(N, Pong_PID) ->
    pong ! {ping, self()},
    receive 
        pong ->
            io:format("Ping received pong~n",[])
    end,
    ping(N - 1, Pong_PID).

pong() ->
    receive
        finished ->
            io:format("Pong finished~n", []);
        {ping, Pong_PID} ->
            io:format("Pong received ping~n", []),
            Pong_PID ! pong,
            pong()
        end.

start() ->
    register(pong, spawn(tut15, pong, [])),
    spawn(tut15, ping, [3, Pong_PID]).