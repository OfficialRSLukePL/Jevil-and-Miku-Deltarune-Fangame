local Retlutte, super = Class(EnemyBattler)

function Retlutte:init()
    super.init(self)

    -- Enemy name
    self.name = "Retlutte"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("retlutte")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 250

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 15

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "smallatt",
        "bigatt",
        "movingarenalr"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "This is NOT a place for kids.",
        "Get out of here kid.",
        "I'm going to lose my job..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 5 DF 3\n* Casino worker\n* seems unfriendly."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Casino lights shine on you.",
        "* Retlutte looks annoyed.",
        "* Retlutte asked you to leave.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* They don't pay Retlutte enough for this."

    -- Register act called "Smile"
    self:registerAct("Ask")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Team heal", "", {"ralsei"})
end

function Retlutte:onAct(battler, name)
    if name == "Ask" then
        -- Give the enemy 100% mercy
        for _, enemy in ipairs(Game.battle.enemies) do
        enemy:addMercy(50)
        end
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "not enough"
        
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You asked Retlutte[wait:5]\nhow much is he getting paid",
            "* Retluttle looked at you\nannoyed."
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

return Retlutte