local MovingArena, super = Class(Wave)

function MovingArena:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0

    self.time = 10

    leftorright = math.random(-1,1)
end

function MovingArena:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    -- Spawn spikes on top of arena
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, 0, math.rad(0))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, arena.height, math.rad(180))

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y

    local jevil = self:getAttackers()[1]

    local x, y = jevil:getRelativePos(jevil.width/2, jevil.height/2)

    self.timer:every(1/2, function()
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            self:spawnBullet("spindevilknife", x, y, angle, 10)
    end)
end

function MovingArena:update()
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local xoffset = math.sin(self.siner * 1.5) * 60 * leftorright
    local yoffset = math.sin(self.siner * 1) * 90

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x  + xoffset, self.arena_start_y + yoffset)

    super.update(self)
end

return MovingArena