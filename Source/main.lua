main = {}
local main = main
import "pd"
import "test/test"
print(test_test.x)
import "dvd"
print(dvd.x, "hi")
local advd = dvd.DVD(1, -1)
local gfx = playdate.graphics
local font = gfx.font.new("font/Mini Sans 2X")
local function loadGame()
    playdate.display.setRefreshRate(50)
    math.randomseed(playdate.getSecondsSinceEpoch())
    gfx.setFont(font)
end
local function updateGame()
    advd.update()
end
local function drawGame()
    gfx.clear()
    advd.draw()
end
loadGame()
local function update()
    updateGame()
    drawGame()
    playdate.drawFPS(0, 0)
end
playdate.update = update