local Aiming, super = Class(Wave)

function Aiming:init()
    super.init(self)

    self.time = 10 
end

function Aiming:onStart()
    -- Every 0.20 seconds...
    self.timer:every(1/4, function()
        -- Get all enemies that selected this wave as their attack
        local attackers = self:getAttackers()

        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do

            -- Get the attacker's center position
            local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

            -- Get the angle between the bullet position and the soul's position
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

            -- Spawn smallbullet angled towards the player with speed 10 (see scripts/battle/bullets/smallbullet.lua)
            self:spawnBullet("smallbullet", x, y, angle, 7)
            self:spawnBullet("smallbullet", x, y, angle + 0.2, 15)
            self:spawnBullet("smallbullet", x, y, angle - 0.2, 15)
            
        end
    end)
    self.timer:every(2/1, function()
        self:spawnBullet("smallbullet", Game.battle.soul.x, 0, math.pi / 2, 9)
    end)
    
end

function Aiming:update()
    -- Code here gets called every frame

    super.update(self)
end

return Aiming