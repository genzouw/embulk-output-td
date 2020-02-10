# embulk-output-td

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/embulk-output-td?style=for-the-badge)](https://hub.docker.com/r/genzouw/embulk-output-td/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/embulk-output-td.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/embulk-output-td/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/embulk-output-td.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/embulk-output-td/)


[![dockeri.co](https://dockeri.co/image/genzouw/embulk-output-td)](https://hub.docker.com/r/genzouw/embulk-output-td)

## Description

This is a container for importing data into Treasure Data using Embulk.

*Please contact me anytime if you have a problem or request! My information is posted at the bottom of this document.*


## Requirements

* [Docker](https://www.docker.com/)

## Installation

**You do not need to install !**

## Usage

Refer to "Create seed configuration file" on the following page for the description method of **"load.yml"**.

* [Bulk Import from CSV files &ndash; Arm Treasure Data](https://support.treasuredata.com/hc/en-us/articles/360001495428-Bulk-Import-from-CSV-files)

```bash
# Generate load.yml from seed.yml
$ docker run --rm -i -t --volumes-from td-config \
    -v $PWD:/workdir \
    --workdir /workdir \
    genzouw/embulk-output-td guess seed.yml -o load.yml

# Import to Treasure Data using load.yml
$ docker run --rm -i -t --volumes-from td-config \
    -v $PWD:/workdir \
    --workdir /workdir \
    genzouw/embulk-output-td run load.yml
```

## License

This software is released under the MIT License, see LICENSE.


## Help

Got a question ?

File a [Github issue](https://github.com/genzouw/embulk-output-td/issues), send an email to [genzouw@gmail.com](mailto:genzouw@gmail.com) or tweet to [@genzouw](https://twitter.com/genzouw) on Twitter.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
