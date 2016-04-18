# Apache Drill Docker container

A single node [Apache Drill](http://drill.apache.org/) container, to quick start and learn Drill.

## Build the container

You can build the container from the Dockerfile. In order to do that run:

`docker build -t dialonce/drill . `

## Pull the container

We have created an automed Docker container, available from the Docker registry as a trusted build. We suggest to always use this image, as we maintain, support and continuously improve it.

`docker pull dialonce/drill`

## Run the container

Once you have pulled the container you are ready to use Drill. We launch `SQLline` during the bootstrap process, so you are ready to issue queries. Please note that the data has to be available in the container (Drill comes with sample data).

`docker run -it -p '8047:8047' dialonce/drill /opt/drill/bin/drill-embedded`

## Run the container with volume

For a more comprehensive Drill experience you can query data external to your container - the only thing you will need to do is to mount an external folder from your `host`.
Once the volume is mounted you can access the Drill UI at `http://CONTAINER_IP:8047`, you can either add a new file system based storage plugin workspace pointing to the mounted folder, or use the default file system storage workspace.

`docker run -it -p '8047:8047' -v /data:/data dialonce/drill /opt/drill/bin/drill-embedded`

## Rest API

Get Drillbit status: `http://CONTAINER_IP:8047/status`       
Get all submitted queries: `http://CONTAINER_IP:8047/queries`       
Get status of a given query:`http://CONTAINER_IP:8047/query/{QUERY_ID}`
