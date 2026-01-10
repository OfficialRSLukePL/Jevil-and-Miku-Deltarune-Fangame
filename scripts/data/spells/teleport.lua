local spell, super = Class(Spell, "teleport")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Teleport"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Teleport a\nfoe away"
    -- Menu description
    self.description = "Teleport a enemy to not fight it (teleported foes don't count to recruting)."

    -- TP cost
    self.cost = 30

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"spare"}
end

-- spare a enemy but don't count it to recruting (I HAVE NO IDEA HOW WILL I DO IT)
function spell:onCast(user, target)
    if target.tired then
        target:spare(true)
    end
end

return spell
