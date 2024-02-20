lamp(wait_for_power_to_come_back):- tr('Lamp not working'), tr('Power is off'), tr('Fuse is good'), tr('Is there a power failure?').
lamp(wait_for_power_to_come_back):- tr('Lamp not working'), tr('Power is off'), tr('Circuit Breaker is on'), tr('Is there a power failure?').
lamp(replace_the_bulb):- tr('Lamp not working'), tr('Power is on'), tr('Bulb is bad').
lamp(replace_switch):- tr('Lamp not working'), tr('Power is on'), tr('Bulb is good'), tr('Switch is bad').
lamp(replace_plug):- tr('Lamp not working'), tr('Power is on'), tr('Bulb is good'), tr('Switch is good'), tr('Plug is bad').
lamp(replace_cord):- tr('Lamp not working'), tr('Power is on'), tr('Bulb is good'), tr('Switch is good'), tr('Plug is good'), tr('Cord is bad').
lamp(replace_outlet):- tr('Lamp not working'), tr('Power is on'), tr('Bulb is good'), tr('Switch is good'), tr('Plug is good'), tr('Cord is good'), tr('Wall outlet is bad').

:-dynamic yes/7, no/1.

tr(X):-
    (yes(X,_,_,_,_,_,_),!, true;
    (no(X),!, fail;
    ask(X))).

ask(Question):-
    write('Is the lamp experiencing any of the following: '),
    write(Question), write('?'),
    read(Response),
    (   (Response == yes),
    assertz(yes(Question,_,_,_,_,_,_));
    assertz(no(Question)), fail).

go:- retractall(yes(_,_,_,_,_,_,_)), lamp(Lamp),
    write('The lamps issue may be: '),
    write(Lamp),!.

go:- write('I cannot fix the lamp, please refer to someone else').
