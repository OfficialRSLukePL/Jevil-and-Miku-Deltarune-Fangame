local DevilKnifeH, super = Class(Wave)

function DevilKnifeH:init()
    super.init(self)

    self.time = 10
    self.dialogue_override = "[wave:<50>,<50>,<3>] Hehehe"
    
end


function DevilKnifeH:onStart()

    
    local jevil = self:getAttackers()[1]
    local arena = Game.battle.arena
    local x, y = jevil:getRelativePos(jevil.width/2, jevil.height/2)
    local bullet = self:spawnBullet("bullets/devilknife", x + 100, y)
    bullet.physics.speed = 4
    bullet.physics.match_rotation = true

    self.timer:every(2/3, function()
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            self:spawnBullet("devilknife", x, y, angle, 15)
    end)

    self.timer:every(2/1, function()
            self:spawnBullet("devilknife", Game.battle.soul.x, -50, math.pi / 2, 15)
    end)
    

end

function DevilKnifeH:update()

    
    
    super.update(self)
end

return DevilKnifeH
