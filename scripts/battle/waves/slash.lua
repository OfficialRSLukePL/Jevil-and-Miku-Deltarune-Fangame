local Slash, super = Class(Wave)

function Slash:init()
    super.init(self)
    self.time = 10
end

function Slash:onStart()
    local jevil = self:getAttackers()[1]
    -- Every 0.20 seconds...
    self.timer:every(2/1, function()

            -- Get the attacker's center position
            local x, y = jevil:getRelativePos(jevil.width/2, jevil.height/2)

            -- Get the angle between the bullet position and the soul's position
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

            -- Our X position is offscreen, to the right
            local xd = SCREEN_WIDTH - 200
            -- Get a random Y position between the top and the bottom of the arena
            local yd = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

            -- Spawn smallbullet angled towards the player with speed 10 (see scripts/battle/bullets/smallbullet.lua)
            --attacker.setAnimation("battle/attack")
            self:spawnBullet("slash", xd, Game.battle.soul.y, angle, 7)
            
            
    end)
    self.timer:every(1/8, function()
            self:spawnBullet("diamond", math.random(250, 400), 0, 1.5, 7)
    end)

end

function Slash:update()
    -- Code here gets called every frame

    super.update(self)
end

return Slash