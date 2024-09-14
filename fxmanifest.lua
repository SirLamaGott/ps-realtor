fx_version 'cerulean'
games {'gta5'}
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Xirvin & Project Sloth'
description 'Housing Relator Job'
version '4.0.0'
ui_page 'html/index.html'

shared_script {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  "shared/**",
}

server_script {
  "server/**",
}

client_script {
  'client/**',
}

files {
  'html/**',
}