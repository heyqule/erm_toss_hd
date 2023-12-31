---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 7/24/2023 7:34 PM
---

local ERM_UnitTint = require('__enemyracemanager__/lib/rig/unit_tint')
require('__erm_toss__/global')
require('util')
local ErmConfig = require('__enemyracemanager__/lib/global_config')
local AnimationDB = require('__erm_toss_hd_assets__/animation_db')

--- Change name
local names = {'cannon','acid-cannon','cannon_shortrange'}

--- Change collision / selection box in case the scale not match
--- Changing collision box may affect unit pathing.. Be careful when you change it.
local collision_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }
local map_generator_bounding_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }
local selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }

local folded_animation = function()
    local animation = AnimationDB.get_layered_animations('buildings', 'cannon', 'folded')
    return animation
end

local attack_animation = function()
    local animation = AnimationDB.get_layered_animations('buildings', 'cannon', 'attack')
    return animation
end

--- This function convert classic to HD graphic
--- i is the level of the unit.
local convert_to_hd = function(i)
    for _, name in pairs(names) do
        --- Buildings are either unit-spawner or turret for enemies.
        local turret = data.raw["turret"][MOD_NAME..'/'.. name ..'/'.. i]

        turret['folded_animation'] = folded_animation()
        turret['starting_attack_animation'] = attack_animation()
        turret['starting_attack_speed'] = 0.02

        turret['collision_box'] = collision_box
        turret['selection_box'] = selection_box
        turret['sticker_box'] = selection_box
        turret['map_generator_bounding_box'] = map_generator_bounding_box
    end
end

--- Convert regular building, level 1 - 20
local max_level = ErmConfig.MAX_LEVELS

for i = 1, max_level do
    convert_to_hd(i)
end
