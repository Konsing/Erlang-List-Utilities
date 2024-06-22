-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

myremoveduplicates(L) -> myremoveduplicates(L, []).

myremoveduplicates([], Acc) -> lists:reverse(Acc);
myremoveduplicates([H|T], Acc) ->
    case lists:member(H, T) of
        true -> myremoveduplicates(T, Acc);
        false -> myremoveduplicates(T, [H|Acc])
    end.

myintersection(L1, L2) -> [X || X <- L1, lists:member(X, L2)].

mylast([]) -> [];
mylast(L) -> [lists:last(L)].

myreverse(L) -> lists:reverse(L).

myreplaceall(_, _, []) -> [];
myreplaceall(ReplaceWith, ReplaceTarget, [Head|Tail]) ->
    NewHead = case Head of
        ReplaceTarget -> ReplaceWith;
        _ -> Head
    end,
    [NewHead|myreplaceall(ReplaceWith, ReplaceTarget, Tail)].