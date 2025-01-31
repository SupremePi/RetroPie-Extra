#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="rocksndiamonds"
rp_module_desc="Rocks'n'Diamonds - Emerald Mine Clone"
rp_module_licence=" GNU https://git.artsoft.org/?p=rocksndiamonds.git;a=blob;f=COPYING;hb=HEAD"
rp_module_section="exp"
rp_module_flags="!mali"

function depends_rocksndiamonds() {
    getDepends libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev
#    getDepends libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev
}

function sources_rocksndiamonds() {
   wget "$md_build" https://www.artsoft.org/RELEASES/unix/rocksndiamonds/rocksndiamonds-4.2.3.1.tar.gz
	tar -xvf rocksndiamonds-4.2.3.1.tar.gz -C /home/pi/RetroPie-Setup/tmp/build/rocksndiamonds

}

function build_rocksndiamonds() {
    cd rocksndiamonds-4.2.3.1
	make 
    md_ret_require="$md_build/rocksndiamonds-4.2.3.1"
}

function install_rocksndiamonds() {
    md_ret_files=(
        'rocksndiamonds-4.2.3.1/graphics'
        'rocksndiamonds-4.2.3.1/levels'
        'rocksndiamonds-4.2.3.1/music'
        'rocksndiamonds-4.2.3.1/sounds'
        'rocksndiamonds-4.2.3.1/COPYING'
        'rocksndiamonds-4.2.3.1/CREDITS'
        'rocksndiamonds-4.2.3.1/rocksndiamonds'
)
}

function configure_rocksndiamonds() {
    addPort "$md_id" "rocksndiamonds" "Rocks n' Diamonds" "$md_inst/rocksndiamonds"

    mkRomDir "ports/rocksndiamonds"

    moveConfigDir "$home/.rocksndiamonds" "$md_conf_root/rocksndiamonds"
}
