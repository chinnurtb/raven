%% @author Thomas Elsgaard <thomas.elsgaard@erlangx.com>
%% @copyright 2012 Thomas Elsgaard.
%% @doc Raven API.

-module(processing_layer).
-compile([export_all]).


%%----------------------------------------------------------------------
%% Function: process_order/2
%% Purpose: Post RabbitMQ messages to the link layer .
%% Args:   
%% Returns:
%%----------------------------------------------------------------------
process_order() ->
    io:format("order received~n").
    
%%----------------------------------------------------------------------
%% Function: sv_exists/1
%% Purpose: check is the subscriber vie module is loaded
%% Args: Sv is subscriber view name  
%% Returns: true | false
%%----------------------------------------------------------------------
sv_exists(Sv) ->
    case Sv of
        "example" ->
            true;
        _->
            false
    end.
    
    
    