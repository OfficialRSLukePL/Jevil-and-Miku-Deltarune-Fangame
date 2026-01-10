local DevilKnife, super = Class(Wave)

function DevilKnife:init()
    super.init(self)

    self.time = 10
    self.dialogue_override = "[wave:<50>,<50>,<3>] Hehehe"
    
end


function DevilKnife:onStart()

    
    local jevil = self:getAttackers()[1]
    local x, y = jevil:getRelativePos(jevil.width/2, jevil.height/2)
    local bullet = self:spawnBullet("bullets/devilknife", x, y)
    bullet.physics.speed = 4
    bullet.physics.match_rotation = true

    self.timer:every(math.random(1,3)/math.random(1,3), function()
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            self:spawnBullet("devilknife", x, y, angle, math.random(7,15))
    end)
    self.timer:every(2/1, function()
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            self:spawnBullet("spindevilknife", x, y, angle, 10)
            
            
    end)
    

end

function DevilKnife:update()

    
    
    super.update(self)
end

return DevilKnife
