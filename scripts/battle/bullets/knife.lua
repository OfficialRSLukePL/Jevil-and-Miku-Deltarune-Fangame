local Chip, super = Class(Bullet)

function Chip:init(x, y, dir, speed, rot)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/knife")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self:setHitbox(1, 1, 18, 2)
end

function Chip:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Chip