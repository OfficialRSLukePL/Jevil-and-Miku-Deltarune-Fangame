local Movingarenalr, super = Class(Wave)

function Movingarenalr:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0
end

function Movingarenalr:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    -- Spawn spikes on top of arena
    self:spawnBulletTo(Game.battle.arena, "chips", 0, arena.height/2, math.rad(270))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    self:spawnBulletTo(Game.battle.arena, "chips", arena.width, arena.height/2, math.rad(90))

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y
end

function Movingarenalr:update()
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local xoffset = math.sin(self.siner * 1.5) * 60
    local yoffset = math.sin(self.siner * 1) * 30

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x  + xoffset, self.arena_start_y + yoffset)

    super.update(self)
end

return Movingarenalr