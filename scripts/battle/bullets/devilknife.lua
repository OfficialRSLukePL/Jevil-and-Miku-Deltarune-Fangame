local Devilknife, super = Class(Bullet)

function Devilknife:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/devilknife")
    self.graphics.spin = -0.4
    self:setHitbox(6, 6, 21, 21)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function Devilknife:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Devilknife