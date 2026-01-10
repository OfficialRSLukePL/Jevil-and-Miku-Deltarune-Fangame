local Chip, super = Class(Bullet)

function Chip:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/star")

    self:setHitbox(1, 1, 5, 5)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function Chip:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Chip