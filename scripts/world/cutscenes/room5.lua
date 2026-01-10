return {
    run = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:enableMovement()

        -- get characters
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local kris = cutscene:getCharacter("kris")
        local miku = cutscene:getCharacter("miku")
        local jevil = cutscene:getCharacter("jevil")

            local x = event.x + event.width/2
            local y = event.y + event.height/2

            cutscene:walkTo(jevil, x + 200, y + 10, 0.3)
            cutscene:wait(0.3)
            cutscene:walkTo(jevil, x + 200, y + 120, 0.3)
            cutscene:wait(0.3)
            cutscene:walkTo(jevil, x + 540, y + 120, 0.5)
    end,

    jump = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:enableMovement()

        -- get characters
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local kris = cutscene:getCharacter("kris")
        local miku = cutscene:getCharacter("miku")
        local jevil = cutscene:getCharacter("jevil")

            local x = event.x + event.width/2
            local y = event.y + event.height/2

            cutscene:walkTo(jevil, x + 100, y + 10, 0.1)
            jevil:setSprite("hurt")
            cutscene:wait(0.1)
            cutscene:walkTo(jevil, x + 320, y + 10, 0.3)
            jevil:resetSprite()
            cutscene:wait(0.3)
            cutscene:walkTo(jevil, x + 320, y + 760, 1)
            cutscene:wait(5)
            cutscene:walkTo(jevil, x - 550, y + 760, 3)
            cutscene:wait(3.5)
            cutscene:walkTo(jevil, x - 550, y + 160, 2.3)
            cutscene:wait(2.3)
            cutscene:walkTo(jevil, x + 200, y + 160, 2)
            cutscene:wait(2)
            cutscene:walkTo(jevil, x + 200, y + 660, 1.5)
            cutscene:wait(1.5)
            cutscene:walkTo(jevil, x - 450, y + 660, 1.5)
            cutscene:wait(1.5)
            cutscene:walkTo(jevil, x - 450, y + 280, 1.5)
            cutscene:wait(1.5)
            cutscene:walkTo(jevil, x + 80, y + 280, 1.5)
            cutscene:wait(1.5)
            cutscene:walkTo(jevil, x + 80, y + 520, 1.5)
            cutscene:wait(1.5)
            cutscene:walkTo(jevil, x - 320, y + 520, 1)
            cutscene:wait(1)
            cutscene:walkTo(jevil, x - 320, y + 400, 1)
            cutscene:wait(1)
            cutscene:walkTo(jevil, x  - 40, y + 400, 1)
    end,

    corner = function(cutscene, event, WorldCutscene, options, choices)

        -- get characters
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local kris = cutscene:getCharacter("kris")
        local miku = cutscene:getCharacter("miku")
        local jevil = cutscene:getCharacter("jevil")

        local x = event.x + event.width/2
        local y = event.y + event.height/2

        cutscene:detachFollowers()

        cutscene:walkTo(kris, x, y, 0.75, "right")
        cutscene:walkTo(susie, x + 60, y, 0.75, "right")
        cutscene:walkTo(ralsei, x, y + 40, 0.75, "right")

        cutscene:detachCamera()

        

        if susie then
            cutscene:setSpeaker(susie)
            cutscene:text("* huff... puff...", "sus_nervous")
            cutscene:text("* What now?", "nervous")
            cutscene:text("* Nowhere to run, huh?", "smile")

            cutscene:setSpeaker(jevil)
            cutscene:text("* What now,[wait:5] now?", "normal")
            cutscene:text("* What now,[wait:5] now?", "mad")
            cutscene:text("* I fly!", "smile")

            cutscene:setSpeaker(miku)
            cutscene:text("* Oh no, you don't!", "angry")

            cutscene:setSpeaker()
            cutscene:text("* animation of jevil turning into devilknife and flying upwards while miku is holding onto him")

            cutscene:setSpeaker(jevil)
            cutscene:text("* Hey! Let go! Let go!")

            cutscene:walkTo(susie, x + 60, y, 0.75, "right")
            kris:setFacing("up")
            susie:setFacing("up")
            ralsei:setFacing("up")

            cutscene:setSpeaker(susie)
            cutscene:text("* Miku!", "angry_b")
            cutscene:text("* Kris! We need to save her!", "angry")
            
        end
    end,
}
