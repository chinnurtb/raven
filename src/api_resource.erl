%% @author author <author@example.com>
%% @copyright YYYY author.
%% @doc Example webmachine_resource.

-module(api_resource).
-compile([export_all]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.


allowed_methods(RD, Ctx) ->
    {['HEAD', 'POST'], RD, Ctx}.

content_types_provided(RD, Ctx) ->
    {[{"application/json", to_json}], RD, Ctx}.

process_post(RD, Ctx) ->
    %match the correct sv (subscriber view) from Uri
    case wrq:path_info(sv, RD) of
        undefinded ->
            {true, RD, Ctx};
        
        "example" -> 
            Body = json_body(mochiweb_util:parse_qs(wrq:req_body(RD))),
            {true, wrq:append_to_response_body(Body, RD), Ctx};
        _->
            {true, RD, Ctx}
    end.

json_body(QS) -> mochijson:encode({struct, QS}).