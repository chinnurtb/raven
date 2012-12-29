Raven, Multi Activation platform for Ericsson IMS
=================================================

This project is implementing an activation platform for rapid provisioning
and migration scenarios, using modern technologies.

General notes
-------------

Currently, a lot of the pieces are missing, some are implemented only partially.

Here is a checklist of most important areas:

* Subscriber views are hardcoded in resource file.
* subscriber view logic not yet implemented. 

Hacking the code
----------------

Build the skeleton application:
   $ make
   - or -
   $ ./rebar compile

Start up the API application:
   $ ./start.sh
