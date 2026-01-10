local Jevil, super = Class(EnemyBattler)

function Jevil:init()
    super.init(self)

    -- Enemy name
    self.name = "Jevil"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("jevil")

    -- Enemy health
    self.max_health = 100000
    self.health = 100000
    -- Enemy attack (determines bullet damage)
    self.attack = 9
    -- Enemy defense (usually 0)
    self.defense = -500
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
            self.selected_wave = "aimings"
            return self.selected_wave
        elseif turn == 3 then
            self.selected_wave = "movingarena"
            return self.selected_wave
        elseif turn == 4 then
            self.selected_wave = "movingarenaandmiddle"
            return self.selected_wave
        elseif turn == 5 then
            self.selected_wave = "DevilKnife"
            return self.selected_wave
        elseif turn == 6 then
            self.selected_wave = "slash"
            return self.selected_wave
        end
        -- Use random wave selection when the script runs out (assuming self.waves is set)
        return super.selectWave(self)
    end


    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "I am now fair to fight.",
        "Wait, why do i have -500 defense? ",
        "Uh... I have 100000 HP\n for some reason[wait:1s] lol"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 999 DF -500\n* Chaos Chaos\n* He needs Dr. Pepper."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* He looks...\n...diffrent?.",
        "* You feel like this is not the correct background.",
        "* Smells like Dr. Pepper.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Jevil is ready\nfor more!."

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