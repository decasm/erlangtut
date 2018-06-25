
-module(tut7).
-export([format_temps/1]).

format_temps(List_of_cities) ->
	Converted = convert_list_to_c(List_of_cities),
	print_temp(Converted),
	{Max_city,Min_city} = find_max_and_min(Converted),
	print_max_and_min(Max_city,Min_city).

convert_list_to_c([{Name, {f,F}} | Rest]) ->
	Converted = {Name, {c, (F-32) * 5/9 }},
	[Converted | convert_list_to_c(Rest)];
convert_list_to_c([City|Rest]) ->
	[City | convert_list_to_c(Rest)];
convert_list_to_c([]) ->
	[].


print_temp([{Name,{c,Temp}} | Rest]) ->
	io:format("~-15w ~w c ~n", [Name, Temp]),
	print_temp(Rest);
print_temp([]) ->
	ok.

find_max_and_min([City|Rest]) ->
	find_max_and_min(Rest, City,City).

find_max_and_min([{Name,{c,Temp}}|Rest],
				 {Max_name,{c,Max_temp}},
				 {Min_name,{c,Min_temp}}) ->

	if Temp > Max_temp ->
		   Max_city = {Name, {c, Temp}};
	   true ->
	   	   Max_city = {Max_name, {c, Max_temp}}
	end,

	if Temp < Min_temp ->
		   Min_city = {Name, {c, Temp}};
	   true ->
	   	   Min_city = {Min_name, {c, Min_temp}}
	end,
	find_max_and_min(Rest,Max_city,Min_city);
find_max_and_min([], Max_city, Min_city) ->
	{Max_city, Min_city}.

print_max_and_min( {Max_name, {c,Max_temp}}, {Min_name, {c,Min_temp}} ) ->
	io:format("Max temperature was ~w in ~w c ~n", [Max_temp, Max_name]),
	io:format("Min temperature was ~w in ~w c ~n", [Min_temp, Min_name]).




%tut7:format_temps([ { moscow, { c, -10 }},
%					{ cape_town, { f, 70 }},
%					{ stockholm, { c, -4 }}, 
%					{ paris, { f, 28 }},
%					{ london, { f, 36 }} ]).
