Raven, Multi Activation platform for Ericsson IMS
=================================================

This project is implementing an activation platform for rapid provisioning
and migration scenarios, using modern interafaces.

General notes
-------------

Currently, a lot of the pieces are missing, some are implemented only partially.

Here is a checklist of most important areas:

* Message parsing/generation API is somewhat clumsy.

Hacking the code
----------------

0. Build the skeleton application:
   $ make
   - or -
   $ ./rebar compile

1. Start up the API application:
   $ ./start.sh
