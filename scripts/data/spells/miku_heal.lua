local spell, super = Class(Spell, "miku_heal")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Miku Heal"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Heal All"
    -- Menu description
    self.description = "Powerful spell able to restore \nall your friend's hp."

    -- TP cost
    self.cost = 50

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onCast(user, target)
    local base_heal = user.chara:getStat("magic") * (Game:getConfig("oldDualHealFormula") and 4 or 5.5)
    local heal_amount = Game.battle:applyHealBonuses(base_heal, user.chara)

    for _,battler in ipairs(target) do
        battler:heal(heal_amount)
    end
end

return spell