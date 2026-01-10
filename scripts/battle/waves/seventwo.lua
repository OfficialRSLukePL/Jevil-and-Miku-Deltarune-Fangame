local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 10
end

function Basic:onStart()
    -- Every 0.1 seconds...
    self.timer:every(1, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena.top

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("seventwo", x, y, math.rad(180), 5)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
    self.timer:every(1, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 100
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena.bottom

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("seventwodown", x, y, math.rad(180), 5)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)

end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic