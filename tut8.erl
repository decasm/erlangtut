
-module(tut8).
-export([reverse/1]).

reverse(List) ->
	reverse(List,[]).

reverse([Head|Rest],Reversed) ->
	reverse(Rest,[Head|Reversed]);
reverse([], Reversed)->
	Reversed.

