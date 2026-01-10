local actor, super = Class(Actor, "miku_dark_transition")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Miku"

    -- Width and height for this actor, used to determine its center
    self.width = 25
    self.height = 47

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/miku/dark_transition"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "run"
end

return actor