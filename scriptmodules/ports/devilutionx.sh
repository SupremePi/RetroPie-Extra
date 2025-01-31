#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="devilutionx"
rp_module_desc="devilutionx - Diablo Engine"
rp_module_licence="https://raw.githubusercontent.com/diasurgical/devilutionX/master/LICENSE"
rp_module_help="Copy your original diabdat.mpq file from Diablo to $romdir/ports/devilutionx."
rp_module_section="exp"
rp_module_flags="!x86 !mali"

function depends_devilutionx() {
    echo 42
}

function sources_devilutionx() {
     wget https://github.com/diasurgical/devilutionX/releases/download/1.3.0/devilutionx-linux-armhf.zip
     unzip devilutionx-linux-armhf.zip
     }

function install_devilutionx() {
  cd devilutionx-linux-armhf
dpkg -i ./devilutionx_1.3.0_armhf.deb
    md_ret_files=(
          	devilutionx-linux-armhf/devilutionx
		devilutionx-linux-armhf/devilutionx.mpq
		devilutionx-linux-armhf/README.txt 
		devilutionx-linux-armhf/LICENSE.CC-BY.txt
		devilutionx-linux-armhf/LICENSE.OFL.txt)
}

function configure_devilutionx() {
    mkRomDir "ports"
    mkRomDir "ports/devilutionx"
    cp -r "$md_inst/devilutionx.mpq" "$romdir/ports/$md_id"
    addPort "$md_id" "devilutionx" "devilutionx - Diablo Engine" "$md_inst/devilutionx --data-dir $romdir/ports/devilutionx --save-dir $md_conf_root/devilutionx"
}
