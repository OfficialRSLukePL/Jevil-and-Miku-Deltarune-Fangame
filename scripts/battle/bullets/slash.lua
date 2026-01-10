local Bullet, super = Class(Bullet)

function Bullet:init(x, y, rot)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/line")
	
	self.alpha = 0
	
	self.out = false
	
	self.hitplayer = false
	
	self.destroy_on_hit = false

    self:setHitbox(-300, 0, 600, 2)

end

function Bullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
	
	if self.alpha <= 1 and (not self.out) then
		self.alpha = self.alpha + 0.1 * DTMULT
		if self.alpha >= 1 then
			self.out = true
		end
	elseif self.alpha > 0 and self.out then
		self.alpha = self.alpha - 1 * DTMULT
		if self.alpha <= 0 then
			self:remove()
		end
	end
	
	-- Check if should collide lmao
	if self.alpha >= 0.65 then
		self.hitplayer = true
	else
		self.hitplayer = false
	end
	
	--self.physics.speed = self.physics.speed * 1.05

    super.update(self)
end

function Bullet:onCollide(soul)
    if soul.inv_timer <= 0 and self.hitplayer then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end

-- ok so there was a code here and a comment thanking Chapter 6 mod developer for creating it so i can steal it but it suddenly stopped working idk why but i decided to get it again and it now works idk why but ok thanks anyways c:
return Bullet