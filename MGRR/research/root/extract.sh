#!/bin/bash
# currently only does ui/ui_core and ui_core_us, nothing in ui/360/ yet
# todo: implement the other 360/ files as well as non-english language support

# make directories
mkdir ./bin
mkdir ./dump
mkdir ./output
mkdir ./temp_rebuild
mkdir ./working

# dump Data000.cpk
## ./bin/quickbms ./bin/cpk.bms ./Data000.cpk ./dump

# extract dtt files (!360)
ruby ./bin/bayonetta_tools/dat_extractor.rb ./dump/ui/ui_core.dtt
ruby ./bin/bayonetta_tools/dat_extractor.rb ./dump/ui/ui_core_us.dtt

# extract wtb files (!360)
ruby ./bin/bayonetta_tools/wtb_wta_extractor.rb ./dump/ui/ui_core_dtt/core.wtb
ruby ./bin/bayonetta_tools/wtb_wta_extractor.rb ./dump/ui/ui_core_us_dtt/core.wtb

# copy dds textures to working folder (!360)
cp -v ./dump/ui/ui_core_dtt/core_wtb/core_000.dds ./working/core_000.dds
cp -v ./dump/ui/ui_core_dtt/core_wtb/core_001.dds ./working/core_001.dds
cp -v ./dump/ui/ui_core_dtt/core_wtb/core_002.dds ./working/core_002.dds
cp -v ./dump/ui/ui_core_dtt/core_wtb/core_003.dds ./working/core_003.dds