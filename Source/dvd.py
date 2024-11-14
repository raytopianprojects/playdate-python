import pd
dvd.x = 1
class DVD:
    def __init__(self, xspeed, yspeed):
        global x
        x = 2
        self.label = {
            "x": 155,
            "y": 110,
            "xspeed": xspeed,
            "yspeed": yspeed,
            "width": 100,
            "height": 20
        }

    def swapColors(self):
        if gfx.getBackgroundColor() == gfx.kColorWhite:
            gfx.setBackgroundColor(gfx.kColorBlack)
            gfx.setImageDrawMode("inverted")
        else:
            gfx.setBackgroundColor(gfx.kColorWhite)
            gfx.setImageDrawMode("copy")

    def update(self):
        swap = False
        if self.label["x"] + self.label["width"] >= 400 or self.label["x"] <= 0:
            self.label["xspeed"] = -self.label["xspeed"]
            swap = True

        if self.label["y"] + self.label["height"] >= 240 or self.label["y"] <= 0:
            self.label["yspeed"] = -self.label["yspeed"]
            swap = True

        if swap:
            self.swapColors()

        self.label["x"] += self.label["xspeed"]
        self.label["y"] += self.label["yspeed"]

    def draw(self):
        label = self.label
        gfx.drawTextInRect("Template", label["x"], label["y"], label["width"], label["height"])

dvd.DVD = DVD