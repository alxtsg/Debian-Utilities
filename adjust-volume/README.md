# Adjust-Volume #

## Description ##

A script for controlling the speaker volume.

## Requirements ##

* Debian GNU/Linux (`bullseye/sid`).
* PulseAudio (both `pulseaudio` and `pulseaudio-utils`).

## Installation ##

0. Download the script.
1. (Optional) Make the script executable (`chmod +x adjust-volume.sh`).

## Configuration ##

The following variables in the script should be modified:

* `volume_change_percent`: The percentage of speaker volume to change in each
                           adjustment.

## Usage ##

To show the current speaker volume (in percentage):

```
sh adjust-volume.sh show
```

To mute the speaker:

```
sh adjust-volume.sh mute
```

To unmute the speaker:

```
sh adjust-volume.sh unmute
```

To increase the speaker volume:

```
sh adjust-volume.sh up
```

To lower the speaker volume:

```
sh adjust-volume.sh down
```
