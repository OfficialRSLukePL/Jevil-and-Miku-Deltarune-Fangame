return {
    darkworld = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:text("* Yep![wait:5] You can just skip to the dark world!")
        Assets.playSound("awkward")
        cutscene:wait(1)

        -- get characters
        local kris = cutscene:getCharacter("kris")

            kris:setFacing("up")
            Assets.playSound("wing")
            
            kris:setFacing("right")
            cutscene:text("* Please don't do this if this\n is your first time playing.")
            cutscene:text("* Me and my friend put LOVE into this fangame c:")
            cutscene:text("* And you can miss some important context if you skip this!")

            local opinion = cutscene:choicer({"go to sleep", "oh ok"})
                if opinion == 1 then
                    cutscene:wait(cutscene:fadeOut(1))
                    cutscene:wait(1)
                    cutscene:loadMap("room4")
                    cutscene:mapTransition("room4")
                    cutscene:wait(1)
                    cutscene:wait(cutscene:fadeIn(0))
                else
                    cutscene:text("* Okay.")
                end       
    end
}