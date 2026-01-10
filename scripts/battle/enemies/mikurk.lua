local Miku, super = Class(EnemyBattler)

function Miku:init()
    super.init(self)

    -- Enemy name
    self.name = "Miku"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("evilmiku")

    -- Enemy health
    self.max_health = 4000
    self.health = 4000
    -- Enemy attack (determines bullet damage)
    self.attack = 1
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    function Miku:selectWave()
        local turn = Game.battle.turn_count
        if turn == 1 then
            self.selected_wave = "aiming"
            return self.selected_wave
        elseif turn == 2 then
            self.selected_wave = "aimings"
            return self.selected_wave
        elseif turn == 3 then
            self.selected_wave = "aiming"
            return self.selected_wave
        elseif turn == 4 then
            self.selected_wave = "movingarenaandmiddle"
            return self.selected_wave
        elseif turn == 5 then
            self.selected_wave = "DevilKnife"
            return self.selected_wave
        end
        -- Use random wave selection when the script runs out (assuming self.waves is set)
        return super.selectWave(self)
    end

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT ??? DF 9\n* Princess\n* of the dark."

    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Princess\nlook's distressed."

    -- Register act called "Smile"
    self:registerAct("Name")

end

function Miku:onAct(battler, name)
    if name == "Name" then
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "Uhhhh... yea Rou... uh... Kaard! Mr. Kaard."
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You asked Miku's for \nRoulxs Kaard's name.",
            "* Miku looks really stressed"
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

return Miku