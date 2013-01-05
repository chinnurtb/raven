%% @author Thomas Elsgaard <thomas.elsgaard@erlangx.com>
%% @copyright 2012 Thomas Elsgaard.
%% @doc Raven API.

-module(api_resource).
-compile([export_all]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.


allowed_methods(RD, Ctx) ->
    {['GET', 'HEAD', 'POST'], RD, Ctx}.

content_types_provided(RD, Ctx) ->
    {[{"text/html", to_html}, {"application/json", to_json}], RD, Ctx}.
    
process_post(RD, Ctx) ->    
    Grp_id = wrq:path_info(grp_id, RD),
    {struct, Json} = mochijson:decode(wrq:req_body(RD)),
    
    case wrq:path_info(user_id, RD) of
        undefined -> %/views/iserfik/groups/{group_id}
            processing_layer:group_create(Grp_id, Json);
            
        User_id -> %/views/iserfik/groups/{group_id}/users/{user_id}
            processing_layer:user_create(Grp_id, User_id, Json)
    end,
{true, wrq:append_to_response_body(wrq:req_body(RD), RD), Ctx}.


json_body(QS) -> mochijson:encode({struct, QS}).