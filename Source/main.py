import pd
import test.test
print(test.test.x)
import dvd
print(dvd.x, "hi")
advd = dvd.DVD(1, -1)  # DEMO
gfx = playdate.graphics
font = gfx.font.new('font/Mini Sans 2X')  # DEMO


def loadGame():
    playdate.display.setRefreshRate(50)  # Sets framerate to 50 fps
    math.randomseed(playdate.getSecondsSinceEpoch())  # seed for math.random
    gfx.setFont(font)  # DEMO


def updateGame():
    advd.update()  # DEMO


def drawGame():
    gfx.clear()  # Clears the screen
    advd.draw()  # DEMO


loadGame()


def update():
    updateGame()
    drawGame()
    playdate.drawFPS(0, 0)  # FPS widget


playdate.update = update
