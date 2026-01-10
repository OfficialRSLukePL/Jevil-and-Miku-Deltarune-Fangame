local Tem, super = Class(Bullet)

function Tem:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/temmiesmoll")
    self:setHitbox(6, 6, 13, 13)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function Tem:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Tem