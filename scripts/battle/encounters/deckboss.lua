local Jevil, super = Class(Encounter)

function Jevil:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Casino owner \nchallenges you!"

    -- Battle music ("battle" is rude buster)
    self.music = "CasinoTrouble"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("deck")

    --- Uncomment this line to add another!
    -- self:addEnemy("jevil")
end

return Jevil