turbulent/mcrouter
---

This is a an ubuntu 18.04 (bionic) based Docker image for [Mcrouter](https://github.com/facebook/mcrouter). It uses/installs the facebook tracked bionic deb for mcrouter.

More info on mcrouter in [introduction to mcrouter](https://code.facebook.com/posts/296442737213493).

Usage
---
To run mcrouter you need to specific both a port number to listen on `-p <port>` and a config provided via either a file `-f /path/to/config/file.json`  or string `--config-str=<json>` to the docker COMMAND.

Refer to the [mcrouter wiki](https://github.com/facebook/mcrouter/wiki/Command-line-options) for more command line arguments.

Example: configuration via file mount
---

        docker run -d \
        -p 5000:5000 \
        -v mymcrouterconfig.json:/usr/local/etc/mcrouter/mcrouter.json \
        turbulent/mcrouter

Example: configuration via config-str command:
---

        docker run -d \
        -p 5000:5000 \
        turbulent/mcrouter
        mcrouter --config-str='{"pools":{"A":{"servers":["cache:11211"]}},"route":"PoolRoute|A"}'
