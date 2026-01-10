local Jevilhard, super = Class(Encounter)

function Jevilhard:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Joker is excited\nfor this battle"

    -- Battle music ("battle" is rude buster)
    self.music = "Vs_You"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("jevilhard")

    --- Uncomment this line to add another!
    -- self:addEnemy("jevil")

    self.no_end_message = true
    
end

return Jevilhard