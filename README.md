# gr-satellites-docker
gr-satellites-5.2-git docker environment with gnuradio-3.10 python-3.10

## Description
Latest gnuradio-3.10 is not included in many of the distributions used out there so a simple solution is to run this in Docker.<br>
It's based on Debian bookworm/testing and gr-satellites is built from source. For now it's the latest versions but ther may be version pinning.

## Building
Installed Docker and user that has access to run docker is a prerequisite. See this [guide](https://github.com/kng/satnogs-client-docker/blob/main/GUIDE.md#install-dockerio) if you need help with this.<br>
Launch the build script: `./build.sh`<br>
It will build and tag the image `knegge/gr-satellites:latest`<br>
The Dockerfile can certainly be modified to have the same uid/gid as your host user to make permissions less of an issue.

## Running
The home directory of the user `grsat` in the container is mapped to the host via bind mount, so scripts and results can easily be shared between the host and container.<br>
The default location for this is defined in the run script: `GRHOME=~/grsat`<br>
If you have more locations with data, they can be mounted with additional lines in `run.sh`.<br>
For example: `-v /mnt/data:/mnt:ro \` which will mount the host `/mnt/data` to `/mnt` read-only inside the container.

Start the container with: `./run.sh` and you will be granted a shell.<br>
```
grsat@4c67298c331b:~$ gr_satellites --version
gr_satellites v5.2.0-git
Copyright (C) 2020 Daniel Estevez
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

If you have a script/command to run (located in the ~/grsat), it can be executed directly with `./run.sh ./myscript.sh` or `./run.sh gr_satellites --list_satellites`.

Every time the container exits it will be removed. Any data not stored in the home directory will be lost and a clean environment will be launched the next run.
