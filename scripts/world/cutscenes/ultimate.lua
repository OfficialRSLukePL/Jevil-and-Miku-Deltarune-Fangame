return {
    test = function(cutscene, event, WorldCutscene, options, choices)
        -- first box of dialogue
        cutscene:text("* [wait:5].[wait:5].[wait:5].")

        -- get characters
        local kris = cutscene:getCharacter("kris")
        -- rk is roulxs kaard
        local rals = cutscene:getCharacter("rals")
  
        -- Detach camera and followers

            kris:setFacing("right")

            cutscene:setSpeaker(rals)
            cutscene:text("* Hello Kids.")
            cutscene:text("* I am Dummy's ultimate form")
            cutscene:text("* Want to test your abilities?")

            local opinion = cutscene:choicer({"Yes", "No"})
                if opinion == 1 then
                    cutscene:text("* Let the battle begin.")
                    cutscene:startEncounter("rals")
                else
                    cutscene:text("* Okay.")
                end       
    end
}