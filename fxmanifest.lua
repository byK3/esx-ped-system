--[[ 

    ==== Ped System - byK3#7147 ====

    Simple system to set a ped to a player with comamnd. 
    Peds are stored in a JSON & set on connect (if available).

    Command usage:

    /setPed [ID] [ped-model]

    Example: /setped 37 a_f_m_fatcult_01

    Reset Example: /setped 37 reset

    At reset a ped (default: mp_m_freemode_01) is set.

    You can edit the command and standard ped model in the config.


    You can find peds here:
    https://docs.fivem.net/docs/game-references/ped-models/


    Coder: byK3#7147

    Discord message me if you have any questions or need help.

    ==== Ped System - byK3#7147 ====

]]


fx_version 'cerulean'
game 'gta5'
author 'byK3#7147'
description 'Simple system to set Ped to player & save it'
version '1.0.0'

shared_script '@es_extended/imports.lua'


client_scripts {
    'config.lua',
    'client.lua',
}

server_scripts {
    'config.lua',
    'server.lua',
}

file 'save.json' -- Do not change this line