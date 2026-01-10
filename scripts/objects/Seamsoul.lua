local SeamSoul, super = Class(Soul)

function SeamSoul:init(x, y, color)
    super.init(self, x, y, color)

    self.sprite:setSprite("player/seamsoul")
end

return SeamSoul