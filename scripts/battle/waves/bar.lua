local Smallatt, super = Class(Wave)

function Smallatt:init()
    super.init(self)
    self.time = 10
end

function Smallatt:onStart()
    -- Every 0.1 seconds...
    self.timer:every(1/4, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena.bottom

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("bar", x, y, math.rad(180), 5)
        local bullet = self:spawnBullet("bar", x, y - 20, math.rad(180), 5)
        local bullet = self:spawnBullet("bar", x, y - 40, math.rad(180), 5)
        local bullet = self:spawnBullet("bar", x, y - 60, math.rad(180), 5)
        local bullet = self:spawnBullet("bar", x, y - 80, math.rad(180), 5)
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
    self.timer:every(1/2, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena.top

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("bar", x, y + math.random(0, 50), math.rad(180), 15)
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)

    
end

function Smallatt:update()
    -- Code here gets called every frame

    super.update(self)
end

return Smallatt