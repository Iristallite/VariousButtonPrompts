Part of [CBPFVG](https://github.com/NoriLynnfield/CBPFVG)'s in-depth documentation.
> unfinished but functional

# **NOT MEANT FOR THE AVERAGE USER**
## Metal Gear Rising: Revengeance (PC)
### In-depth documentation on how this game was added.
[`programs used`](#programs-used) | [`file info`](#file-info)  
[`workspace layout`](#workspace-layout) | [`commands used`](#commands-used)  
[`automatic scripts`](#automatic-scripts)


## File Info
> `ui/360/` folder still needs to be done, as well as `ui_core_!us`
> 
> A "Layers" model will be used for the specific textures being modified here. (This game has nested archives, so this is a good model)

* [Layer 0](#layer-0): `[GameData]` folder in *MGRR*'s installation directory.
* [Layer 1](#layer-1): `Data000.cpk`
* [Layer 2](#layer-2): These files in `Data000.cpk`:
  > `ui/360/dlc1/ui_core.dtt`
  > `ui/360/dlc1/ui_core_us.dtt`
  > `ui/360/dlc2/ui_core.dtt`
  > `ui/360/dlc2/ui_core_us.dtt`
  > `ui/360/dlc3/ui_core.dtt`
  > `ui/360/dlc3/ui_core_us.dtt`
  > `ui/360/ui_core.dtt`
  > `ui/360/ui_core_us.dtt`
  > `ui/dlc1/ui_core.dtt`
  > `ui/dlc1/ui_core_us.dtt`
  > `ui/dlc2/ui_core.dtt`
  > `ui/dlc2/ui_core_us.dtt`
  > `ui/dlc3/ui_core.dtt`
  > `ui/dlc3/ui_core_us.dtt`
  > `ui/ui_core.dtt`  
  > `ui/ui_core_us.dtt`

## Programs Used

* [Kerilk/bayonetta_tools](https://github.com/Kerilk/bayonetta_tools)
  
  * Handles PlatinumGames data files (DTT, WTB)
  * I only used this with Ubuntu on WSL
  
  * **Needs dependencies; use `ruby_setup.sh` or run these commands manually:**

    * `sudo apt install ruby ruby-dev git build-essential zlib1g-dev libassimp-dev imagemagick`
    * `gem install --user-install nokogiri libbin assimp-ffi zstd-ruby`  

  * **not present by default; clone it inside the `[bin]` folder.**
* [QuickBMS](http://aluigi.altervista.org/quickbms.htm) with `cpk.bms`
  * `cpk.bms` extracts/reimports `Data000.cpk`  
  * **not present by default; download it yourself**
* [paint.net](https://getpaint.net)
  * Used in this instance for actually editing the DDS textures
* My ADHD
  * Hyperfocused on this for over 8 hours

## Workspace Layout
* `[root]`
  * `extract.sh`
    > unpacks `.dtt` files, then unpacks the `.wtb` files inside them, then copies the textures within to `[output]` and renames them to something more user-readable
  * `Data000.cpk`
    > from the **PC** version of *MGRR*'s `[GameData]` folder
  * `rebuild.sh`
    > packs the modified textures in `working` into `.wtb` files, which are then packed into `.dtt` files placed in `[output]`; the `[ui]` folder within can simply be dropped into *MGRR*'s `[GameData]` folder to apply the custom textures
  * `[bin]`
    * `[bayonetta-tools]`
      > I know Raiden isn't Bayonetta, but these tools work with him too! **<sup>/s</sup>**  
      > **<sup>more seriously,</sup>** These tools work with several *PlatinumGames* titles, not just *Bayonetta*
    * `cpk.bms`
      > QuickBMS script for `.cpk` files
    * `quickbms`
      > **(Linux Executable)**
  * `[dump]`
    > raw dumped files from `Data000.cpk`
  * `[working]`
    > all the textures copied and renamed to a user-friendly format  
    > **renaming _any_ of these will break the `rebuild.sh` script!!**  
  * `[temp_rebuild]`
    > Holds rebuilt files until they're all done
  * `[output]`
    > a new `[ui]` folder!  
    > (ready to drop into *MGRR*'s `[GameData]` folder)

## Commands used
> [I made some scripts afterwards.](#auto-scripts)
> 
> **<sup>[2023-01-28]</sup>** I have genuinely forgotten which commands.
