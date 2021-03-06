Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(owner.X, owner.Y)
    local to = (Vector2:new(spell.X, spell.Y) - current):normalize()
    local range = to * 1150
    local trueCoords = current + range

    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
    dealPhysicalDamage(getEffectValue(0)+owner:getStats():getTotalAd()+(0.4*owner:getStats():getTotalAp()))
	local buff = Buff.new("DarkBinding", 4.0, BUFFTYPE_TEMPORARY, target, me)
    addBuff(buff, target)

    destroyProjectile()
end
