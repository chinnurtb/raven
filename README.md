Raven, Web Console for Ericsson IMS
=================================================

Raven is via a well designed RESTfull API implementing an web console
for administration of cloud services based on Ericsson IMS.

General notes
-------------

Currently, a lot of the pieces are missing, some are implemented only partially.

Here is a checklist of most important areas:

* Views is hardcoded in dispatch.conf.
* View logic not yet implemented.
* HATEOAS not yet implemented.
* Link Layer not yet implemented.

Hacking the code
----------------

Build the skeleton application:
    
    $ ./rebar compile
    
Start up the API application:
    
    $ ./start.sh

Create a new group resource via the API

    curl -H "Accept: application/json" -X POST http://localhost:8000/views/iserfik/groups/99999999 -d '{}'


    

