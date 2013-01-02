%% @author Thomas Elsgaard <thomas.elsgaard@erlangx.com>
%% @copyright 2012 Thomas Elsgaard.
%% @doc Raven API.

-module(api_resource).
-compile([export_all]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.


allowed_methods(RD, Ctx) ->
    {['HEAD', 'POST'], RD, Ctx}.

content_types_provided(RD, Ctx) ->
    {[{"application/json", to_json}], RD, Ctx}.
    
%% Webmachine states that each resource is available. To change that behaviour
%% we implement resource_exists/2 and return true/false if a sv exists.
resource_exists(RD, Ctx) ->
    Sv = wrq:path_info(sv, RD),
    {processing_layer:sv_exists(Sv), RD, Ctx}.

process_post(RD, Ctx) ->
    Order = json_body(mochiweb_util:parse_qs(wrq:req_body(RD))),
    processing_layer:process_activation_order(),
    {true, wrq:append_to_response_body(Order, RD), Ctx}.
 
json_body(QS) -> mochijson:encode({struct, QS}).

guid() ->
    binary_to_list(base64:encode(erlang:md5(term_to_binary(self())))).