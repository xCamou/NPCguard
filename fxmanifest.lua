fx_version 'cerulean'
game 'gta5'

author 'Camou'
description 'A simple script that spawns an NPC via command that follows you and protects you.'
version '1.0.0'

server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client.lua'
}

dependencies {
    'es_extended'
}
