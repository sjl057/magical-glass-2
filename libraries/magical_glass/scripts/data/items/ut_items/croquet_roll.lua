local croquet_roll, super = Class(HealItem, "mg_item/croquet_roll")

function croquet_roll:init()
    super.init(self)

    -- Display name
    self.name = "Croquet Roll"
    self.short_name = "CroqtRoll"

    -- How this item is used on you (ate, drank, eat, etc.)
    self.use_method = "ate"
    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    self.heal_amount = 15

    -- Default shop sell price
    self.sell_price = 10
    -- Whether the item can be sold
    self.can_sell = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "Fried dough traditionally served with a mallet."

    -- Light world check text
    self.check = "Heals 15 HP\n* Fried dough traditionally\nserved with a mallet."

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false
end

function croquet_roll:getWorldUseText(target)
    if target.you then
        return "* You hit the Croquet Roll into \nyour mouth."
    else
        return "* " .. target:getNameOrYou() .. " hit the Croquet Roll into \ntheir mouth."
    end
end

function croquet_roll:getLightBattleText(user, target)
    if Game.battle.encounter.serious then
        return super.getLightBattleText(self, user, target)
    else
        if user.chara.id == Game.battle.party[1].chara.id and target.chara.id == Game.battle.party[1].chara.id then
            return "* You hit the Croquet Roll into \nyour mouth."
        elseif user.chara.id == target.chara.id then
            return "* " .. user.chara:getName() .. " hit the Croquet Roll into \ntheir mouth."
        else
            return "* " .. user.chara:getNameorYou() .. " hit the Croquet Roll into \n"..target.chara:getName().."'s mouth."
        end
    end
end

return croquet_roll