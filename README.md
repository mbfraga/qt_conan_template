# Qt Conan Template

This is a bad template for using qt with conan. It is neither meant to be used
in production or even for a pet project. It has a very specific personal
purpose--please do not use or even try to learn anything from it.

All credit goes to the project from which this is forked. Except the bad parts.


## Instructions
For now, use for both linux or windows. In the future, on linux, it would be
better to just use qt development packages from your repository

This assumes minimal knowledge of a terminal and shell navigation.

1. Install conan (via pip or other--please make sure its in your path
2. Clone this repo and go to its root path `cd ~/gitland/qt_conan_template`
3. `mkdir build`
4. `cd build`
5. `cmake ..`
6. On windows, open solution with visual studio.
6. On linux, `make`



## Linux

Requires:
sudo apt install -y --no-install-recommends libxcb-dri3-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-sync-dev libxcb-util-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev xorg-dev


