--Originally, I was using a bunch of different combat areas and Combat()'s to drive the visual effects,
--and it did work but didn't read the best or work the best from a gameplay perspective. What was on screen
--was the actual damage area, so sometimes it could be really hard to hit those pesky rabbits.

--I came across a guide on OTLand that showed how to have animated spells that were also static in damage area,
--and really liked how that worked, so I adopted what I learned from there into my spell. Now, the damage area
--is consistent and I also get some tasty visuals!



-- initialize combat
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)

-- Our static damage array, regardless of the visual effect this is the actual damage area
local dmgArr = {
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 2, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	}
	
-- Using this to drive our visual "animation" so it's more varied
local animationArea = {
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 1, 0, 0},
	{0, 1, 1, 0, 0, 0, 1, 1, 0},
	{1, 0, 0, 1, 2, 1, 0, 1, 1},
	{0, 0, 1, 0, 0, 0, 1, 1, 0},
	{0, 0, 1, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 0, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 0, 1, 1, 0},
	{1, 1, 0, 0, 2, 0, 0, 1, 1},
	{0, 1, 1, 0, 0, 0, 1, 1, 0},
	{0, 0, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 0, 1, 1, 0, 0},
	{0, 1, 0, 0, 1, 0, 0, 1, 0},
	{1, 0, 0, 0, 2, 1, 1, 1, 1},
	{0, 1, 1, 0, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 0, 0, 1, 0, 0},
	{0, 1, 1, 1, 0, 1, 0, 1, 0},
	{1, 1, 1, 1, 2, 1, 0, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 1, 1, 0, 0},
	{0, 1, 0, 0, 0, 0, 1, 1, 0},
	{1, 1, 0, 1, 2, 0, 0, 1, 1},
	{0, 1, 0, 1, 0, 0, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 0, 1, 1, 1, 0},
	{1, 1, 1, 1, 2, 1, 1, 1, 1},
	{0, 1, 1, 0, 0, 0, 1, 1, 0},
	{0, 0, 0, 1, 0, 0, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 1, 0},
	{1, 1, 1, 1, 2, 0, 0, 1, 1},
	{0, 1, 0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	},
	{
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 0, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 2, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0}
	}
}

-- Set our combat area to our actual damage area
local area = createCombatArea(dmgArr)
combat:setArea(area)

-- Function that drives damage
function onGetFrigoFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFrigoFormulaValues")

-- function that drives our visual effects
local function animation(pos, playerpos)
        if Position(pos):isSightClear(playerpos) then
            Position(pos):sendMagicEffect(CONST_ME_ICETORNADO)
        end
end

-- where all the magic happens
function onCastSpell(creature, variant)

    local creaturepos = creature:getPosition()
    local playerpos = Position(creaturepos)
    local delay = 500
 
    local centre = {}
    local damagearea = {}
    for j = 1, #animationArea do
        for k,v in ipairs(animationArea[j]) do
            for i = 1, #v do
                if v[i] == 3 or v[i] == 2 then --where the player is in our matrix
                    centre.Row = k
                    centre.Column = i
                    table.insert(damagearea, centre)
                elseif v[i] == 1 then --if it's a 1, that's where damage/visuals should be
                    local darea = {}
                    darea.Row = k
                    darea.Column = i
                    darea.Delay = j * delay
                    table.insert(damagearea, darea)
                end
            end
        end
    end
    for i = 1,#damagearea do
        local modifierx = damagearea[i].Column - centre.Column
        local modifiery = damagearea[i].Row - centre.Row
        local damagepos = Position(creaturepos)
        damagepos.x = damagepos.x + modifierx
        damagepos.y = damagepos.y + modifiery
        local animationDelay = damagearea[i].Delay or 0
		--send position data to animation function to get our juicy visuals going
        addEvent(animation, animationDelay, damagepos, playerpos)
    end
	--this is what actually performs damage
    return combat:execute(creature, variant)
end
