LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

Asset.Run("EventQueue.lua")

eventQueue = EventQueue:Create()

eventQueue:Add({mName = "Msg: Welcome to the arena"}, -1)
eventQueue:Add({mName = "Take Turn Goblin"}, 5)
eventQueue:Add({mName = "Take Turn Hero"}, 4)

eventQueue:Print()

function update()
end
