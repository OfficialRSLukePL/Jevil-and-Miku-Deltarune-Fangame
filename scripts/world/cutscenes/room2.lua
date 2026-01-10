return {
    jevil = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:text("* [wait:5].[wait:5].[wait:5].")

        -- get characters
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local kris = cutscene:getCharacter("kris")
        local miku = cutscene:getCharacter("miku")
        local jevil = cutscene:getCharacter("jevil")
        if susie then
            -- Detach camera and followers
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- susie
            cutscene:setSpeaker(susie)
            cutscene:text("*What the [wait:10] Fuck???", "shock")

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
            if cutscene:getCharacter("ralsei") then
            ralsei:setSprite("surprised_down")
            cutscene:setSpeaker(ralsei)
            end
            

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)
            if cutscene:getCharacter("ralsei") then
            cutscene:text("* Susie!", "concern")
            end

            if cutscene:getCharacter("miku") then
            cutscene:setSpeaker(miku)
            cutscene:text("* Jevil?![wait:5]\n What...[wait:5] are you...", "scared")
            end

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
            kris:setAnimation({"help", 0.25, true})
            cutscene:wait(1)
            kris:setAnimation({"helping", 0.25, true})
            cutscene:wait(1)
            
            -- susie gets up
            susie:resetSprite()
            kris:resetSprite()
            susie:setFacing("down")
            cutscene:wait(1)
            cutscene:walkTo(susie, x + 60, y, 0.75, "right")
            cutscene:wait(1)
            kris:setFacing("right")
            
            -- Ralsei does ralsei stuff
            if cutscene:getCharacter("ralsei") then
            ralsei:resetSprite()
            end
            cutscene:wait(0.5)
            susie:setAnimation({"exasperated_right", 0.25, true})

            -- talky talky

            cutscene:text("* What exactly do you think you're doing Jevil ", "angry_b")
            cutscene:setSpeaker(jevil)

            cutscene:text("*[style:GONER] the Knight's Will is my Own.", "mad")
            cutscene:text("*You Cannot Stop Me [wait:5] Now.", "normal")
            susie:setAnimation({"wall_right", 0.25, true})
            
            cutscene:setSpeaker(susie)
            cutscene:text("* Listen. If you-", "annoyed_down")
            cutscene:text("* Is that Dr. Pepper.", "sus_nervous")

            cutscene:setSpeaker(jevil)
            Assets.playSound("sodaopen")
            cutscene:text("[image:image/drpepermaybe, -10, 34, 0.6, 0.4, 0.1]")
            cutscene:text("*[color:red]  yes.", "smile")
            cutscene:wait(5)

            susie:resetSprite()
            cutscene:setSpeaker(susie)
            cutscene:text("* We don't want to fight.", "bangs_neutral")

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

                    cutscene:setSpeaker(jevil)
                    susie:setAnimation({"shock_right", 0.25, true})
                    susie:shake(4)
                    Assets.playSound("wing")
                    cutscene:text("* So the battle it is, is!", "mad")

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
                        susie:resetSprite()
                        cutscene:setSpeaker(susie)
                        cutscene:text("* .[wait:5].[wait:5].[wait:5]", "down")
                        cutscene:wait(0.5)
                        
                        cutscene:text("* Kris,[wait:5] \nwhatever you're planning...", "bangs_neutral")
                        susie:setAnimation({"point_right", 0.25, true})
                        cutscene:text("* It BETTER work out", "neutral")
                        cutscene:startEncounter("jevilhard")
                    else
                        cutscene:setSpeaker(susie)
                        cutscene:text("* (DAMN IT KRIS! You scared me!)")

                        -- copied of the code under because i don't know how to make code transfer into other yet lmao 
                        cutscene:text("* So please.[wait:5] \nLet us[wait:5] just...", "shy_down")
                        cutscene:text("* Talk this out,[wait:5] ok?", "sincere")
                        cutscene:wait(1) 
                        cutscene:setSpeaker(jevil)
                        cutscene:text("* .[wait:10].[wait:10].[wait:10]")
                        cutscene:text("* okay since one of the coders in this fangame totally forgot about me right now you can't pass until youll either defeat me or do some debug so yeah", "frown")
                        cutscene:text("* well..[wait:3].", "smile")
                        cutscene:text("* [wait:15][color:red]Doktor bebber.", "drive")
                        cutscene:walkTo(jevil, x + 1000, y, 3)
                        cutscene:setSpeaker(miku)
                        cutscene:text("* Wait!", "scared")
                        cutscene:walkTo(miku, x + 1000, y, 2)
                    end
                else
                    -- agree :)
                    cutscene:setSpeaker(susie)
                    cutscene:text("* So please.[wait:5] \nLet us[wait:5] just...", "shy_down")
                    cutscene:text("* Talk this out,[wait:5] ok?", "sincere")
                    cutscene:wait(1)
                    cutscene:setSpeaker(jevil)
                    cutscene:text("* .[wait:10].[wait:10].[wait:10]", "huh")
                    cutscene:text("* ok", "frown")
                    cutscene:text("* but come close to me im beating your ass", "normal")
                    cutscene:text("*[wait:5][color:red]Hard.", "mad")
                    cutscene:walkTo(jevil, x + 250, y - 80, 1)
                    
                end
            
            Game:removePartyMember("miku")
            
            
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
