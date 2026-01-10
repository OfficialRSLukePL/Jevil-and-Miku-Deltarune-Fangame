local Tem, super = Class(Encounter)

function Tem:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Tem flakes appeared"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("temflake")

    --- Uncomment this line to add another!
    self:addEnemy("temflake")
end

return Tem