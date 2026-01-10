local Jevil, super = Class(EnemyBattler)

function Jevil:init()
    super.init(self)

    -- Enemy name
    self.name = "Rals"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("rals")

    -- Enemy health
    self.max_health = 100
    self.health = 100
    -- Enemy attack (determines bullet damage)
    self.attack = 30
    -- Enemy defense (usually 0)
    self.defense = 1000
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    function Jevil:selectWave()
        local turn = Game.battle.turn_count
        if turn == 1 then
            self.selected_wave = "aiming"
            return self.selected_wave
        elseif turn == 2 then
            self.selected_wave = "aimingh"
            return self.selected_wave
        elseif turn == 3 then
            self.selected_wave = "aimings"
            return self.selected_wave
        elseif turn == 4 then
            self.selected_wave = "basic"
            return self.selected_wave
        elseif turn == 5 then
            self.selected_wave = "basich"
            return self.selected_wave
        elseif turn == 6 then
            self.selected_wave = "bigatt"
            return self.selected_wave
        elseif turn == 8 then
            self.selected_wave = "DevilKnife"
            return self.selected_wave
        elseif turn == 9 then
            self.selected_wave = "DevilKnifeh"
            return self.selected_wave
        elseif turn == 10 then
            self.selected_wave = "funny attack"
            return self.selected_wave
        elseif turn == 11 then
            self.selected_wave = "hardchip"
            return self.selected_wave
        elseif turn == 12 then
            self.selected_wave = "hardreversechip"
            return self.selected_wave
        elseif turn == 13 then
            self.selected_wave = "knife"
            return self.selected_wave
        elseif turn == 14 then
            self.selected_wave = "movingarena"
            return self.selected_wave
        elseif turn == 15 then
            self.selected_wave = "movingarenaandmiddle"
            return self.selected_wave
        elseif turn == 16 then
            self.selected_wave = "movingarenahard"
            return self.selected_wave
        elseif turn == 17 then
            self.selected_wave = "movingarenalr"
            return self.selected_wave
        elseif turn == 18 then
            self.selected_wave = "slash"
            return self.selected_wave
        elseif turn == 19 then
            self.selected_wave = "smallatt"
            return self.selected_wave
        elseif turn == 20 then
            self.selected_wave = "Tem"
            return self.selected_wave
        elseif turn == 21 then
            self.selected_wave = "Temsmoll"
            return self.selected_wave
        end
        -- Use random wave selection when the script runs out (assuming self.waves is set)
        return super.selectWave(self)
    end


    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT infinite DF infinite\n* Ralsei Dummy's\n* final form."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The ultimate test.",
        "* The ultimate Darkner ",
        "* The ultimate fluffy boy"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Fluf is strong."

    -- Register act called "Smile"
    self:registerAct("Ask")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Team heal", "", {"ralsei"})
end

function Jevil:onAct(battler, name)
    if name == "Ask" then
        -- Give the enemy 100% mercy
        self:addMercy(7)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "Can't a Jester like me\nwant a rematch?"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You asked Jevil[wait:5]\nwhy are you [color:yellow]FIGHTing[color:reset] again?",
            "* Jevil has thought about Dr. Pepper...\nHe's happy :)."
        }

    elseif name == "Team heal" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            self.cost = 32
            self.target = "ally"
            self.tags = {"heal"}
            
        end
        return

    elseif name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return {


                 "* Ralsei asked Jevil politely.\nTO STOP.",
                 "* Jevil ignored him"
            }
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            self.dialogue_override = "Ow"
            Game.battle:startActCutscene("jevil", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Jevil