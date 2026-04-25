LoadLibrary('Asset')
Asset.Run('Dependencies.lua')

gRenderer = Renderer.Create()
gStack = StateStack:Create()
local intro = {
    Wait(5),
    Wait(2)
}
local storyboard = Storyboard:Create(gStack, intro)
gStack:Push(storyboard)


function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
end
