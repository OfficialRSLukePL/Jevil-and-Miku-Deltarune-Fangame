local Tem, super = Class(EnemyBattler)

function Tem:init()
    super.init(self)

    -- Enemy name
    self.name = "Temflake"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("temflake")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 1

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 30

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "Tem",
        "Temsmoll"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "HOI",
        "HOII",
        "HOIII",
        "HAI",
        "HAII",
        "HAIII",
        "HEI",
        "HEII",
        "HEIII"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 5 DF 0\n* Loves to be eaten by cute creatures. \n* But Susie is too scary"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* TEM TEM TEM TEM.",
        "* FLAKE FLAKE FLAKE FLAKE",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Hoi?"

    -- Register act called "Smile"
    self:registerAct("eat")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("2eat", "", {"ralsei"})
end

function Tem:onAct(battler, name)
    if name == "eat" then
        -- Give the enemy 100% mercy
        self:addMercy(30)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "NOuuuu... not cute...."
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You tried to eat Temmie.",
            "* Temmie avoids you."
        }

    elseif name == "2eat" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            self:addMercy(100)
            self.dialogue_override = "Cute!!!!!!!"
        end
        return {
           "* Ralsei ate a little bit of Temmie...",
           "* Temmie got HAPPY!"
        }

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return {
                "* Ralsei smiled,",
                "* Temmie was filled with the power of fluffy bois!"
            }
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            self:addMercy(-100)
            self.dialogue_override = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            -- R-Action text
            return {
                "* Susie tried eating Temmie,"
            }
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Tem