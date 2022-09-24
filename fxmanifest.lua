fx_version 'cerulean'
games {'gta5'}

shared_scripts { "config.lua" }

client_scripts {
    "client/*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua",
}

--- Xed#1188 | https://discord.gg/HvfAsbgVpM