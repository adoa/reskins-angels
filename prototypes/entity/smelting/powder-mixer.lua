-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
if reskins.lib.setting("reskins-angels-do-angelssmelting") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "powder-mixer",
    base_entity = "assembling-machine-1",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["powder-mixer"] = {tier = 1, prog_tier = 2},
    ["powder-mixer-2"] = {tier = 2, prog_tier = 3},
    ["powder-mixer-3"] = {tier = 3, prog_tier = 4},
    ["powder-mixer-4"] = {tier = 4, prog_tier = 5},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/powder-mixer-base.png",
                priority = "high",
                width = 71,
                height = 87,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -10),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/hr-powder-mixer-base.png",
                    priority = "high",
                    width = 138,
                    height = 170,
                    line_length = 4,
                    frame_count = 4,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0.5, -9.5),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/powder-mixer-mask.png",
                priority = "high",
                width = 71,
                height = 87,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -10),
                tint = inputs.tint,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/hr-powder-mixer-mask.png",
                    priority = "high",
                    width = 138,
                    height = 170,
                    line_length = 4,
                    frame_count = 4,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0.5, -9.5),
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/powder-mixer-highlights.png",
                priority = "high",
                width = 71,
                height = 87,
                line_length = 4,
                frame_count = 4,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -10),
                blend_mode = reskins.lib.blend_mode,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/hr-powder-mixer-highlights.png",
                    priority = "high",
                    width = 138,
                    height = 170,
                    line_length = 4,
                    frame_count = 4,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0.5, -9.5),
                    blend_mode = reskins.lib.blend_mode,
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/powder-mixer-shadow.png",
                priority = "high",
                width = 78,
                height = 53,
                repeat_count = 4,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(5, 9),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/powder-mixer/hr-powder-mixer-shadow.png",
                    priority = "high",
                    width = 152,
                    height = 101,
                    repeat_count = 4,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(5, 8.5),
                    scale = 0.5,
                }
            },
        }
    }

    -- Label to skip to next iteration
    ::continue::
end