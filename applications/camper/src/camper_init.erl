%%%-------------------------------------------------------------------
%%% @copyright (C) 2010-2018, 2600Hz
%%% @doc
%%%
%%%
%%% @author SIPLABS LLC (Maksim Krzhemenevskiy)
%%% @end
%%%-------------------------------------------------------------------
-module(camper_init).

-include("camper.hrl").

-export([start_link/0]).

%%--------------------------------------------------------------------
%% @doc Starts the app for inclusion in a supervisor tree
%%--------------------------------------------------------------------
-spec start_link() -> kz_types:startlink_ret().
start_link() ->
    _ = declare_exchanges(),
    'ignore'.

%%--------------------------------------------------------------------
%% @private
%% @doc Ensures that all exchanges used are declared
%%--------------------------------------------------------------------
-spec declare_exchanges() -> 'ok'.
declare_exchanges() ->
    kapi_call:declare_exchanges(),
    kapi_offnet_resource:declare_exchanges(),
    kapi_resource:declare_exchanges(),
    kapi_delegate:declare_exchanges(),
    kapi_dialplan:declare_exchanges().
