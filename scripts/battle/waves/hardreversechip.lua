local Bigatt, super = Class(Wave)

function Bigatt:init()
    super.init(self)
    self.time = 10
end

function Bigatt:onStart()

    -- Every 0.1 seconds...
    self.timer:every(2/1, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + -860
        -- Get a random Y position between the top and the bottom of the arena
        local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("chip2", x, y, math.rad(-180), -15)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Bigatt:update()
    -- Code here gets called every frame

    super.update(self)
end

return Bigatt