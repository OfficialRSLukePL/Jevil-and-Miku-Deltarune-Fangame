return {
    rk = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:text("* [wait:5].[wait:5].[wait:5].")

        -- get characters
        local kris = cutscene:getCharacter("kris")
        -- rk is roulxs kaard
        local rk = cutscene:getCharacter("rk")
  
        -- Detach camera and followers

            kris:setFacing("right")

            cutscene:setSpeaker(rk)
            cutscene:text("* Thoust fooles![wait:5] You![wait:10] oh...", "faces6")
            cutscene:text("* Kris? What art thou doing hereth?", "normal")

            -- Get the bottom-center (if i ever add event object in the map this will need to be changed)
            local x = event.x + event.width/2
            local y = event.y + event.height/2

            cutscene:text("* Nevermind! Cometh closer,[wait:5] Worm.", "faces2")

            cutscene:walkTo(Game.world.player, x + 160, y - 80, 1.5, "right")
            cutscene:wait(3)
            cutscene:text("* Listen hereth, Worm.", "faces5")
            cutscene:wait(1)
            cutscene:text("* Oketh. So.", "faces5")
            cutscene:text("* Haveth thoust seen the [color:blue]blueth haired girl?", "faces4")
            cutscene:text("* I thoust I saw her entereth the Casino.", "faces5")
            cutscene:text("* But as thou can see...", "faces4")
            cutscene:text("* SHES[wait:5] NOT[wait:5] HERETH.", "faces2")
            cutscene:text("* Thoust must be wondering...", "faces5")
            cutscene:text("* Why Moi![wait:5] Roulxs Kaard[wait:5] musterth[wait:5] seek her...", "normal")
            cutscene:text("* Simpleth Worm!", "faces5")
            cutscene:text("* She's the Princess of the Darkthe!", "normal")
            cutscene:text("* So... There must be someone commandeth her!", "faces7")
            cutscene:text("* I can be 2nd in Commander...", "faces2")
            cutscene:text("* HAHAHAHAHAHAHAHAHAHAHAHAAAAHAA!!!!!", "faces6")
            cutscene:text("* ...", "faces7")
            cutscene:text("* Thoust fools! I willth be the 2nd in Commander!", "normal")
            
            local opinion = cutscene:choicer({"Where is\nshe", "Her name is\nMiku"})
                if opinion == 1 then
                    -- if this flag is set Roulxs Kaard won't know Miku's name during battle
                    Game:setFlag("MikuName", false)

                    cutscene:text("* AHA! I KNEWETH IT!", "faces2")
                    cutscene:text("* Pardon moi Kris...", "faces5")
                    cutscene:text("* BUT I SHALL BE THEE 2ND IN COMMANDER!", "faces2")
                    cutscene:text("* Not you!", "faces2")
                    -- this moves rk to outside of the map
                    cutscene:walkTo(rk, x + 800, y - 80, 3)
                    
                else
                    cutscene:text("* Miku?", "normal")
                    cutscene:text("* thoust...[wait:5] nameth...[wait:5] Miku?", "normal")
                    cutscene:text("* TIS' THE Princess of the Darkthe NAMETH?!", "faces2")
                    local opinion = cutscene:choicer({"She's not\na princess", "Yes"})
                    
                        if opinion == 1 then
                            cutscene:text("* What.", "faces2")
                            cutscene:text("* No...", "faces6")
                            cutscene:text("* THOUST ART LYING!", "faces6")
                            cutscene:text("* Later, Worm!", "faces6")
                            cutscene:walkTo(rk, x + 800, y - 80, 3)
                        else
                            cutscene:text("* THOU FOOL!", "faces6")
                            cutscene:text("* I WILLTH BE THE 2ND IN COMMANDER!", "faces6")
                            cutscene:text("* HAHAHAHAHAHAHAHAHA!", "faces2")
                            cutscene:text("* bye, Worm!", "normal")
                            cutscene:walkTo(rk, x + 800, y - 80, 3)
                        end
                end

            -- just to remember how his battle will be named, so the line below is useless for now
            -- cutscene:startEncounter("rouxls")         

            -- this will make the game know that this dialogue has already happen
            Game:setFlag("Ruless", true)
    end
}