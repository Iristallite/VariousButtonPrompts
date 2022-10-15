#!/bin/bash

sudo apt update
sudo apt install ruby ruby-dev git build-essential zlib1g-dev libassimp-dev imagemagick
gem install --user-install nokogiri libbin assimp-ffi zstd-ruby