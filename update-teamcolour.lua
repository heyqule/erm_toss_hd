---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 8/7/2022 7:42 PM
---

local ERM_UnitHelper = require('__enemyracemanager__/lib/rig/unit_helper')
local TeamColorManager = require('__erm_libs__/prototypes/teamcolor_manager')
require('__erm_zerg__/global')

local entity_types = {'unit','unit-spawner', 'turret', 'explosion', 'corpse'}

local color = ERM_UnitHelper.format_team_color(
        settings.startup['erm_toss-team_color'].value,
        settings.startup['erm_toss-team_blend_mode'].value
)

local disable_mask = true
if settings.startup['erm_toss-team_color_enable'].value then
    disable_mask = false
end

local preserve_gloss = false
if settings.startup['erm_toss-team_color_preserve_gloss'].value then
    preserve_gloss = true
    local strength_multipler = 0.8
    color.r = color.r * strength_multipler
    color.g = color.g * strength_multipler
    color.b = color.b * strength_multipler
else
    -- Lower color strength to prevent neon colors.
    local strength_multipler = 0.5
    color.r = color.r * strength_multipler
    color.g = color.g * strength_multipler
    color.b = color.b * strength_multipler
end

TeamColorManager.change_team_color(MOD_NAME, color, disable_mask, preserve_gloss)