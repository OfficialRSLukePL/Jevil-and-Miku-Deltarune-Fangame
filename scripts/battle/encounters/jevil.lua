local Jevil, super = Class(Encounter)

function Jevil:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* For some reason... You regret not bringing Dr. Pepper."

    -- Battle music ("battle" is rude buster)
    self.music = "GmodRevolved"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("jevil")

    --- Uncomment this line to add another!
    -- self:addEnemy("jevil")
end

return Jevil