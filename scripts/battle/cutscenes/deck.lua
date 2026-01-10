return {
    Xslash = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Kris used Xslash!")

        -- Hurt the target enemy for 1 damage
        local kris = cutscene:getCharacter("kris")
        kris:setAnimation("battle/attack")
        Assets.playSound("damage")
        enemy:hurt(100, battler)
        cutscene:wait(0.5)
        kris:setAnimation("battle/attack")
        Assets.playSound("damage")
        enemy:hurt(100, battler)
        -- Wait 1 second
        cutscene:wait(1)
    end,

    Gamble = function(cutscene, battler, enemy)
    
    
    local kris = cutscene:getCharacter("kris")
    if Game.money > 49 then
        Game.money = Game.money - 50
        cutscene:text("* Kris Gambled!")
        local mercygamble = (math.random(-5, 15))

        enemy:addMercy(mercygamble)
        if mercygamble == 0 then
            kris:shake(2)
            Assets.playSound("awkward")
            kris:setAnimation("sit")
            cutscene:text("* Kris has...")
            cutscene:text("* ...done nothing...")
            cutscene:text("* Deck laughed at them")
        elseif mercygamble > 0 then
            kris:shake(1)
            kris:setAnimation("poser")
            cutscene:text("* Kris has won the gamble!")
        elseif mercygamble < 0 then
            kris:shake(1)
            Assets.playSound("hurt")
            kris:setAnimation("battle/hurteth")
            cutscene:text("* Kris has lost the gamble!")
        end
    else
        if Game:getFlag("noMoney", true) then
            cutscene:text("* Try using GambleTP act")
        else
            cutscene:text("* Kris doesn't have \nenough money!")
            Game:setFlag("noMoney", true)
            cutscene:text("* New ACT appeared!")
        end
       
    end
    end,

    gambleTP = function(cutscene, battler, enemy)
        local monble = (math.random(50, 250))
        
        if Game.money < 50 then
            Game.money = Game.money + monble
            Game:setFlag("noMoney", false)
            cutscene:text("* Kris got " + monble + " dollars!")
            cutscene:text("* Kris can gamble again!")
            
        else
            cutscene:text("* Deck stopped Kris \nfrom using this act again!")
            cutscene:text("* You got scammed out of TP!")
        end
    end

    
}
