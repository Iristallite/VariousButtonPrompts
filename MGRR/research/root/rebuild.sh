#!/bin/bash
# currently only does ui/ui_core and ui_core_us, nothing in ui/360/ yet
# todo: implement the other 360/ files as well as non-english language support

# make directories
mkdir ./temp_rebuild/
mkdir ./temp_rebuild/ui/
mkdir ./temp_rebuild/ui/ui_core/
mkdir ./temp_rebuild/ui/ui_core_us/
mkdir ./temp_rebuild/ui/360/
mkdir ./temp_rebuild/ui/360/ui_core/
mkdir ./temp_rebuild/ui/360/ui_core_us/
mkdir ./output/
mkdir ./output/ui/
mkdir ./output/ui/360/
mkdir ./output/ui/360/dlc1/
mkdir ./output/ui/360/dlc2/
mkdir ./output/ui/360/dlc3/
mkdir ./output/ui/dlc1/
mkdir ./output/ui/dlc2/
mkdir ./output/ui/dlc3/

# copy dds files (!360)
cp -v ./working/core_000.dds ./temp_rebuild/ui/ui_core/core_000.dds
cp -v ./working/core_001.dds ./temp_rebuild/ui/ui_core/core_001.dds
cp -v ./working/core_002.dds ./temp_rebuild/ui/ui_core/core_002.dds
cp -v ./working/core_003.dds ./temp_rebuild/ui/ui_core/core_003.dds
cp -v ./working/core_000.dds ./temp_rebuild/ui/ui_core_us/core_000.dds
cp -v ./working/core_001.dds ./temp_rebuild/ui/ui_core_us/core_001.dds
cp -v ./working/core_002.dds ./temp_rebuild/ui/ui_core_us/core_002.dds
cp -v ./working/core_003.dds ./temp_rebuild/ui/ui_core_us/core_003.dds

# copy metadata for core.wtb files (!360)
cp -rv ./dump/ui/ui_core_dtt/core_wtb/.metadata/ ./temp_rebuild/ui/ui_core/
cp -rv ./dump/ui/ui_core_us_dtt/core_wtb/.metadata/ ./temp_rebuild/ui/ui_core_us/

# pack textures (!360)
ruby ./bin/bayonetta_tools/wtb_wta_creator.rb ./temp_rebuild/ui/ui_core/
ruby ./bin/bayonetta_tools/wtb_wta_creator.rb ./temp_rebuild/ui/ui_core_us/

# copy messcore.wtb files (!360)
cp -v ./dump/ui/ui_core_dtt/messcore.wtb ./temp_rebuild/ui/ui_core/wtx_output/messcore.wtb
cp -v ./dump/ui/ui_core_us_dtt/messcore.wtb ./temp_rebuild/ui/ui_core_us/wtx_output/messcore.wtb

# copy ui_core/ui_core_us.dtt metadata (!360)
cp -rv ./dump/ui/ui_core_dtt/.metadata/ ./temp_rebuild/ui/ui_core/wtx_output/
cp -rv ./dump/ui/ui_core_us_dtt/.metadata/ ./temp_rebuild/ui/ui_core_us/wtx_output/

# rename ui_core/ui_core_us to core (!360)
mv -v ./temp_rebuild/ui/ui_core/wtx_output/ui_core.wtb ./temp_rebuild/ui/ui_core/wtx_output/core.wtb
mv -v ./temp_rebuild/ui/ui_core_us/wtx_output/ui_core_us.wtb ./temp_rebuild/ui/ui_core_us/wtx_output/core.wtb

# pack dtt files (!360)
ruby ./bin/bayonetta_tools/dat_creator.rb ./temp_rebuild/ui/ui_core/wtx_output/
ruby ./bin/bayonetta_tools/dat_creator.rb ./temp_rebuild/ui/ui_core_us/wtx_output/

# copy files to output directory (!360)
cp -v ./temp_rebuild/ui/ui_core/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc1/ui_core.dtt
cp -v ./temp_rebuild/ui/ui_core_us/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc1/ui_core_us.dtt
cp -v ./temp_rebuild/ui/ui_core/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc2/ui_core.dtt
cp -v ./temp_rebuild/ui/ui_core_us/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc2/ui_core_us.dtt
cp -v ./temp_rebuild/ui/ui_core/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc3/ui_core.dtt
cp -v ./temp_rebuild/ui/ui_core_us/wtx_output/dat_output/wtx_output.dtt ./output/ui/dlc3/ui_core_us.dtt
cp -v ./temp_rebuild/ui/ui_core/wtx_output/dat_output/wtx_output.dtt ./output/ui/ui_core.dtt
cp -v ./temp_rebuild/ui/ui_core_us/wtx_output/dat_output/wtx_output.dtt ./output/ui/ui_core_us.dtt