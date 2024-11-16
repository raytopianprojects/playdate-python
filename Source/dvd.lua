dvd = {}
local dvd = dvd
import "pd"
dvd.x = 1
local DVD = class(function(DVD)
    function DVD.__init__(self, xspeed, yspeed)
        local x = 2
        self.label = dict {["x"] = 155, ["y"] = 110, ["xspeed"] = xspeed, ["yspeed"] = yspeed, ["width"] = 100, ["height"] = 20}
    end
    function DVD.swapColors(self)
        if (gfx.getBackgroundColor() == gfx.kColorWhite) then
            gfx.setBackgroundColor(gfx.kColorBlack)
            gfx.setImageDrawMode("inverted")
        else
            gfx.setBackgroundColor(gfx.kColorWhite)
            gfx.setImageDrawMode("copy")
        end
    end
    function DVD.update(self)
        local swap = false
        if (((self.label["x"] + self.label["width"]) >= 400) or (self.label["x"] <= 0)) then
            self.label["xspeed"] = -self.label["xspeed"]
            swap = true
        end
        if (((self.label["y"] + self.label["height"]) >= 240) or (self.label["y"] <= 0)) then
            self.label["yspeed"] = -self.label["yspeed"]
            swap = true
        end
        if swap then
            self.swapColors()
        end
        self.label["x"] = (self.label["x"] + self.label["xspeed"])
        self.label["y"] = (self.label["y"] + self.label["yspeed"])
    end
    function DVD.draw(self)
        local label = self.label
        gfx.drawTextInRect("Template", label["x"], label["y"], label["width"], label["height"])
    end
    return DVD
end, {})
dvd.DVD = DVD