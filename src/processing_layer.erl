%% @author Thomas Elsgaard <thomas.elsgaard@erlangx.com>
%% @copyright 2012 Thomas Elsgaard.
%% @doc Raven API.


-module(processing_layer).
-export([process_activation_order/0, sv_exists/1]).
-include("../deps/amqp_client/include/amqp_client.hrl").


%%----------------------------------------------------------------------
%% Function: process_order/0
%% Purpose: Post RabbitMQ messages to the link layer .
%% Args:   
%% Returns:
%%----------------------------------------------------------------------
process_activation_order() ->
    %Start a network connection
    {ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    % Open a channel on the connection
    {ok, Channel} = amqp_connection:open_channel(Connection),

    %Declare a queue
    Declare = #'queue.declare'{queue = <<"Broadworks">>},
    #'queue.declare_ok'{}
    = amqp_channel:call(Channel, Declare),

    %Publish a message
    Payload = <<"foobar">>,
    Publish = #'basic.publish'{exchange = <<>>, routing_key = <<"Broadworks">>},
    amqp_channel:cast(Channel, Publish, #amqp_msg{payload = Payload}),

    %Close the channel
    amqp_channel:close(Channel),
    %Close the connection
    amqp_connection:close(Connection),
    ok.
    
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
    
    
    