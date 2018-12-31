# flightradar24 feeder only (no dump1090) #

`fr24feed` on alpine linux. It's meant to connect to an existing `dump1090`
instance (e.g. [danmilon/dump1090-fa-arm32v6](https://cloud.docker.com/u/danmilon/repository/docker/danmilon/fr24feed-arm32v6)).


## How to run ##

```
docker run \
  -v $PWD/fr24feed.conf:/etc/fr24feed.conf \
  danmilon/fr24feed-arm32v6:latest
```

Unfortunately I haven't found any documentation for the configuration file, but
you can run `fr24feed --reconfigure` to go through an interactive process to
write the configuration file.

The following should be enough for most use cases:

```
receiver="beast-tcp"
fr24key="..."
host="dump1090-host:30005"
bs="no"
raw="no"
logmode="0"
mlat="yes"
mlat-without-gps="yes"
```

Run without `fr24key` once to get one assigned, and afterwards put it in the
configuration file like above.
