# neo4j-bloom

## Introduction

### Why I LOVE Neo4j

Let me start by saying that I LOVE Neo4j. I love the whole idea of a Graph Database, with which you can basically express any data as how you would draw it on a white-board. Neo4j is a Graph Database.

On top of that add its query language called Cypher, which is a near-natural query language for asking questions about the model.

On top of that add its amazing tool called Neo4j Bloom, which makes it a breeze to analyze the data model, extend it, or even add automations depending on what kind of data you added...

### The problem

... Except for one thing. The version of Neo4j Bloom that is shipped with the most recent version of Neo4j Desktop is NOT the most recent version. It has one major drawback: you can add Nodes to a selection, but you cannot unselect them. 🙄

I took the liberty of reporting a bug: https://github.com/neo4j-devtools/neo4j-bloom/issues/60

### The potential solution

@GlacialBoy was kind enough to provide an elaborate response. (Thanks, @GlacialBox!) He even created a video demonstrating that de-selection is, in fact, working.

Thanks to his post I learned two things:

1. There is a more recent version of Neo4j Bloom that solves this very issue. It even adds Lasso selection to the mix, and you can unselect Nodes either one by one, using Box selection, or with Lasso selection. 
2. That newer version does **not** ship with the most recent version of Neo4j Desktop.

I tried upgrading the version that shipped with Neo4j Desktop, but I simply couldn't make it work.

### The actual solution

[https://neo4j.com/deployment-center/#tools-tab](https://neo4j.com/deployment-center/#tools-tab) provides a download link for the most recent version of Neo4j Bloom: 2.20.0. It gives a zip-file that contains the zipfile `bloom-2.20.0-assets.zip` and three jar-files where I don't know what to do with it.

On [https://neo4j.com/docs/bloom-user-guide/current/bloom-installation/advanced-installation/](https://neo4j.com/docs/bloom-user-guide/current/bloom-installation/advanced-installation/) I found instructions how Neo4j Bloom could be run in a Web Server.

I can do that...

## Implementation

I created a `Dockerfile` that uses the latest version of `nginx`.

I unzipped the `bloom-2.20.0-assets.zip` and put it in the `/bloom` directory in the image.

I took nginx's default configuration `/etc/nginx/conf.d/default.conf`, changed the path to `/bloom`, and put it in place of the existing one.

I also created a `Makefile` that simplifies or documents how to build and run the container.

After building and running it, you can open http://localhost:8080 in your browser to get started with the most recent version of Neo4j Bloom.

## Known Issues

- The `nginx.conf` that is displayed on the user guide has configuration like the number of worker connections, keepalive, and a few others. I didn't incorporate those in `/etc/nginx/nginx.conf`, but just used the default configuration. If we run into issues, we may have to change that file.
- I unzipped `bloom-2.20.0-assets.zip`. I probably didn't need to do that. I believe that if I would just keep the zip file, then the Docker Engine would extract it into the docker image.
- One could also go to [https://bloom.neo4j.io/](https://bloom.neo4j.io/), click "Connect", type "localhost" (which will change the protol to `neo4j://` which you previously couldn't select), and then it will also work. 🤦‍♂
