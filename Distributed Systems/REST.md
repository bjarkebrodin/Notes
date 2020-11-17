---
title: REST - Representational State Transfer
keywords: REST, API
---

TL;DR: REST is an architectural style for handling state in 
web service architecture. We use stateless servers and pass
all relevant information about state through requests and 
responses. In APIs, RESTful APIs are subject to an amount 
of conventions that any developer should be familiar with.

## State in distributed systems

Problem with stateful transfers on client-server architecture : 
scalability is horrible, we would need a thread for each of the 
clients

We make it scalable by removing the state from a process,
and instead create a model that relies on all the necessary 
state information being a part of each request. This does have 
cost in request size, because we more frequently send duplicate
information over the network. This tradeoff is however arguably
woth it, since it allows for a more visible, scalabe and reliable
system. 

## REST 

Representation state transfer is an architectural style that 
defines a set of constraints for creating webservices. When a 
webservice conforms to these constraints we say that it is 
RESTful. Key for REST is that we have a stateless server, 
and package all necessary information about client state in 
each request. The constraints defining RESTful systems are;

- Client-server architecture
- Statelessness
- Cacheability
- Layered System
- Code on demand (optional)
- Uniform interface
  - Resource id in request
  - Resource manipulation through representation
  - Self descriptive messages
  - Hypermedia as the engine of application state (HATEOAS)

## RESTful APIs

Use common HTTP actions: `GET`,`PUT`,`POST`,`DELETE`

Mapping CRUD to a REST API can simply be done.

## Create

Send `POST` request to collection
`HTTP POST {base}/collection`

201 and a location header if all is well
200 if created ressource cannot be identified by url
204 can also be used in the latter case

req body: ressource to create

res header: response, location of created
res body: created object

## Read 

Send `GET` request to either collection or object; e.g.
`HTTP GET {base}/collection`
`HTTP GET {base}/collection/id`

200 expected and requested representation expected in 
the response.
400 if the resource could not be found on the server
404 if the request was formed incorrectly

req body: none

res header: response
res body: requested ressources

## Update

If update/replace send `PUT` request to object 
(may create if doesn't exist).
`HTTP PUT {base}/collection/id`

201 if a new ressource was created
200 if existing was modified
204 if the latter but no body should be sent back

req body: updated representation

res header: response (?location?)
res body: updated ressource

NB. `PATCH` is not supported in PHP, Tomcat, Django and more..
if update/existing send `PATCH` request to object
`HTTP PATCH {base}/collection/id`

req body: see [PATCH requests on MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH)

## Delete

Send `DELETE` request to object
`HTTP DELETE {base}/collection/id`

200 generally
202 if the action is queued
204 if successful but no entity included in response

req body: representation or nothing

res header: response
res body: deleted ressource

---

## Resources

[Fielding R.C. 2000](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)