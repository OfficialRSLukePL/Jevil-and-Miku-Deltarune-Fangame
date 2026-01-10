local ExampleWave, super = Class(Wave)

function ExampleWave:init()
    super.init(self)

    -- The duration of our wave, in seconds. (Defaults to `5`)
    self.time = 5
end

function ExampleWave:onStart()
    -- code here gets called at the start of the wave
    local dummy = self:getAttackers()[1]

    -- create a bullet at the center of the dummy
    self.timer:every(1/2, function()
        local x, y = dummy:getRelativePos(dummy.width/2, dummy.height/2)
        local xs, ys = dummy:getRelativePos(Game.battle.soul.x, dummy.height/2)
        for i = 1, 6 do
            local bullet = self:spawnBullet("bullets/knife", x, y)
            bullet.physics.speed = 10
            local target_angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            bullet.rotation = target_angle
            bullet.physics.match_rotation = true
        end
    end)
end

function ExampleWave:update()
    -- code here gets called every frame

    super.update(self)
end

return ExampleWave