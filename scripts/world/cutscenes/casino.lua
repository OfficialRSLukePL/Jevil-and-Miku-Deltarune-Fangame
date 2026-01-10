return {
    susie = function(cutscene, event, WorldCutscene, options, choices)

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
            cutscene:text("*bye!", "teeth")
            local x = event.x + event.width/2
            local y = event.y + event.height/2
            cutscene:walkTo(ralsei, x + 800, y - 80, 3)
            cutscene:walkTo(susie, x + 800, y - 80, 3)

            
            Game:removePartyMember("susie")
            Game:removePartyMember("ralsei")
            
            
            -- Reset Susie's sprite


            -- Reattach the camera
            cutscene:attachCamera()
            
        
        end
    end
}
