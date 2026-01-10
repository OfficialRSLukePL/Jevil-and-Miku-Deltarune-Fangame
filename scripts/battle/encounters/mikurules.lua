local Jevil, super = Class(Encounter)

function Jevil:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Casino lights flash blinding light!"

    -- Battle music ("battle" is rude buster)
    self.music = "MikuRuless"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("rk")

    --- Uncomment this line to add another!
    self:addEnemy("mikurk")
end

return Jevil