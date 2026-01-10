local TreeSeam, super = Class(Shop)

function TreeSeam:init()
    super.init(self)
    self.encounter_text = "* Heh...[wait:5] We meet again\n[wait:5]Heroes..."
    self.shop_text = "* [emote:idle]Take...[wait:5] your time...\nAin't like it's better spent."
    self.leaving_text = "* See you...[wait:5] again...\nor...[wait:10] ...not..."
    self.buy_menu_text = "Here's\nwhat I got."
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_refuse_text = "Well..."
    self.buy_text = "Finally some money..."
    self.buy_storage_text = "It will go to your storage."
    self.buy_too_expensive_text = "Not\nenough\nmoney."
    self.buy_no_space_text = "You're\ncarrying\ntoo much."
    self.sell_no_price_text = "Don't think I'd have much use for that."
    self.sell_menu_text = "No"
    self.sell_nothing_text = "No"
    self.sell_confirmation_text = "No?"
    self.sell_refuse_text = "Thank you"
    -- Shown when you sell something
    self.sell_text = "you're not supposted to be able to do that!"
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "Nothin' there."
    -- Shown when you enter the talk menu.
    self.talk_text = "Don't have...[wait:5] anything better to do."

    self.sell_options_text = {}
    self.sell_options_text["items"]   = "How"
    self.sell_options_text["weapons"] = "How"
    self.sell_options_text["armors"]  = "How"
    self.sell_options_text["storage"] = "How"

    self.background = "shops/treeseam_background"
    self.shop_music = "lostlantern"

    self.shopkeeper:setActor("shopkeepers/treeseam")
    self.shopkeeper.sprite:setPosition(0, 8)
    self.shopkeeper.slide = true

    self:registerItem("clubssandwich")
    self:registerItem("dark_candy")
    self:registerItem("brave_ax")
    self:registerItem("ragger")

    self:registerTalk("What happenned?!")
    self:registerTalk("Where is Jevil")
    self:registerTalk("Tree")

    self:registerTalkAfter("Casino?", 2, "talk_2", 1)
    self:registerTalkAfter("egg", 3, "talk_3", 3)
end

function TreeSeam:postInit()
    super.postInit(self)
    self.background_sprite:play(5/30, true)
    self.shopkeeper:setLayer(SHOP_LAYERS["above_boxes"])

end

function TreeSeam:startTalk(talk)
    if talk == "What happenned?!" then
        self:startDialogue({"[emote:idle]* I got scrached a little...", "[emote:angry]* I guess you could say...", "[emote:happy]* Roaring came early\nto me!"})
    elseif talk == "Where is Jevil" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:angry]* Asking for him I see?\n[wait:5]* Now I know where he is,\nbut look at what that [wait:5][color:blue]FRAUD[color:reset][wait:5] did,", "[emote:happy]* I'm not just gonna tell you[wait:5]\nwhere he's at,\nyou know, i don't tell anyone[wait:5]\nwhere YOU are, don't i?\n[wait:5]* Hee hee...", "[emote:angry]* Nah,[wait:5] just kidding.[wait:5]\nBut I do need something[wait:5]\nfor these wounds...",
        "* You'll get me something[wait:5] and\nI'll tell you where he is.", "[emote:talk]* Here's something you might need...", "* Once I've betted Jevil in a casino for[wait:5] 350 D$.[wait:5]\n* I...[wait:5] did lose him...", "[emote:happy]* But I've got him back with 400 D$!\n[wait:5]* That sure was [wait:5]'fun[wait:5] fun'...[wait:5] \nHee... Hee...", "[emote:talk]* Anyways![wait:5] He loves the casino...[wait:5]\n* Go there."})
    elseif talk == "Casino?" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:angry]* Yep![wait:5] Casino...\nIt's somewhere around my old place.", "* I'm sure you can find it."})
    elseif talk == "Tree" then
        self:setFlag("talk_3", 3)
        self:startDialogue({"[emote:idle]* Huh?[wait:5] Tree?", "* Oh![wait:5] the one behind me.", "* No,[wait:5] I haven't seen anything behind it."})
    elseif talk == "egg" then
        self:setFlag("talk_3", 3)
        self:startDialogue({"[emote:angry]* Kris.[wait:5] I don't know what are you talking about.", "* .[wait:5].[wait:5].", "* But the way you look at me,[wait:5] tells me that I shouldn't just ignore it.", "* If I see something...[wait:5] I WILL[wait:5] tell you."})

    end
end


return TreeSeam