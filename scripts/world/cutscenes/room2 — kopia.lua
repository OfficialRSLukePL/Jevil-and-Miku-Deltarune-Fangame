return {
    jevil = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:text("* [wait:5].[wait:5].[wait:5].")

        -- get characters
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local kris = cutscene:getCharacter("kris")
        if susie then
            -- Detach camera and followers
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- susie
            cutscene:setSpeaker(susie)
            cutscene:text("* Hey,[wait:5] Is that...?", "shock")

            -- Get the bottom-center (if i ever add event object in the map this will need to be changed)
            local x = event.x + event.width/2
            local y = event.y + event.height/2

            -- Move Susie up towards jevil
            cutscene:walkTo(susie, x + 60, y, 0.75, "right")
            -- Move other party members behind Susie
            cutscene:walkTo(Game.world.player, x + 40, y + 40, 0.75, "right")
            if cutscene:getCharacter("ralsei") then
                cutscene:walkTo("ralsei", x + 40, y + -40, 0.75, "right")
            end
            if cutscene:getCharacter("noelle") then
                cutscene:walkTo("noelle", x - 60, y + 100, 0.75, "right")
            end


            cutscene:wait(1.5)

            cutscene:wait(cutscene:walkTo(susie, x + 50, y, 0.5, "right", true))

            cutscene:wait(cutscene:walkTo(susie, x + 50, y, 0.2))
            cutscene:walkTo(Game.world.player, x, y + 80, 0.2, "up")

            susie:shake(4)
            susie:setSprite("shock_up")
            ralsei:setSprite("surprised_down")
            cutscene:setSpeaker(ralsei)
            

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)
            cutscene:text("* Susie!", "concern")

            cutscene:text("[image:image/temmie]")
            Assets.playSound("wing")

            -- how was the fall?
            susie:setAnimation({"kneel_left", 0.25, true})
            susie:shake(4)
            Assets.playSound("wing")

            cutscene:wait(1)
            cutscene:setSpeaker(susie)
            cutscene:text("* What the hell!", "teeth")
            
            -- Kris helps susie (maybe i can add sprite for it too but i am not sure about it yet)
            cutscene:walkTo(Game.world.player, x, y + 60, 0.1, "up")
            cutscene:wait(0.5)
            
            -- susie gets up
            susie:resetSprite()
            susie:setFacing("down")
            cutscene:wait(0.5)
            cutscene:walkTo(susie, x + 60, y, 0.75, "right")
            cutscene:wait(1)
            kris:setFacing("right")
            
            -- Ralsei does ralsei stuff
            ralsei:resetSprite()
            cutscene:wait(0.5)
            susie:setAnimation({"exasperated_right", 0.25, true})

            -- talky talky

            cutscene:text("* What [wait:5]is [wait:5]your\n[wait:5]problem?! ", "angry_b")
            cutscene:text("* Why are you doing this?! ", "angry_c")
            cutscene:setSpeaker()

            cutscene:text("* The Knight's hand, hand. their...")
            susie:setAnimation({"wall_right", 0.25, true})
            
            cutscene:setSpeaker(susie)
            cutscene:text("* That thing...[wait:5] won't help you.", "annoyed_down")
            cutscene:text("* Listen.", "annoyed_down")

            cutscene:setSpeaker()
            cutscene:text("* ...")
            cutscene:text("* What if i won't?")
            cutscene:wait(0.5)

            susie:resetSprite()
            cutscene:setSpeaker(susie)
            cutscene:text("* We don't want to fight.", "bangs")

            cutscene:setSpeaker()

            -- choices
            local opinion = cutscene:choicer({"Fight", "agree"})
            -- fight
                if opinion == 1 then
                    
                    cutscene:setSpeaker(susie)
                    cutscene:text("* ...")
                    susie:setAnimation({"shock_left", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    
                    cutscene:text("* what?.", "surprise")

                    cutscene:setSpeaker()
                    susie:setAnimation({"shock_right", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    cutscene:text("* So the battle it is, is!")

                    cutscene:setSpeaker(susie)
                    susie:setAnimation({"shock_left", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    cutscene:wait(1)
                    susie:setAnimation({"shock_right", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    cutscene:wait(1)
                    susie:setAnimation({"shock_left", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    cutscene:wait(1)
                    cutscene:text("* wait! No, we-", "surprise_frown")

                    local opinion = cutscene:choicer({"Proceed", "nevermind"})
                    -- proceed
                    if opinion == 1 then
                        cutscene:setSpeaker(susie)
                        cutscene:text("* .[wait:5].[wait:5].[wait:5]", "down")
                        cutscene:wait(0.5)
                        
                        cutscene:text("* Kris,[wait:5] \nwhatever you're planning...", "down")
                        susie:setAnimation({"point_right", 0.25, true})
                        cutscene:text("* It BETTER work out", "neutral")
                        cutscene:text("* and here transition to jevil battle", "neutral")
                    else
                        cutscene:setSpeaker(susie)
                        cutscene:text("* (DAMN IT KRIS! You scared me!)")

                        -- copied of the code under because i don't know how to make code transfer into other yet lmao 
                        cutscene:text("* So please.[wait:5] \nLet us[wait:5] just...", "shy_down")
                        cutscene:text("* Talk this out,[wait:5] ok?", "sincere")
                        cutscene:wait(1) 
                        cutscene:setSpeaker()
                        cutscene:text("* .[wait:10].[wait:10].[wait:10]")
                        cutscene:text("* Killing you is not worth my time anyway.")
                        cutscene:text("* You've proven you can beat me once,")
                        cutscene:text("* but I will try again...[wait:10] Later, LATER!")
                    end
                else
                    -- agree :)
                    cutscene:setSpeaker(susie)
                    cutscene:text("* So please.[wait:5] \nLet us[wait:5] just...", "shy_down")
                    cutscene:text("* Talk this out,[wait:5] ok?", "sincere")
                    cutscene:wait(1)
                    cutscene:setSpeaker()
                    cutscene:text("* .[wait:10].[wait:10].[wait:10]")
                    cutscene:text("* Killing you is not worth my time anyway.")
                    cutscene:text("* You've proven you can beat me once,")
                    cutscene:text("* but I will try again...[wait:10] Later, LATER!")
                    
                end
            
            
            
            -- Reset Susie's sprite
            susie:resetSprite()

            -- Reattach the camera
            cutscene:attachCamera()

            -- this can be deleted in the future

            -- Align the follower positions behind Kris's current position
            cutscene:alignFollowers()
            -- And reattach them, making them return to their target positions
            cutscene:attachFollowers()
            Game:setFlag("wall_hit", true)
        end
    end
}
