local character, super = Class(PartyMember, "miku")

function character:init()
    super.init(self)

    -- Display name
    self.name = "Miku"

    -- Actor (handles sprites)
    self:setActor("miku")
    self:setLightActor("miku")
    self:setDarkTransitionActor("miku_dark_transition")

    -- Display level (saved to the save file)
    self.level = Game.chapter
    -- Default title / class (saved to the save file)

    self.title = "Vocaloid\nseems\nquiet."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "M-Action"

    -- Spells
    self:addSpell("miku_heal")
    -- self:addSpell("teleport")


    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 90
    elseif Game.chapter == 2 then
        self.health = 110
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 90,
            attack = 10,
            defense = 3,
            magic = 9
        }
    elseif Game.chapter == 2 then
        self.stats = {
            health = 110,
            attack = 12,
            defense = 4,
            magic = 12
        }
    end
    -- Max stats from level-ups
    if Game.chapter == 1 then
        self.max_stats = {
            health = 90
        }
    elseif Game.chapter == 2 then
        self.max_stats = {
            health = 110
        }
    end
    

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/axe"

    -- Equipment (saved to the save file)
    if Game.chapter <= 2 then
        self:setWeapon("mane_ax")
        if Game.chapter == 2 then
            self:setArmor(1, "amber_card")
            self:setArmor(2, "amber_card")
        end
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {0, 0.5, 0.5}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0, 0.5, 0.5}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0/255, 155/255, 155/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0, 0.5, 0.5}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0, 0.5, 0.5}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/miku/head"
    -- Path to head icons used in battle
    self.head_icons = "party/miku/icon"
    -- Name sprite (optional)
    self.name_sprite = "party/miku/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/mash"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 0.9

    -- Battle position offset (optional)
    self.battle_offset = {3, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = {
        "Hey![wait:5]\nAre you okay?!",
        "I can heal you![wait:5] \nHey![wait:5] Get up!"
    } -- Handled by getGameOverMessage for Miku

    -- Character flags (saved to the save file)




end


return character
