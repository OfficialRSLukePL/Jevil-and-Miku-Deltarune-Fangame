local Retlutte, super = Class(Encounter)

function Retlutte:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Casino."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("retlutte")

    --- Uncomment this line to add another!
    self:addEnemy("retlutte")
end

return Retlutte