---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 7/24/2023 10:44 PM
---

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
local name = 'warpgate'

--- Change collision / selection box in case the scale not match
--- Changing collision box may affect unit pathing.. Be careful when you change it.
local collision_box = { { -4, -4 }, { 4, 4 } }
local map_generator_bounding_box = { { -5, -5 }, { 5, 5 } }
local selection_box = { { -4, -4 }, { 4, 4 } }

--- This function convert classic to HD graphic
--- i is the level of the unit.
local convert_to_hd = function(i)
    --- Buildings are either unit-spawner or turret for enemies.
    local unit = data.raw["unit-spawner"][MOD_NAME..'/'.. name ..'/'.. i]

    unit['animations'] = AnimationDB.get_layered_animations('buildings', name, 'run')

    unit['collision_box'] = collision_box
    unit['selection_box'] = selection_box
    unit['sticker_box'] = selection_box
    unit['map_generator_bounding_box'] = map_generator_bounding_box
end

--- Convert regular building, boss levels
local boss_level = ErmConfig.BOSS_LEVELS

for i = 1, #boss_level do
    convert_to_hd(boss_level[i])
end