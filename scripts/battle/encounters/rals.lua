local Jevil, super = Class(Encounter)

function Jevil:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Test your Might! or... Waves..."

    -- Battle music ("battle" is rude buster)
    self.music = "strangedoor"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("rals")

    --- Uncomment this line to add another!
    -- self:addEnemy("jevil")
end

return Jevil