local Jevilhard, super = Class(EnemyBattler)

function Jevilhard:init()
    super.init(self)

    -- Enemy name
    self.name = "Jevil"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("jevilhard")

    -- Enemy health
    self.max_health = 3000
    self.health = 3000
    -- Enemy attack (determines bullet damage)
    self.attack = 13
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids picked each turn
    function Jevilhard:selectWave()
        local turn = Game.battle.turn_count
        if turn == 1 then
            self.selected_wave = "basich"
            return self.selected_wave
        elseif turn == 2 then
            self.selected_wave = "aimingh"
            return self.selected_wave
        elseif turn == 3 then
            self.selected_wave = "Tem" -- place holder attack
            return self.selected_wave
        elseif turn == 4 then
            self.selected_wave = "movingarenahard"
            return self.selected_wave
        elseif turn == 5 then
            self.selected_wave = "DevilKnifeh"
            return self.selected_wave
        end
        -- Use random wave selection when the script runs out (assuming self.waves is set)
        return super.selectWave(self)
    end

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Wow,[wait:5] someone really missed me,[wait:5] \ndidn't you,[wait:5] you?[wait:90]",
        "Haha![wait:5] haha![wait:5] \nfinally something exciting![wait:90] ",
        "So the game ends[wait:5] \nwhen your hp reaches 0?[wait:5]\nI can just taste the \nvictory,[wait:5] VICTORY![wait:90]",
        "The air crackles with freedom![wait:5] \nAnd yet.[wait:3].[wait:3].[wait:5] \nYou're trying to take mine,[wait:5] mine? \nisn't that interesting...[wait:5] \nKris?[wait:90]"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT low DF low\n* Stands in your way."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* In your way",
        "* You hear a distant \nroar of fury",
        "* Susie looks concerned, \nyou ignore her.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* In your way."

    -- Register act called "Smile"
    self:registerAct("Ask")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Team heal", "", {"ralsei"})
end

function Jevilhard:onAct(battler, name)
    if name == "Ask" then
        -- Give the enemy 100% mercy
        
        -- Change this enemy's dialogue for 1 turn
        
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You wanted to say something",
            "* but there was no point in talking"
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


                 "* You stopped Ralsei from talking before he said anything.",
            }
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            self.dialogue_override = "Hehehehe... HAHAHAHAHA"
            -- Game.battle:startActCutscene("jevilhard", "susie_punch") dokończyć
            return {
                "* Damn it Jevil! Just stop! You-",
                "* You stopped Susie from talki-",
                "* Kris![wait:10] What the hell is wroung with you?!"
            }
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." ..."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Jevilhard