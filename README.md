Project Skeleton for the api app.

You should find in this directory:

README : this file
Makefile : simple make commands
rebar : the Rebar build tool for Erlang applications
rebar.config : configuration for Rebar
start.sh : simple startup script for running api
/ebin
  /api.app : the Erlang app specification
/src
  /api_app.erl : base module for the Erlang application
  /api_sup.erl : OTP supervisor for the application
  /api_resource.erl : a simple example Webmachine resource
/priv
  /dispatch.conf : the Webmachine URL-dispatching table
  /www : a convenient place to put your static web content

You probably want to do one of a couple of things at this point:

0. Build the skeleton application:
   $ make
   - or -
   $ ./rebar compile

1. Start up the skeleton application:
   $ ./start.sh

2. Change the basic application:
   edit src/api_resource.erl

3. Add some new resources:
   edit src/YOUR_NEW_RESOURCE.erl
   edit priv/dispatch.conf
