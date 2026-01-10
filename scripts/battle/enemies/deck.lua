local Deck, super = Class(EnemyBattler)

function Deck:init()
    super.init(self)

    -- Enemy name
    self.name = "Deck"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("deck")

    -- Enemy health
    self.max_health = 1500
    self.health = 1500
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "bar",
        "barup",
        "boom",
        "hardboom",
        "seventwo",
        "seventwotwo"
    }


    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
                "Heh... So whatcha \nhere for [wait:5]kid?",
                "Play? [wait:5]\nMess around? [wait:5]\nGamble?",
                "Whatchever you need... [wait:5]\nWe've gotch it here! \n[wait:5]...as...[wait:5] long as it's \nrelated to Gambling.[wait:150]",
                "come on! \n[wait:5]Let's Gamble!",
                "Give me money...",
                "Wantcha that ugly plush? [wait:5]\nGAMBLE",
                "The onliest thingy I need... \n[wait:5]...is money..."
            }
    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 5 DF 0\n* The owner of\n* the casino."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The Casino lights are shining on you.",
        "* Susie yells in the background \n'Go Kris!'",
        "* Ralsei gives thumbs up.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The guards are getting angry..."

    -- Register act called "Smile"
    self:registerAct("gamble")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Xslash", "", nil, 50)
    --self:registerAct("gamble money")
    if Game:getFlag("noMoney", true) then
        self:registerAct("gambleTP", "", nil, 25)
    end
end

function Deck:onAct(battler, name)
    if name == "gamble" then
        -- Give the enemy 100% mercy
        Game.battle:startActCutscene("deck", "Gamble")
        -- Act text (since it's a list, multiple textboxes)
        --return {
        --    "* here will be gambling, \nbut i am not coding it rn",
        --    "* also you will gamble for spare points"
        --}

    elseif name == "Xslash" then
        
        Game.battle:startActCutscene("deck", "Xslash")

    --elseif name == "gamble money" then
        --self:addMercy(math.random(11, 20))
        -- makes this let you put an amount of money and based on that get spare points or lose them 
        --return {
        --"* placeholder"
        --}
    elseif name == "gambleTP" then
        Game.battle:startActCutscene("deck", "gambleTP")

    end

            


    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Deck