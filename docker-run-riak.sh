docker run -v etc-riak:/etc/riak -v var-lib-riak:/var/lib/riak --publish=8087:8087 --publish=8098:8098 -d binarytemple/riak:latest
