fx_version 'cerulean'

game 'gta5'

author 'GJN Scripts'
description 'GJN Set ped'

shared_script {
  '@es_extended/imports.lua',
  'shared/sh_Config.lua'
}

server_scripts {
  'shared/sh_Config.lua',
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}

client_scripts {
  'shared/sh_Config.lua',
  'client/*.lua'
}