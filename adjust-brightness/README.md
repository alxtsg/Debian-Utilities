# Adjust-Brightness #

## Description ##

A script for controlling the screen backlight brightness of a laptop.

## Requirements ##

* Debian GNU/Linux (`bullseye/sid`).

## Installation ##

0. Download the script.
1. (Optional) Make the script executable (`chmod +x adjust-brightness.sh`).

## Configuration ##

The following variables in the script should be modified:

* `backlight_device`: The backlight device of the laptop. The device name can
                      be found by checking the `/sys/class/backlight` directory.
* `brightness_step`: The amount of brightness to increase or decrease in each
                     adjustment.

## Usage ##

To show the current brightness:

```
sh adjust-brightness.sh show
```

To increase the brightness:

```
sh adjust-brightness.sh up
```

To decrease the brightness:

```
sh adjust-brightness.sh down
```
