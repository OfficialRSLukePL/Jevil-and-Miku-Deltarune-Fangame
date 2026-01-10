local Aiming, super = Class(Wave)

function Aiming:onStart()
    -- Every 0.20 seconds...
    self.timer:every(1/4, function()
        -- Get all enemies that selected this wave as their attack
        local attackers = self:getAttackers()

        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do

            local angle = love.math.random() * 2 * math.pi

            -- Get the attacker's center position
            local x = 200 * math.sin( angle ) + 320
            local y = 200 * math.cos( angle ) + 170

            -- Get the angle between the bullet position and the soul's position
            local dir = Utils.angle(x, y, Game.battle.arena.x, Game.battle.soul.y)

            -- Spawn smallbullet angled towards the player with speed 10 (see scripts/battle/bullets/smallbullet.lua)

            local bullet = self:spawnBullet("star", x, y, dir, 8)

        end
    end)
end

function Aiming:update()
    -- Code here gets called every frame

    super.update(self)
end

return Aiming