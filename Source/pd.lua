pd= {}

import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "luainit"
gfx = playdate.graphics

local menu = class(function(menu)
    function menu.__init__(self)
        self._class = playdate.getSystemMenu()
    end
    function menu.addMenuItem(self, title, callback)
        --[[ 
title will be the title displayed by the menu item.

When this menu item is selected, the OS will:

    Hide the System Menu.

    Invoke your callback function.

    Unpause your game and call playdate.gameWillResume.

If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.
	Playdate OS allows a maximum of three custom menu items to be added to the System Menu.

 ]]
        return playdate.menu.addMenuItem(self._class, title, callback)
    end
    function menu.addCheckmarkMenuItem(self, title, initialValue, callback)
        --[[ 
Creates a new menu item that can be checked or unchecked by the player.

title will be the title displayed by the menu item.

initialValue can be set to true or false, indicating the checked state of the menu item. Optional, defaults to false.

If this menu item is interacted with while the system menu is open, callback will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one argument, a boolean value, indicating the current value of the menu item.

If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.
	Playdate OS allows a maximum of three custom menu items to be added to the System Menu.

 ]]
        return playdate.menu.addCheckmarkMenuItem(self._class, title, initialValue, callback)
    end
    function menu.addOptionsMenuItem(self, title, options, initalValue, callback)
        --[[ 
Creates a menu item that allows the player to cycle through a set of options.

title will be the title displayed by the menu item.

options should be an array-style table of strings representing the states the menu item can have. Due to limited horizontal space, the option strings and title should be kept short for this type of menu item.

initialValue can optionally be set to any of the values in the options array.

If the value of this menu item is changed while the system menu is open, callback will be called when the menu is closed, before playdate.gameWillResume is called. The callback function will be passed one string argument indicating the currently selection option.

If the returned playdate.menu.item is nil, a second errorMessage return value will indicate the reason the operation failed.
	Playdate OS allows a maximum of three custom menu items to be added to the System Menu.

 ]]
        return playdate.menu.addOptionsMenuItem(self._class, title, options, initalValue, callback)
    end
    function menu.getMenuItems(self)
        --[[ 
Returns an array-style table containing all playdate.menu.items your game has added to the menu.
	Items that were added to the System Menu by the operating system will not be returned via getMenuItems(), or via any other method call.

 ]]
        return playdate.menu.getMenuItems(self._class)
    end
    function menu.removeMenuItem(self, menuItem)
        --[[ 
Removes the specified playdate.menu.item from the menu.

 ]]
        playdate.menu.removeMenuItem(self._class, menuItem)
    end
    function menu.removeAllMenuItems(self)
        --[[ 
Removes from the referenced menu object all playdate.menu.items added by your game.
	Items that were added to the System Menu by the operating system cannot be removed by this operation, or any other.

 ]]
        playdate.menu.removeAllMenuItems(self._class)
    end
    function menu.setCallback(self, callback)
        --[[ 
Sets the callback function for this menu item.

 ]]
        playdate.menu.item.setCallback(self._class, callback)
    end
    function menu.setTitle(self, newTitle)
        --[[ 
Sets the title displayed for this menu item.

The title for a menu item can also be set using dot syntax.

 ]]
        playdate.menu.item.setTitle(self._class, newTitle)
    end
    function menu.getTitle(self)
        --[[ 
Returns the title displayed for this menu item.

 ]]
        return playdate.menu.item.getTitle(self._class)
    end
    function menu.setValue(self, newValue)
        --[[ 
Sets the value for this menu item. The value is of a different type depending on the type of menu item:

    normal: integer

    checkmark: boolean

    options: string

Values for any menu type can also be set using integers.

The value for a menu item can also be set using dot syntax.

 ]]
        playdate.menu.item.setValue(self._class, newValue)
    end
    function menu.getValue(self)
        --[[ 
Returns the value for this menu item.
7.6. Localization

 ]]
        return playdate.menu.item.getValue(self._class)
    end
    function menu.close(self)
        --[[ 
Closes the file.

Equivalent to playdate->file->close() in the C API.

 ]]
        playdate.file.file.close(self._class)
    end
    function menu.write(self, string)
        --[[ 
Writes the given string to the file and returns the number of bytes written if successful, or 0 and a second return value describing the error. If you wish to include line termination characters (
, ), please include them in the string.

 ]]
        return playdate.file.file.write(self._class, string)
    end
    function menu.flush(self)
        --[[ 
Flushes any buffered data written to the file to the disk.

Equivalent to playdate->file->flush() in the C API.

 ]]
        playdate.file.file.flush(self._class)
    end
    function menu.readline(self)
        --[[ 
Returns the next line of the file, delimited by either 
 or 
. The returned string does not include newline characters.

 ]]
        return playdate.file.file.readline(self._class)
    end
    function menu.read(self, numberOfBytes)
        --[[ 
Returns a buffer containing up to numberOfBytes bytes from the file, and the number of bytes read. If the read failed, the function returns nil and a second value describing the error.

Equivalent to playdate->file->read() in the C API.

 ]]
        return playdate.file.file.read(self._class, numberOfBytes)
    end
    function menu.seek(self, offset, whence)
        --[[ 
Sets the file read/write position to the given byte offset. whence, if given is one of the following:

    playdate.file.kSeekSet: offset is an absolute offset from the start of the file

    playdate.file.kSeekFromCurrent: offset is relative to the current position

    playdate.file.kSeekFromEnd: offset is an offset from the end of the file (negative values are before the _end, positive are past the _end)

Equivalent to playdate->file->seek() in the C API.

 ]]
        playdate.file.file.seek(self._class, offset, whence)
    end
    function menu.tell(self)
        --[[ 
Returns the current byte offset of the read/write position in the file.

Equivalent to playdate->file->tell() in the C API.
Filesystem operations

 ]]
        return playdate.file.file.tell(self._class)
    end
    return menu
end, {})
local affineTransform = class(function(affineTransform)
    function affineTransform.__init__(self, m11, m12, m21, m22, tx, ty)
        --[[ 
Returns a new playdate.geometry.affineTransform. Use new() instead to get a new copy of the identity transform.

 ]]
        self._class = playdate.geometry.affineTransform.new(m11, m12, m21, m22, tx, ty)
    end
    return affineTransform
end, {})
local affineTransform = class(function(affineTransform)
    function affineTransform.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.geometry.affineTransform that is the identity transform.

 ]]
        self._class = playdate.geometry.affineTransform.new(unpack(args))
    end
    function affineTransform.copy(self)
        --[[ 
Returns a new copy of the affine transform.

 ]]
        return playdate.geometry.affineTransform.copy(self._class)
    end
    function affineTransform.invert(self)
        --[[ 
Mutates the caller so that it is an affine transformation matrix constructed by inverting itself.

Inversion is generally used to provide reverse transformation of points within transformed objects. Given the coordinates (x, y), which have been transformed by a given matrix to new coordinates (x’, y’), transforming the coordinates (x’, y’) by the inverse matrix produces the original coordinates (x, y).

 ]]
        playdate.geometry.affineTransform.invert(self._class)
    end
    function affineTransform.reset(self)
        --[[ 
Mutates the the caller, changing it to an identity transform matrix.

 ]]
        playdate.geometry.affineTransform.reset(self._class)
    end
    function affineTransform.concat(self, af)
        --[[ 
Mutates the the caller. The affine transform af is concatenated to the caller.

Concatenation combines two affine transformation matrices by multiplying them together. You might perform several concatenations in order to create a single affine transform that contains the cumulative effects of several transformations.

Note that matrix operations are not commutative — the order in which you concatenate matrices is important. That is, the result of multiplying matrix t1 by matrix t2 does not necessarily equal the result of multiplying matrix t2 by matrix t1.

 ]]
        playdate.geometry.affineTransform.concat(self._class, af)
    end
    function affineTransform.translate(self, dx, dy)
        --[[ 
Mutates the caller by applying a translate transformation. x values are moved by dx, y values by dy.

 ]]
        playdate.geometry.affineTransform.translate(self._class, dx, dy)
    end
    function affineTransform.translatedBy(self, dx, dy)
        --[[ 
Returns a copy of the calling affine transform with a translate transformation appended.

 ]]
        return playdate.geometry.affineTransform.translatedBy(self._class, dx, dy)
    end
    function affineTransform.scale(self, sx, sy)
        --[[ 
Mutates the caller by applying a scaling transformation.

If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

If only one parameter is passed, it is used to scale both x and y values.

 ]]
        playdate.geometry.affineTransform.scale(self._class, sx, sy)
    end
    function affineTransform.scaledBy(self, sx, sy)
        --[[ 
Returns a copy of the calling affine transform with a scaling transformation appended.

If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

If only one parameter is passed, it is used to scale both x and y values.

 ]]
        return playdate.geometry.affineTransform.scaledBy(self._class, sx, sy)
    end
    function affineTransform.rotate(self, angle, x, y)
        --[[ 
Mutates the caller by applying a rotation transformation.

angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments are given, the transform rotates around (x,y) instead of (0,0).

 ]]
        playdate.geometry.affineTransform.rotate(self._class, angle, x, y)
    end
    function affineTransform.rotate(self, angle, point)
        --[[ 
Mutates the caller by applying a rotation transformation.

angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional playdate.geometry.point point argument is given, the transform rotates around the point instead of (0,0).

 ]]
        playdate.geometry.affineTransform.rotate(self._class, angle, point)
    end
    function affineTransform.rotatedBy(self, angle, x, y)
        --[[ 
Returns a copy of the calling affine transform with a rotate transformation appended.

angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments are given, the transform rotates around (x,y) instead of (0,0).

 ]]
        return playdate.geometry.affineTransform.rotatedBy(self._class, angle, x, y)
    end
    function affineTransform.rotatedBy(self, angle, point)
        --[[ 
Returns a copy of the calling affine transform with a rotate transformation appended.

angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional point point argument is given, the transform rotates around the point instead of (0,0).

 ]]
        return playdate.geometry.affineTransform.rotatedBy(self._class, angle, point)
    end
    function affineTransform.skew(self, sx, sy)
        --[[ 
Mutates the caller, appending a skew transformation. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

 ]]
        playdate.geometry.affineTransform.skew(self._class, sx, sy)
    end
    function affineTransform.skewedBy(self, sx, sy)
        --[[ 
Returns the given transform with a skew transformation appended. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

 ]]
        return playdate.geometry.affineTransform.skewedBy(self._class, sx, sy)
    end
    function affineTransform.transformPoint(self, p)
        --[[ 
Modifies the point p by applying the affine transform.

 ]]
        playdate.geometry.affineTransform.transformPoint(self._class, p)
    end
    function affineTransform.transformedPoint(self, p)
        --[[ 
As above, but returns a new point rather than modifying p.

 ]]
        return playdate.geometry.affineTransform.transformedPoint(self._class, p)
    end
    function affineTransform.transformXY(self, x, y)
        --[[ 
Returns two values calculated by applying the affine transform to the point (x, y)

 ]]
        return playdate.geometry.affineTransform.transformXY(self._class, x, y)
    end
    function affineTransform.transformLineSegment(self, ls)
        --[[ 
Modifies the line segment ls by applying the affine transform.

 ]]
        playdate.geometry.affineTransform.transformLineSegment(self._class, ls)
    end
    function affineTransform.transformedLineSegment(self, ls)
        --[[ 
As above, but returns a new line segment rather than modifying ls.

 ]]
        return playdate.geometry.affineTransform.transformedLineSegment(self._class, ls)
    end
    function affineTransform.transformAABB(self, r)
        --[[ 
Modifies the axis aligned bounding box r (a rect) by applying the affine transform.

 ]]
        playdate.geometry.affineTransform.transformAABB(self._class, r)
    end
    function affineTransform.transformedAABB(self, r)
        --[[ 
As above, but returns a new rect rather than modifying r.

 ]]
        return playdate.geometry.affineTransform.transformedAABB(self._class, r)
    end
    function affineTransform.transformPolygon(self, p)
        --[[ 
Modifies the polygon p by applying the affine transform.

 ]]
        playdate.geometry.affineTransform.transformPolygon(self._class, p)
    end
    function affineTransform.transformedPolygon(self, p)
        --[[ 
As above, but returns a new polygon rather than modifying p.
t1 * t2

Returns the transform created by multiplying transform t1 by transform t2
t * v

Returns the vector2D created by applying the transform t to the vector2D v
t * p

Returns the point created by applying the transform t to the point p
Arc


 ]]
        return playdate.geometry.affineTransform.transformedPolygon(self._class, p)
    end
    return affineTransform
end, {})
local arc = class(function(arc)
    function arc.__init__(self, x, y, radius, startAngle, endAngle, direction)
        --[[ 
Returns a new playdate.geometry.arc. Angles should be specified in degrees. Zero degrees represents the top of the circle.
unitcircle

If specified, direction should be true for clockwise, false for counterclockwise. If not specified, the direction is inferred from the start and end angles.

 ]]
        self._class = playdate.geometry.arc.new(x, y, radius, startAngle, endAngle, direction)
    end
    function arc.copy(self)
        --[[ 
Returns a new copy of the arc.

 ]]
        return playdate.geometry.arc.copy(self._class)
    end
    function arc.length(self)
        --[[ 
Returns the length of the arc.

 ]]
        return playdate.geometry.arc.length(self._class)
    end
    function arc.isClockwise(self)
        --[[ 
Returns true if the direction of the arc is clockwise.

 ]]
        return playdate.geometry.arc.isClockwise(self._class)
    end
    function arc.setIsClockwise(self, flag)
        --[[ 
Sets the direction of the arc.

 ]]
        playdate.geometry.arc.setIsClockwise(self._class, flag)
    end
    function arc.pointOnArc(self, distance, extend)
        --[[ 
Returns a new point on the arc, distance pixels from the arc’s start angle. If extend is true, the returned point is allowed to project past the arc’s endpoints; otherwise, it is constrained to the arc’s initial point if distance is negative, or the end point if distance is greater than the arc’s length.
Line segment


 ]]
        return playdate.geometry.arc.pointOnArc(self._class, distance, extend)
    end
    return arc
end, {})
local lineSegment = class(function(lineSegment)
    function lineSegment.__init__(self, x1, y1, x2, y2)
        --[[ 
Returns a new playdate.geometry.lineSegment.

 ]]
        self._class = playdate.geometry.lineSegment.new(x1, y1, x2, y2)
    end
    function lineSegment.copy(self)
        --[[ 
Returns a new copy of the line segment.

 ]]
        return playdate.geometry.lineSegment.copy(self._class)
    end
    function lineSegment.unpack(self)
        --[[ 
Returns the values x1, y1, x2, y2.

 ]]
        return playdate.geometry.lineSegment.unpack(self._class)
    end
    function lineSegment.length(self)
        --[[ 
Returns the length of the line segment.

 ]]
        return playdate.geometry.lineSegment.length(self._class)
    end
    function lineSegment.offset(self, dx, dy)
        --[[ 
Modifies the line segment, offsetting its values by dx, dy.

 ]]
        playdate.geometry.lineSegment.offset(self._class, dx, dy)
    end
    function lineSegment.offsetBy(self, dx, dy)
        --[[ 
Returns a new line segment, the given segment offset by dx, dy.

 ]]
        return playdate.geometry.lineSegment.offsetBy(self._class, dx, dy)
    end
    function lineSegment.midPoint(self)
        --[[ 
Returns a playdate.geometry.point representing the mid point of the line segment.

 ]]
        return playdate.geometry.lineSegment.midPoint(self._class)
    end
    function lineSegment.pointOnLine(self, distance, extend)
        --[[ 
Returns a playdate.geometry.point on the line segment, distance pixels from the start of the line. If extend is true, the returned point is allowed to project past the segment’s endpoints; otherwise, it is constrained to the line segment’s initial point if distance is negative, or the end point if distance is greater than the segment’s length.

 ]]
        return playdate.geometry.lineSegment.pointOnLine(self._class, distance, extend)
    end
    function lineSegment.segmentVector(self)
        --[[ 
Returns a playdate.geometry.vector2D representation of the line segment.

 ]]
        return playdate.geometry.lineSegment.segmentVector(self._class)
    end
    function lineSegment.closestPointOnLineToPoint(self, p)
        --[[ 
Returns a playdate.geometry.point that is the closest point to point p that is on the line segment.

 ]]
        return playdate.geometry.lineSegment.closestPointOnLineToPoint(self._class, p)
    end
    function lineSegment.intersectsLineSegment(self, ls)
        --[[ 
Returns true if there is an intersection between the caller and the line segment ls.

If there is an intersection, a playdate.geometry.point representing that point is also returned.

 ]]
        return playdate.geometry.lineSegment.intersectsLineSegment(self._class, ls)
    end
    function lineSegment.intersectsPolygon(self, poly)
        --[[ 
Returns the values (intersects, intersectionPoints).

intersects is true if there is at least one intersection between the caller and poly.

intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and poly.

 ]]
        return playdate.geometry.lineSegment.intersectsPolygon(self._class, poly)
    end
    function lineSegment.intersectsRect(self, rect)
        --[[ 
Returns the values (intersects, intersectionPoints).

intersects is true if there is at least one intersection between the caller and rect.

intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and rect.
Point


 ]]
        return playdate.geometry.lineSegment.intersectsRect(self._class, rect)
    end
    return lineSegment
end, {})
local point = class(function(point)
    function point.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.geometry.point.

 ]]
        self._class = playdate.geometry.point.new(unpack(args))
    end
    function point.copy(self)
        --[[ 
Returns a new copy of the point.

 ]]
        return playdate.geometry.point.copy(self._class)
    end
    function point.unpack(self)
        --[[ 
Returns the values x, y.

 ]]
        return playdate.geometry.point.unpack(self._class)
    end
    function point.offset(self, dx, dy)
        --[[ 
Modifies the point, offsetting its values by dx, dy.

 ]]
        playdate.geometry.point.offset(self._class, dx, dy)
    end
    function point.offsetBy(self, dx, dy)
        --[[ 
Returns a new point object, the given point offset by dx, dy.

 ]]
        return playdate.geometry.point.offsetBy(self._class, dx, dy)
    end
    function point.squaredDistanceToPoint(self, p)
        --[[ 
Returns the square of the distance to point p.

 ]]
        return playdate.geometry.point.squaredDistanceToPoint(self._class, p)
    end
    function point.distanceToPoint(self, p)
        --[[ 
Returns the distance to point p.
p + v

Returns a new point by adding the vector v to point p.
p1 - p2

Returns the vector constructed by subtracting p2 from p1. By this construction, p2 + (p1 - p2) == p1.
p * t

Returns a new point by applying the transform t to point p.
p1 .. p2

Returns a new lineSegment connecting points p1 and p2.
Polygon


 ]]
        return playdate.geometry.point.distanceToPoint(self._class, p)
    end
    return point
end, {})
local polygon = class(function(polygon)
    function polygon.__init__(self, ...)
        local args = list {...}
        --[[ 
 ]]
        self._class = playdate.geometry.polygon.new(unpack(args))
    end
    return polygon
end, {})
local polygon = class(function(polygon)
    function polygon.__init__(self, ...)
        local args = list {...}
        --[[ 
 ]]
        self._class = playdate.geometry.polygon.new(unpack(args))
    end
    return polygon
end, {})
local polygon = class(function(polygon)
    function polygon.__init__(self, ...)
        local args = list {...}
        --[[ 
new(x1, y1, x2, y2, ..., xn, yn) returns a new playdate.geometry.polygon with vertices (x1, y1) through (xn, yn). The Lua function table.unpack() can be used to turn an array into function arguments.

new(p1, p2, ..., pn) does the same, except the points are expressed via point objects.

new(numberOfVertices) returns a new playdate.geometry.polygon with space allocated for numberOfVertices vertices. All vertices are initially (0, 0). Vertex coordinates can be set with playdate.geometry.polygon:setPointAt().
	If the polygon’s first and last points are coincident, the polygon will be considered closed. Alternatively, you may call :close() to automatically close the polygon.
	To draw a polygon, use playdate.graphics.drawPolygon().

 ]]
        self._class = playdate.geometry.polygon.new(unpack(args))
    end
    function polygon.copy(self)
        --[[ 
Returns a copy of a polygon.

 ]]
        return playdate.geometry.polygon.copy(self._class)
    end
    function polygon.close(self)
        --[[ 
:close() closes a polygon. If the polygon’s first and last point aren’t coincident, a line segment will be generated to connect them.

 ]]
        playdate.geometry.polygon.close(self._class)
    end
    function polygon.isClosed(self)
        --[[ 
Returns true if the polygon is closed, false if not.

 ]]
        return playdate.geometry.polygon.isClosed(self._class)
    end
    function polygon.containsPoint(self, p, fillRule)
        --[[ 
 ]]
        playdate.geometry.polygon.containsPoint(self._class, p, fillRule)
    end
    function polygon.containsPoint(self, x, y, fillRule)
        --[[ 
Returns a boolean value, true if the point p or the point at (x, y) is contained within the caller polygon.

fillrule is an optional argument that can be one of the values defined in playdate.graphics.setPolygonFillRule. By default playdate.graphics.kPolygonFillEvenOdd is used.

 ]]
        return playdate.geometry.polygon.containsPoint(self._class, x, y, fillRule)
    end
    function polygon.getBounds(self)
        --[[ 
Returns multiple values (x, y, width, height) giving the axis-aligned bounding box for the polygon.

 ]]
        return playdate.geometry.polygon.getBounds(self._class)
    end
    function polygon.getBoundsRect(self)
        --[[ 
Returns the axis-aligned bounding box for the given polygon as a playdate.geometry.rect object.

 ]]
        return playdate.geometry.polygon.getBoundsRect(self._class)
    end
    function polygon.count(self)
        --[[ 
Returns the number of points in the polygon.

 ]]
        return playdate.geometry.polygon.count(self._class)
    end
    function polygon.length(self)
        --[[ 
Returns the total length of all line segments in the polygon.

 ]]
        return playdate.geometry.polygon.length(self._class)
    end
    function polygon.setPointAt(self, n, x, y)
        --[[ 
Sets the polygon’s n-th point to (x, y).

 ]]
        playdate.geometry.polygon.setPointAt(self._class, n, x, y)
    end
    function polygon.getPointAt(self, n)
        --[[ 
Returns the polygon’s n-th point.

 ]]
        return playdate.geometry.polygon.getPointAt(self._class, n)
    end
    function polygon.intersects(self, p)
        --[[ 
Returns true if the given polygon intersects the polygon p.

 ]]
        return playdate.geometry.polygon.intersects(self._class, p)
    end
    function polygon.pointOnPolygon(self, distance, extend)
        --[[ 
Returns a playdate.geometry.point on one of the polygon’s line segments, distance pixels from the start of the polygon. If extend is true, the point is allowed to project past the polygon’s ends; otherwise, it is constrained to the polygon’s initial point if distance is negative, or the last point if distance is greater than the polygon’s length.

 ]]
        return playdate.geometry.polygon.pointOnPolygon(self._class, distance, extend)
    end
    function polygon.translate(self, dx, dy)
        --[[ 
Translates each point on the polygon by dx, dy pixels.
p * t

Returns a new polygon formed by applying the transform t to polygon p.
Rect


 ]]
        return playdate.geometry.polygon.translate(self._class, dx, dy)
    end
    return polygon
end, {})
local rect = class(function(rect)
    function rect.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.geometry.rect.

 ]]
        self._class = playdate.geometry.rect.new(unpack(args))
    end
    function rect.copy(self)
        --[[ 
Returns a new copy of the rect.

 ]]
        return playdate.geometry.rect.copy(self._class)
    end
    function rect.toPolygon(self)
        --[[ 
Returns a new playdate.geometry.polygon version of the rect.

 ]]
        return playdate.geometry.rect.toPolygon(self._class)
    end
    function rect.unpack(self)
        --[[ 
Returns x, y, width and height as individual values.

 ]]
        return playdate.geometry.rect.unpack(self._class)
    end
    function rect.isEmpty(self)
        --[[ 
Returns true if a rectangle has zero width or height.

 ]]
        return playdate.geometry.rect.isEmpty(self._class)
    end
    function rect.isEqual(self, r2)
        --[[ 
Returns true if the x, y, width, and height values of the caller and r2 are all equal.

 ]]
        return playdate.geometry.rect.isEqual(self._class, r2)
    end
    function rect.intersects(self, r2)
        --[[ 
Returns true if r2 intersects the caller.

 ]]
        return playdate.geometry.rect.intersects(self._class, r2)
    end
    function rect.intersection(self, r2)
        --[[ 
Returns a rect representing the overlapping portion of the caller and r2.

 ]]
        return playdate.geometry.rect.intersection(self._class, r2)
    end
    function rect.union(self, r2)
        --[[ 
Returns the smallest possible rect that contains both the source rect and r2.

 ]]
        return playdate.geometry.rect.union(self._class, r2)
    end
    function rect.inset(self, dx, dy)
        --[[ 
Insets the rect by the given dx and dy.

 ]]
        playdate.geometry.rect.inset(self._class, dx, dy)
    end
    function rect.insetBy(self, dx, dy)
        --[[ 
Returns a rect that is inset by the given dx and dy, with the same center point.

 ]]
        return playdate.geometry.rect.insetBy(self._class, dx, dy)
    end
    function rect.offset(self, dx, dy)
        --[[ 
Offsets the rect by the given dx and dy.

 ]]
        playdate.geometry.rect.offset(self._class, dx, dy)
    end
    function rect.offsetBy(self, dx, dy)
        --[[ 
Returns a rect with its origin point offset by dx, dy.

 ]]
        return playdate.geometry.rect.offsetBy(self._class, dx, dy)
    end
    function rect.containsRect(self, r2)
        --[[ 
Returns true if the rect r2 is contained within the caller rect.

 ]]
        return playdate.geometry.rect.containsRect(self._class, r2)
    end
    function rect.containsRect(self, x, y, width, height)
        --[[ 
Returns true if the rect defined by (x, y, width, height) is contained within the caller rect.

 ]]
        return playdate.geometry.rect.containsRect(self._class, x, y, width, height)
    end
    function rect.containsPoint(self, p)
        --[[ 
Returns true if the point p is contained within the caller rect.

 ]]
        return playdate.geometry.rect.containsPoint(self._class, p)
    end
    function rect.containsPoint(self, x, y)
        --[[ 
Returns true if the point at (x, y) is contained within the caller rect.

 ]]
        return playdate.geometry.rect.containsPoint(self._class, x, y)
    end
    function rect.centerPoint(self)
        --[[ 
Returns a point at the center of the caller.

 ]]
        return playdate.geometry.rect.centerPoint(self._class)
    end
    function rect.flipRelativeToRect(self, r2, flip)
        --[[ 
Flips the caller about the center of rect r2.

flip should be one of the following constants:

    playdate.geometry.kUnflipped

    playdate.geometry.kFlippedX

    playdate.geometry.kFlippedY

    playdate.geometry.kFlippedXY

Size

You can directly read or write the width and height values of a size.

 ]]
        playdate.geometry.rect.flipRelativeToRect(self._class, r2, flip)
    end
    return rect
end, {})
local size = class(function(size)
    function size.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.geometry.size.

 ]]
        self._class = playdate.geometry.size.new(unpack(args))
    end
    function size.copy(self)
        --[[ 
Returns a new copy of the size.

 ]]
        return playdate.geometry.size.copy(self._class)
    end
    function size.unpack(self)
        --[[ 
Returns the values width, height.
Utility functions

 ]]
        return playdate.geometry.size.unpack(self._class)
    end
    return size
end, {})
local vector2D = class(function(vector2D)
    function vector2D.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.geometry.vector2D.

 ]]
        self._class = playdate.geometry.vector2D.new(unpack(args))
    end
    function vector2D.copy(self)
        --[[ 
Returns a new copy of the vector2D.

 ]]
        return playdate.geometry.vector2D.copy(self._class)
    end
    function vector2D.unpack(self)
        --[[ 
Returns the values dx, dy.

 ]]
        return playdate.geometry.vector2D.unpack(self._class)
    end
    function vector2D.addVector(self, v)
        --[[ 
Modifies the caller by adding vector v.

 ]]
        playdate.geometry.vector2D.addVector(self._class, v)
    end
    function vector2D.scale(self, s)
        --[[ 
Modifies the caller, scaling it by amount s.

 ]]
        playdate.geometry.vector2D.scale(self._class, s)
    end
    function vector2D.scaledBy(self, s)
        --[[ 
Returns the given vector scaled by s.

 ]]
        return playdate.geometry.vector2D.scaledBy(self._class, s)
    end
    function vector2D.normalize(self)
        --[[ 
Modifies the caller by normalizing it so that its length is 1. If the vector is (0,0), the vector is unchanged.

 ]]
        playdate.geometry.vector2D.normalize(self._class)
    end
    function vector2D.normalized(self)
        --[[ 
Returns a new vector by normalizing the given vector.

 ]]
        return playdate.geometry.vector2D.normalized(self._class)
    end
    function vector2D.dotProduct(self, v)
        --[[ 
Returns the dot product of the caller and the vector v.

 ]]
        return playdate.geometry.vector2D.dotProduct(self._class, v)
    end
    function vector2D.magnitude(self)
        --[[ 
Returns the magnitude of the caller.

 ]]
        return playdate.geometry.vector2D.magnitude(self._class)
    end
    function vector2D.magnitudeSquared(self)
        --[[ 
Returns the square of the magnitude of the caller.

 ]]
        return playdate.geometry.vector2D.magnitudeSquared(self._class)
    end
    function vector2D.projectAlong(self, v)
        --[[ 
Modifies the caller by projecting it along the vector v.

 ]]
        playdate.geometry.vector2D.projectAlong(self._class, v)
    end
    function vector2D.projectedAlong(self, v)
        --[[ 
Returns a new vector created by projecting the given vector along the vector v.

 ]]
        return playdate.geometry.vector2D.projectedAlong(self._class, v)
    end
    function vector2D.angleBetween(self, v)
        --[[ 
Returns the angle between the caller and the vector v.

 ]]
        return playdate.geometry.vector2D.angleBetween(self._class, v)
    end
    function vector2D.leftNormal(self)
        --[[ 
Returns a vector that is the left normal of the caller.

 ]]
        return playdate.geometry.vector2D.leftNormal(self._class)
    end
    function vector2D.rightNormal(self)
        --[[ 
Returns a vector that is the right normal of the caller.
-v

Returns the vector formed by negating the components of vector v.
v1 + v2

Returns the vector formed by adding vector v2 to vector v1.
v1 - v2

Returns the vector formed by subtracting vector v2 from vector v1.
v1 * s

Returns the vector v1 scaled by s.
v1 * v2

Returns the dot product of the two vectors.
v1 * t

Returns the vector transformed by transform t.
v / s

Returns the vector divided by scalar s.
7.20. Graphics

The playdate.graphics module contains functions related to displaying information on the device screen.
Conventions

    The Playdate coordinate system has its origin point (0, 0) at the upper left. The x-axis increases to the right, and the y-axis increases downward.

    (0, 0) represents the upper-left corner of the first pixel onscreen. The center of that pixel is (0.5, 0.5).

    In the Playdate SDK, angle values should always be provided in degrees, and angle values returned will be in degrees. Not radians. (This is in contrast to Lua’s built-in math libraries, which use radians.)

Contexts

 ]]
        return playdate.geometry.vector2D.rightNormal(self._class)
    end
    return vector2D
end, {})
local image = class(function(image)
    function image.__init__(self, width, height, bgcolor)
        --[[ 
Creates a new blank image of the given width and height. The image can be drawn on using playdate.graphics.pushContext() or playdate.graphics.lockFocus(). The optional bgcolor argument is one of the color constants as used in playdate.graphics.setColor(), defaulting to kColorClear.

 ]]
        self._class = playdate.graphics.image.new(width, height, bgcolor)
    end
    return image
end, {})
local image = class(function(image)
    function image.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a playdate.graphics.image object from the data at path. If there is no file at path, the function returns nil and a second value describing the error.

 ]]
        self._class = playdate.graphics.image.new(unpack(args))
    end
    function image.load(self, path)
        --[[ 
Loads a new image from the data at path into an already-existing image, without allocating additional memory. The image at path must be of the same dimensions as the original.

Returns (success, [error]). If the boolean success is false, error is also returned.

 ]]
        return playdate.graphics.image.load(self._class, path)
    end
    function image.copy(self)
        --[[ 
Returns a new playdate.graphics.image that is an exact copy of the original.

 ]]
        return playdate.graphics.image.copy(self._class)
    end
    function image.getSize(self)
        --[[ 
Returns the pair (width, height)

 ]]
        return playdate.graphics.image.getSize(self._class)
    end
    function image.draw(self, x, y, flip, sourceRect)
        --[[ 
 ]]
        playdate.graphics.image.draw(self._class, x, y, flip, sourceRect)
    end
    function image.draw(self, p, flip, sourceRect)
        --[[ 
Draws the image with its upper-left corner at location (x, y) or playdate.geometry.point p.

The optional flip argument can be one of the following:

    playdate.graphics.kImageUnflipped: the image is drawn normally

    playdate.graphics.kImageFlippedX: the image is flipped left to right

    playdate.graphics.kImageFlippedY: the image is flipped top to bottom

    playdate.graphics.kImageFlippedXY: the image if flipped both ways; i.e., rotated 180 degrees

Alternately, one of the strings "flipX", "flipY", or "flipXY" can be used for the flip argument.

sourceRect, if specified, will cause only the part of the image within sourceRect to be drawn. sourceRect should be relative to the image’s bounds and can be a playdate.geometry.rect or four integers, (x, y, w, h), representing the rect.

 ]]
        playdate.graphics.image.draw(self._class, p, flip, sourceRect)
    end
    function image.drawAnchored(self, x, y, ax, ay, flip)
        --[[ 
Draws the image at location (x, y) centered at the point within the image represented by (ax, ay) in unit coordinate space. For example, values of ax = 0.0, ay = 0.0 represent the image’s top-left corner, ax = 1.0, ay = 1.0 represent the bottom-right, and ax = 0.5, ay = 0.5 represent the center of the image.

The flip argument is optional; see playdate.graphics.image:draw() for valid values.
	You must import CoreLibs/graphics to use this method.

 ]]
        playdate.graphics.image.drawAnchored(self._class, x, y, ax, ay, flip)
    end
    function image.drawCentered(self, x, y, flip)
        --[[ 
Draws the image centered at location (x, y).

The flip argument is optional; see playdate.graphics.image:draw() for valid values.
	You must import CoreLibs/graphics to use this method.

 ]]
        playdate.graphics.image.drawCentered(self._class, x, y, flip)
    end
    function image.drawIgnoringOffset(self, x, y, flip)
        --[[ 
 ]]
        playdate.graphics.image.drawIgnoringOffset(self._class, x, y, flip)
    end
    function image.drawIgnoringOffset(self, p, flip)
        --[[ 
Draws the image ignoring the currently-set drawOffset.

 ]]
        playdate.graphics.image.drawIgnoringOffset(self._class, p, flip)
    end
    function image.clear(self, color)
        --[[ 
Erases the contents of the image, setting all pixels to white if color is playdate.graphics.kColorWhite, black if it’s playdate.graphics.kColorBlack, or clear if it’s playdate.graphics.kColorClear. If the image is cleared to black or white, the mask (if it exists) is set to fully opaque. If the image is cleared to kColorClear and the image doesn’t have a mask, a mask is added to it.

 ]]
        playdate.graphics.image.clear(self._class, color)
    end
    function image.sample(self, x, y)
        --[[ 
Returns playdate.graphics.kColorWhite if the image is white at (x, y), playdate.graphics.kColorBlack if it’s black, or playdate.graphics.kColorClear if it’s transparent.
	The upper-left pixel of the image is at coordinate (0, 0).
Image transformations
	The following functions can be quite slow, especially when rotating images off-axis. Transforming a large image can take many milliseconds on the device. Be sure to test performance on the hardware when using these functions.

 ]]
        return playdate.graphics.image.sample(self._class, x, y)
    end
    function image.drawRotated(self, x, y, angle, scale, yscale)
        --[[ 
Draws this image centered at point (x,y) at (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.

 ]]
        playdate.graphics.image.drawRotated(self._class, x, y, angle, scale, yscale)
    end
    function image.rotatedImage(self, angle, scale, yscale)
        --[[ 
Returns a new image containing this image rotated by (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.
	Unless rotating by a multiple of 180 degrees, the new image will have different dimensions than the original.

 ]]
        return playdate.graphics.image.rotatedImage(self._class, angle, scale, yscale)
    end
    function image.drawScaled(self, x, y, scale, yscale)
        --[[ 
Draws this image with its upper-left corner at point (x,y), scaled by amount scale, with an optional separate scaling for the y axis.

 ]]
        playdate.graphics.image.drawScaled(self._class, x, y, scale, yscale)
    end
    function image.scaledImage(self, scale, yscale)
        --[[ 
Returns a new image containing this image scaled by amount scale, with an optional separate scaling for the y axis.

 ]]
        return playdate.graphics.image.scaledImage(self._class, scale, yscale)
    end
    function image.drawWithTransform(self, xform, x, y)
        --[[ 
Draws this image centered at point (x,y) with the transform xform applied.

 ]]
        playdate.graphics.image.drawWithTransform(self._class, xform, x, y)
    end
    function image.transformedImage(self, xform)
        --[[ 
Returns a new image containing the image with the transform xform applied.

 ]]
        return playdate.graphics.image.transformedImage(self._class, xform)
    end
    function image.drawSampled(self, x, y, width, height, centerx, centery, dxx, dyx, dxy, dyy, dx, dy, z, tiltAngle, tile)
        --[[ 
Draws the image as if it’s mapped onto a tilted plane, transforming the target coordinates to image coordinates using an affine transform:

x' = dxx * x + dyx * y + dx
y' = dxy * x + dyy * y + dy

    x, y, width, height: The rectangle to fill

    centerx, centery: The point in the above rectangle [in (0,1)x(0,1) coordinates] for the center of the transform

    dxx, dyx, dxy, dyy, dx, dy: Defines an affine transform from geometry coordinates to image coordinates

    z: The distance from the viewer to the target plane — lower z means more exaggerated perspective

    tiltAngle: The tilt of the target plane about the x axis, in degrees

    tile: A boolean, indicating whether the image is tiled on the target plane

The Mode7Driver demo in the /Examples folder of the SDK demonstrates the usage of this function.
Image masks

Image masks are how transparency is handled by images on the Playdate. When an image is drawn, the image mask is checked to see what parts of the image should be transparent.

The image mask takes the form of another image that must be the same dimensions as the image that it is masking. Regions that should be transparent are filled in with black pixels and opaque regions are filled in with white pixels. Any transparent image that is created or loaded from a file will automatically have an image mask applied to it to handle the transparency. Fully opaque images will, by default, have no image mask. An image may only have at most one image mask.

 ]]
        playdate.graphics.image.drawSampled(self._class, x, y, width, height, centerx, centery, dxx, dyx, dxy, dyy, dx, dy, z, tiltAngle, tile)
    end
    function image.setMaskImage(self, maskImage)
        --[[ 
Sets the image’s mask to a copy of maskImage.

 ]]
        playdate.graphics.image.setMaskImage(self._class, maskImage)
    end
    function image.getMaskImage(self)
        --[[ 
If the image has a mask, returns the mask as a separate image. Otherwise, returns nil.
	The returned image references the original’s data, so drawing into this image alters the original image’s mask.

 ]]
        return playdate.graphics.image.getMaskImage(self._class)
    end
    function image.addMask(self, opaque)
        --[[ 
Adds a mask to the image if it doesn’t already have one. If opaque is true or not specified, the image mask applied will be completely white, so the image will be entirely opaque. If opaque is false, the mask will be completely black, so the image will be entirely transparent.

 ]]
        playdate.graphics.image.addMask(self._class, opaque)
    end
    function image.removeMask(self)
        --[[ 
Removes the mask from the image if it has one.

 ]]
        playdate.graphics.image.removeMask(self._class)
    end
    function image.hasMask(self)
        --[[ 
Returns true if the image has a mask.

 ]]
        return playdate.graphics.image.hasMask(self._class)
    end
    function image.clearMask(self, opaque)
        --[[ 
Erases the contents of the image’s mask, so that the image is entirely opaque if opaque is 1, transparent otherwise. This function has no effect if the image doesn’t have a mask.
Example: How transparency is handled by image masks

-- By default, new images are transparent, so an image mask is automatically applied to 'image'
local image = playdate.graphics.image.new(20, 20)
-- maskImage will be a 20x20 black image, to mark that the entire image should be transparent
local maskImage = image:getMaskImage()
maskImage:draw(0, 0)

-- When the image is drawn, there will be nothing drawn, because the image mask makes it all transparent
image:draw(0, 0)

-- Removing the mask here will result in 'image' no longer having transparency
image:removeMask()

-- Drawing the image again will draw a black square, because without an image mask, there is no transparency
image:draw(0, 0)

-- Hopefully this cements the concept that all transparency is handled by image masks

Example: Using image masks to apply a dither filter and a hole punch out effect

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"

local gfx = playdate.graphics

-- Creating an image with a black circle
local circleDiameter = 25
local circleImage = gfx.image.new(circleDiameter, circleDiameter)
gfx.pushContext(circleImage)
    gfx.fillCircleInRect(0, 0, circleImage:getSize())
gfx.popContext()

-- Saving the original mask (the transparency in the corners of the image not covered by the circle)
local circleMask = circleImage:getMaskImage():copy()

-- Copying the original mask to preserve transparent regions around the circle
local ditherMask = circleMask:copy()
-- Drawing into mask with a dither effect
gfx.pushContext(ditherMask)
    gfx.setColor(gfx.kColorBlack)
    gfx.setDitherPattern(0.5, gfx.image.kDitherTypeBayer8x8)
    gfx.fillRect(0, 0, ditherMask:getSize())
gfx.popContext()

-- Copying the original mask to preserve transparent regions around the circle
local holeMask = circleMask:copy()
-- Drawing a hole into mask
gfx.pushContext(holeMask)
    gfx.setColor(gfx.kColorBlack)
    local width, height = holeMask:getSize()
    gfx.fillCircleAtPoint(width/2, height/2, width/4)
gfx.popContext()

function playdate.update()
    -- Circle is drawn with dithered regions transparent
    circleImage:setMaskImage(ditherMask)
    circleImage:drawAnchored(100, 120, 0.5, 0.5)

    -- Circle is drawn with hole in center
    circleImage:setMaskImage(holeMask)
    circleImage:drawAnchored(200, 120, 0.5, 0.5)

    -- Resetting the original mask returns the circle to normal
    circleImage:setMaskImage(circleMask)
    circleImage:drawAnchored(300, 120, 0.5, 0.5)
end

-- Technical details: Why copy the mask after getting it? :getMaskImage() returns a reference
-- to the mask image. Using :setMaskImage after will update that mask image to a new image, which
-- overwrites the referenced image and the original is lost. That's why we make a copy. Of course,
-- no :copy() calls are necessary if you don't intend to save the original mask.

Image effects

 ]]
        return playdate.graphics.image.clearMask(self._class, opaque)
    end
    function image.drawTiled(self, x, y, width, height, flip)
        --[[ 
 ]]
        playdate.graphics.image.drawTiled(self._class, x, y, width, height, flip)
    end
    function image.drawTiled(self, rect, flip)
        --[[ 
Tiles the image into the given rectangle, using either listed dimensions or a playdate.geometry.rect object, and the optional flip style.

 ]]
        playdate.graphics.image.drawTiled(self._class, rect, flip)
    end
    function image.drawBlurred(self, x, y, radius, numPasses, ditherType, flip, xPhase, yPhase)
        --[[ 
Draws a blurred version of the image at (x, y).

    radius: A bigger radius means a more blurred result. Processing time is independent of the radius.

    numPasses: A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.

    ditherType: The algorithm to use when blurring the image, must be one of the values listed in playdate.graphics.image:blurredImage()

    flip: optional; see playdate.graphics.image:draw() for valid values.

    xPhase, yPhase: optional; integer values that affect the appearance of playdate.graphics.image.kDitherTypeDiagonalLine, playdate.graphics.image.kDitherTypeVerticalLine, playdate.graphics.image.kDitherTypeHorizontalLine, playdate.graphics.image.kDitherTypeScreen, playdate.graphics.image.kDitherTypeBayer2x2, playdate.graphics.image.kDitherTypeBayer4x4, and playdate.graphics.image.kDitherTypeBayer8x8.


 ]]
        playdate.graphics.image.drawBlurred(self._class, x, y, radius, numPasses, ditherType, flip, xPhase, yPhase)
    end
    function image.blurredImage(self, radius, numPasses, ditherType, padEdges, xPhase, yPhase)
        --[[ 
Returns a blurred copy of the caller.

    radius: A bigger radius means a more blurred result. Processing time is independent of the radius.

    numPasses: A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.

    ditherType: The original image is blurred into a greyscale image then dithered back to 1-bit using one of the following dithering algorithms:

        playdate.graphics.image.kDitherTypeNone

        playdate.graphics.image.kDitherTypeDiagonalLine

        playdate.graphics.image.kDitherTypeVerticalLine

        playdate.graphics.image.kDitherTypeHorizontalLine

        playdate.graphics.image.kDitherTypeScreen

        playdate.graphics.image.kDitherTypeBayer2x2

        playdate.graphics.image.kDitherTypeBayer4x4

        playdate.graphics.image.kDitherTypeBayer8x8

        playdate.graphics.image.kDitherTypeFloydSteinberg

        playdate.graphics.image.kDitherTypeBurkes

        playdate.graphics.image.kDitherTypeAtkinson

    padEdges: Boolean indicating whether the edges of the images should be padded to accommodate the blur radius. Defaults to false.

    xPhase, yPhase: optional; integer values that affect the appearance of playdate.graphics.image.kDitherTypeDiagonalLine, playdate.graphics.image.kDitherTypeVerticalLine, playdate.graphics.image.kDitherTypeHorizontalLine, playdate.graphics.image.kDitherTypeScreen, playdate.graphics.image.kDitherTypeBayer2x2, playdate.graphics.image.kDitherTypeBayer4x4, and playdate.graphics.image.kDitherTypeBayer8x8.


 ]]
        return playdate.graphics.image.blurredImage(self._class, radius, numPasses, ditherType, padEdges, xPhase, yPhase)
    end
    function image.drawFaded(self, x, y, alpha, ditherType)
        --[[ 
Draws a partially transparent image with its upper-left corner at location (x, y)

    alpha: The alpha value used to draw the image, with 1 being fully opaque, and 0 being completely transparent.

    ditherType: The caller is faded using one of the dithering algorithms listed in playdate.graphics.image:blurredImage()


 ]]
        playdate.graphics.image.drawFaded(self._class, x, y, alpha, ditherType)
    end
    function image.fadedImage(self, alpha, ditherType)
        --[[ 
Returns a faded version of the caller.

    alpha: The alpha value assigned to the caller, in the range 0.0 - 1.0. If an image mask already exists it is multiplied by alpha.

    ditherType: The caller is faded into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()


 ]]
        return playdate.graphics.image.fadedImage(self._class, alpha, ditherType)
    end
    function image.setInverted(self, flag)
        --[[ 
If flag is true, the image will be drawn with its colors inverted. If the image is being used as a stencil, its behavior is reversed: pixels are drawn where the stencil is black, nothing is drawn where the stencil is white.

 ]]
        playdate.graphics.image.setInverted(self._class, flag)
    end
    function image.invertedImage(self)
        --[[ 
Returns a color-inverted copy of the caller.

 ]]
        return playdate.graphics.image.invertedImage(self._class)
    end
    function image.blendWithImage(self, image, alpha, ditherType)
        --[[ 
Returns an image that is a blend between the caller and image.

    image: the playdate.graphics.image to be blended with the caller.

    alpha: The alpha value assigned to the caller. image will have an alpha of (1 - alpha).

    ditherType: The caller and image are blended into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()


 ]]
        return playdate.graphics.image.blendWithImage(self._class, image, alpha, ditherType)
    end
    function image.vcrPauseFilterImage(self)
        --[[ 
Returns an image created by applying a VCR pause effect to the calling image.
Other image stuff

 ]]
        return playdate.graphics.image.vcrPauseFilterImage(self._class)
    end
    return image
end, {})
local nineSlice = class(function(nineSlice)
    function nineSlice.__init__(self, imagePath, innerX, innerY, innerWidth, innerHeight)
        --[[ 
Returns a new 9 slice image from the image at imagePath with the stretchable region defined by other parameters. The arguments represent the origin and dimensions of the innermost ("center") slice.

 ]]
        self._class = playdate.graphics.nineSlice.new(imagePath, innerX, innerY, innerWidth, innerHeight)
    end
    function nineSlice.getSize(self)
        --[[ 
Returns the size of the 9 slice image as a pair (width, height).

 ]]
        return playdate.graphics.nineSlice.getSize(self._class)
    end
    function nineSlice.getMinSize(self)
        --[[ 
Returns the minimum size of the 9 slice image as a pair (width, height).

 ]]
        return playdate.graphics.nineSlice.getMinSize(self._class)
    end
    function nineSlice.drawInRect(self, x, y, width, height)
        --[[ 
 ]]
        playdate.graphics.nineSlice.drawInRect(self._class, x, y, width, height)
    end
    function nineSlice.drawInRect(self, rect)
        --[[ 
Draws the 9 slice image at the desired coordinates by stretching the defined region to achieve the width and height inputs.
Perlin noise

Perlin noise is an algorithm useful for generating "organic" looking things procedurally, such as terrain, visual effects, and more. For a good introduction to Perlin noise, see: http://flafla2.github.io/2014/08/09/perlinnoise.html

 ]]
        playdate.graphics.nineSlice.drawInRect(self._class, rect)
    end
    return nineSlice
end, {})
local loop = class(function(loop)
    function loop.__init__(self, delay, imageTable, shouldLoop)
        --[[ 
Creates a new animation object.

    imageTable should be a playdate.graphics.imagetable, or nil.

The following properties can be read or set directly, and have these defaults:

    delay : the value of delay, if passed, or 100ms (the delay before moving to the next frame)

    startFrame : 1 (the value the object resets to when the loop completes)

    endFrame : the number of images in imageTable if passed, or 1 (the last frame value in the loop)

    frame : 1 (the current frame counter)

    step : 1 (the value by which frame increments)

    shouldLoop : the value of shouldLoop, if passed, or true. (whether the object loops when it completes)

    paused : false (paused loops don’t change their frame value)


 ]]
        self._class = playdate.graphics.animation.loop.new(delay, imageTable, shouldLoop)
    end
    function loop.draw(self, x, y, flip)
        --[[ 
Draw’s the loop’s current image at x, y.

The flip argument is optional; see playdate.graphics.image:draw() for valid values.

 ]]
        playdate.graphics.animation.loop.draw(self._class, x, y, flip)
    end
    function loop.image(self)
        --[[ 
Returns a playdate.graphics.image from the caller’s imageTable if it exists. The image returned will be at the imageTable’s index that matches the caller’s frame.

 ]]
        return playdate.graphics.animation.loop.image(self._class)
    end
    function loop.isValid(self)
        --[[ 
Returns false if the loop has passed its last frame and does not loop.

 ]]
        return playdate.graphics.animation.loop.isValid(self._class)
    end
    function loop.setImageTable(self, imageTable)
        --[[ 
Sets the playdate.graphics.imagetable to be used for this animation loop, and sets the loop’s endFrame property to #imageTable.
Example: Using an animation loop to draw an animated image

local gfx = playdate.graphics

-- Each frame of the animation will last 200ms
local frameTime = 200
local animationImagetable = gfx.imagetable.new("path/to/imagetable")
-- Setting the last argument to true makes it so the animation will loop
local animationLoop = gfx.animation.loop.new(frameTime, animationImagetable, true)

function playdate.update()
    -- Draws the animation in a loop
    animationLoop:draw(0, 0)
end

Example: Creating multiple animation states from one sprite sheet

local gfx = playdate.graphics

-- In this example, the imagetable is one sprite sheet, made up of multiple animations
local animationImagetable = gfx.imagetable.new("path/to/imagetable")

-- Creating the idle animation loop (400ms per frame)
local idleAnimation = gfx.animation.loop.new(400, animationImagetable, true)
-- In this example, the idle animation is made of up frames 1 through 3 of the
-- imagetable, so the startFrame and endFrame properties are set accordingly
idleAnimation.startFrame = 1
idleAnimation.endFrame = 3

-- Creating the run animation loop (200ms per frame)
local runAnimation = gfx.animation.loop.new(200, animationImagetable, true)
-- In this example, the run animation is made of up frames 4 through 8 of the
-- imagetable, so the startFrame and endFrame properties are set accordingly
runAnimation.startFrame = 4
runAnimation.endFrame = 8

-- Creating a simple state tracker
local states = {idle = 1, run = 2}
local state = states.idle

function playdate.update()
    -- Draw different animations based on the state
    if state == states.idle then
        idleAnimation:draw(0, 0)
    elseif state == states.run then
        runAnimation:draw(0, 0)
    end
end

Example: Using an animation loop in a sprite

local gfx = playdate.graphics

-- Each frame of the animation will last 200ms
local frameTime = 200
local animationImagetable = gfx.imagetable.new("path/to/imagetable")
-- Setting the last argument to false makes the animation stop on the last frame
local animationLoop = gfx.animation.loop.new(frameTime, animationImagetable, false)
-- Set sprite image to first frame of the animation
local animatedSprite = gfx.sprite.new(animationLoop:image())
-- Add sprite to display list
animatedSprite:add()
-- One easy way to update the sprite image to match the animation
-- is to simply override the sprite update method and do it there
animatedSprite.update = function()
    animatedSprite:setImage(animationLoop:image())
    -- Optionally, removing the sprite when the animation finished
    if not animationLoop:isValid() then
        animatedSprite:remove()
    end
end

Animator

Animators are lightweight objects that keep track of animation progress. They can animate between two numbers, two points, along a line segment, arc, or polygon, or along a compound path made up of all three.

Usage is simple: create a new Animator, query for its current value when you need to update your animation, and optionally call animator:ended() to see if the animation is complete.
	Example code: <Playdate SDK>/Examples/Single File Examples/animator.lua
	You must import CoreLibs/animator to use these functions.

 ]]
        playdate.graphics.animation.loop.setImageTable(self._class, imageTable)
    end
    return loop
end, {})
local animator = class(function(animator)
    function animator.__init__(self, ...)
        local args = list {...}
        --[[ 
Animates between two number or playdate.geometry.point values.

duration is the total time of the animation in milliseconds.

startValue and endValue should be either numbers or playdate.geometry.point

easingFunction, if supplied, should be a value from playdate.easingFunctions. If your easing function requires additional variables s, a, or p, set them on the animator directly after creation. For example:

local a = playdate.graphics.animator.new(1000, 0, 100, playdate.easingFunctions.inBack)
a.s = 1.9

startTimeOffset, if supplied, will shift the start time of the animation by the specified number of milliseconds. (If positive, the animation will be delayed. If negative, the animation will effectively have started before the moment the animator is instantiated.)
Example: Using an animator to animate movement

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"
import "CoreLibs/animator"

-- We'll be demonstrating how to use an animator to animate a square moving across the screen
local square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)

-- 1000ms, or 1 second
local animationDuration = 1000
-- We're animating from the left to the right of the screen
local startX, endX = -20, 400
-- Setting an easing function to get a nice, smooth movement
local easingFunction = playdate.easingFunctions.inOutCubic
local animator = playdate.graphics.animator.new(animationDuration, startX, endX, easingFunction)
animator.repeatCount = -1 -- Make animator repeat forever

function playdate.update()
    -- Clear the screen
    playdate.graphics.clear()

    -- By using :currentValue() as the x value, the square follows along with the animation
    square:draw(animator:currentValue(), 120)
end


 ]]
        self._class = playdate.graphics.animator.new(unpack(args))
    end
    return animator
end, {})
local animator = class(function(animator)
    function animator.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new Animator that will animate along the provided playdate.geometry.lineSegment
Example: Using an animator to animate along a line

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"
import "CoreLibs/animator"

-- We'll be demonstrating how to use an animator to animate a square moving across the screen
local square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)

-- 1000ms, or 1 second
local animationDuration = 1000
-- We're animating from the top left to the bottom right of the screen
local line = playdate.geometry.lineSegment.new(0, 0, 400, 240)
local animator = playdate.graphics.animator.new(animationDuration, line)

function playdate.update()
    -- Clear the screen
    playdate.graphics.clear()

    -- We can use :currentValue() directly, as it returns a point
    square:draw(animator:currentValue())
end


 ]]
        self._class = playdate.graphics.animator.new(unpack(args))
    end
    return animator
end, {})
local animator = class(function(animator)
    function animator.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new Animator that will animate along the provided playdate.geometry.arc

 ]]
        self._class = playdate.graphics.animator.new(unpack(args))
    end
    return animator
end, {})
local animator = class(function(animator)
    function animator.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new Animator that will animate along the provided playdate.geometry.polygon

 ]]
        self._class = playdate.graphics.animator.new(unpack(args))
    end
    return animator
end, {})
local animator = class(function(animator)
    function animator.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new Animator that will animate along each of the items in the parts array in order, which should be comprised of playdate.geometry.lineSegment, playdate.geometry.arc, or playdate.geometry.polygon objects.

durations should be an array of durations, one for each item in parts.

easingFunctions should be an array of playdate.easingFunctions, one for each item in parts.
	By default, animators do not repeat. If you would like them to, set the animator’s repeatCount property to the number of times the animation should repeat. It can be set to any positive number or -1 to indicate the animation should repeat forever. Note that a repeat count of 1 means the animation will play twice - once for the initial animation plus one repeat.
Example: Using an animator with parts

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"
import "CoreLibs/animator"

-- We'll be demonstrating how to animate something with parts
local square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)

-- First part will take 3 seconds, second part will take 1, and third part will take 2
local animationDurations = {3000, 1000, 2000}
-- We'll first animate along a line, then an arc, and then a polygon
local animationParts = {
    playdate.geometry.lineSegment.new(0, 0, 200, 80),
    playdate.geometry.arc.new(200, 120, 40, 0, 180),
    playdate.geometry.polygon.new(200, 160, 300, 90, 390, 230)
}
-- We must set the easing functions for each part, and they can all be different
local animationEasingFunctions = {
    playdate.easingFunctions.outQuart,
    playdate.easingFunctions.inOutCubic,
    playdate.easingFunctions.outBounce
}

-- To animate by parts, each argument must be arrays of equal length
local animator = playdate.graphics.animator.new(animationDurations, animationParts, animationEasingFunctions)

function playdate.update()
    -- Clear the screen
    playdate.graphics.clear()

    -- We can use :currentValue() directly, as it returns a point
    square:draw(animator:currentValue())
end


 ]]
        self._class = playdate.graphics.animator.new(unpack(args))
    end
    function animator.currentValue(self)
        --[[ 
Returns the current value of the animation, which will be either a number or a playdate.geometry.point, depending on the type of animator.

 ]]
        return playdate.graphics.animator.currentValue(self._class)
    end
    function animator.valueAtTime(self, time)
        --[[ 
Returns the value of the animation at the given number of milliseconds after the start time. The value will be either a number or a playdate.geometry.point, depending on the type of animator.

 ]]
        return playdate.graphics.animator.valueAtTime(self._class, time)
    end
    function animator.progress(self)
        --[[ 
Returns the current progress of the animation as a value from 0 to 1.

 ]]
        return playdate.graphics.animator.progress(self._class)
    end
    function animator.reset(self, duration)
        --[[ 
Resets the animation, setting its start time to the current time, and changes the animation’s duration if a new duration is given.

 ]]
        playdate.graphics.animator.reset(self._class, duration)
    end
    function animator.ended(self)
        --[[ 
Returns true if the animation is completed. Only returns true if this function or currentValue() has been called since the animation ended in order to allow animations to fully finish before true is returned.

 ]]
        return playdate.graphics.animator.ended(self._class)
    end
    return animator
end, {})
local blinker = class(function(blinker)
    function blinker.__init__(self, onDuration, offDuration, loop, cycles, default)
        --[[ 
Creates a new blinker object. Check the object’s on property to determine whether the blinker is on (true) or off (false). The default properties are:

    onDuration: 200 (the number of milliseconds the blinker is "on")

    offDuration: 200 (the number of milliseconds the blinker is "off")

    loop: false (should the blinker restart after completing)

    cycles: 6 (the number of changes the blinker goes through before it’s complete)

    default: true (the state the blinker will start in. Note: if default is true, blinker.on will return true when the blinker is in its onDuration phase. If default is false, blinker.on will return false when the blinker is in its onDuration phase.)

Other informative properties:

    counter: Read this property to see which cycle the blinker is on (counts from n down to zero)

    on: Read this property to determine the current state of the blinker. The blinker always starts in the state specified by the default property.

    running: Read this property to see if the blinker is actively running


 ]]
        self._class = playdate.graphics.animation.blinker.new(onDuration, offDuration, loop, cycles, default)
    end
    function blinker.update(self)
        --[[ 
Updates the caller’s state.

 ]]
        playdate.graphics.animation.blinker.update(self._class)
    end
    function blinker.start(self, onDuration, offDuration, loop, cycles, default)
        --[[ 
Starts a blinker if it’s not running. Pass values for any property values you wish to modify.

 ]]
        playdate.graphics.animation.blinker.start(self._class, onDuration, offDuration, loop, cycles, default)
    end
    function blinker.startLoop(self)
        --[[ 
Starts a blinker if it’s not running and sets its loop property to true. Equivalent to calling playdate.graphics.animation.blinker:start(nil, nil, true)

 ]]
        playdate.graphics.animation.blinker.startLoop(self._class)
    end
    function blinker.stop(self)
        --[[ 
Stops a blinker if it’s running, returning the blinker’s on properly to the default value.

 ]]
        return playdate.graphics.animation.blinker.stop(self._class)
    end
    function blinker.remove(self)
        --[[ 
Flags the caller for removal from the global list of blinkers
Scrolling

 ]]
        playdate.graphics.animation.blinker.remove(self._class)
    end
    return blinker
end, {})
local imagetable = class(function(imagetable)
    function imagetable.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a playdate.graphics.imagetable object from the data at path. If there is no file at path, the function returns nil and a second value describing the error. If the file at path is an animated GIF, successive frames of the GIF will be loaded as consecutive bitmaps in the imagetable. Any timing data in the animated GIF will be ignored.
	To load a matrix image table defined in frames-table-16-16.png, you call playdate.graphics.imagetable.new("frames").
	To load a sequential image table defined with the files frames-table-1.png, frames-table-2.png, etc., you call playdate.graphics.imagetable.new("frames").

 ]]
        self._class = playdate.graphics.imagetable.new(unpack(args))
    end
    return imagetable
end, {})
local imagetable = class(function(imagetable)
    function imagetable.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns an empty image table for loading images into via imagetable:load() or setting already-loaded images into with imagetable:setImage(). If set, cellsWide is used to locate images by x,y position. The optional cellSize argument gives the allocation size for the images, if load() will be used. (This is a weird technical detail, so ask us if you need guidance here.)

 ]]
        self._class = playdate.graphics.imagetable.new(unpack(args))
    end
    function imagetable.getImage(self, n)
        --[[ 
Returns the n-th playdate.graphics.image in the table (ordering left-to-right, top-to-bottom). The first image is at index 1. If .n_ or (x,y) is out of bounds, the function returns nil. See also imagetable[n].

 ]]
        return playdate.graphics.imagetable.getImage(self._class, n)
    end
    function imagetable.getImage(self, x, y)
        --[[ 
Returns the image in cell (x,y) in the original bitmap. The first image is at index 1. If n or (x,y) is out of bounds, the function returns nil. See also imagetable[n].

 ]]
        return playdate.graphics.imagetable.getImage(self._class, x, y)
    end
    function imagetable.setImage(self, n, image)
        --[[ 
Sets the image at slot n in the image table by creating a reference to the data in image.

 ]]
        playdate.graphics.imagetable.setImage(self._class, n, image)
    end
    function imagetable.load(self, path)
        --[[ 
Loads a new image table from the data at path into an already-existing image table, without allocating additional memory. The image table at path must contain images of the same dimensions as the previous.

Returns (success, [error]). If the boolean success is false, error is also returned.

 ]]
        return playdate.graphics.imagetable.load(self._class, path)
    end
    function imagetable.getLength(self)
        --[[ 
Returns the number of images in the table. See also #imagetable.

 ]]
        return playdate.graphics.imagetable.getLength(self._class)
    end
    function imagetable.getSize(self)
        --[[ 
Returns the pair (cellsWide, cellsHigh).

 ]]
        return playdate.graphics.imagetable.getSize(self._class)
    end
    function imagetable.drawImage(self, n, x, y, flip)
        --[[ 
Equivalent to graphics.imagetable:getImage(n):draw(x,y,[flip]).

 ]]
        playdate.graphics.imagetable.drawImage(self._class, n, x, y, flip)
    end
    return imagetable
end, {})
local tilemap = class(function(tilemap)
    function tilemap.__init__(self)
        --[[ 
Creates a new tilemap object.

 ]]
        self._class = playdate.graphics.tilemap.new()
    end
    function tilemap.setImageTable(self, table)
        --[[ 
Sets the tilemap’s playdate.graphics.imagetable to table, a playdate.graphics.imagetable.

 ]]
        playdate.graphics.tilemap.setImageTable(self._class, table)
    end
    function tilemap.setTiles(self, data, width)
        --[[ 
Sets the tilemap’s width to width, then populates the tilemap with data, which should be a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.

 ]]
        playdate.graphics.tilemap.setTiles(self._class, data, width)
    end
    function tilemap.getTiles(self)
        --[[ 
Returns data, width
data is a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.
width is the width of the tile map, in number of tiles.

 ]]
        return playdate.graphics.tilemap.getTiles(self._class)
    end
    function tilemap.draw(self, x, y, sourceRect)
        --[[ 
Draws the tile map at screen coordinate (x, y).

sourceRect, if specified, will cause only the part of the tilemap within sourceRect to be drawn. sourceRect should be relative to the tilemap’s bounds and can be a playdate.geometry.rect or four integers, (x, y, w, h), representing the rect.

 ]]
        playdate.graphics.tilemap.draw(self._class, x, y, sourceRect)
    end
    function tilemap.drawIgnoringOffset(self, x, y, sourceRect)
        --[[ 
Draws the tilemap ignoring the currently-set drawOffset.

 ]]
        playdate.graphics.tilemap.drawIgnoringOffset(self._class, x, y, sourceRect)
    end
    function tilemap.setTileAtPosition(self, x, y, index)
        --[[ 
Sets the index of the tile at tilemap position (x, y). index is the (1-based) index of the image in the tilemap’s playdate.graphics.imagetable.
	Tilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:setTileAtPosition(1, 1, 2) will set the index of the tile in the top-leftmost position to 2.

 ]]
        playdate.graphics.tilemap.setTileAtPosition(self._class, x, y, index)
    end
    function tilemap.getTileAtPosition(self, x, y)
        --[[ 
Returns the image index of the tile at the given x and y coordinate. If x or y is out of bounds, returns nil.
	Tilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:getTileAtPosition(1, 1) will return the index of the top-leftmost tile.

 ]]
        return playdate.graphics.tilemap.getTileAtPosition(self._class, x, y)
    end
    function tilemap.setSize(self, width, height)
        --[[ 
Sets the tilemap’s width and height, in number of tiles.

 ]]
        playdate.graphics.tilemap.setSize(self._class, width, height)
    end
    function tilemap.getSize(self)
        --[[ 
Returns the size of the tile map, in tiles, as a pair, (width, height).

 ]]
        return playdate.graphics.tilemap.getSize(self._class)
    end
    function tilemap.getPixelSize(self)
        --[[ 
Returns the size of the tilemap in pixels; that is, the size of the image multiplied by the number of rows and columns in the map. Returns multiple values (width, height).

 ]]
        return playdate.graphics.tilemap.getPixelSize(self._class)
    end
    function tilemap.getTileSize(self)
        --[[ 
Returns multiple values (width, height), the pixel width and height of an individual tile.

 ]]
        return playdate.graphics.tilemap.getTileSize(self._class)
    end
    function tilemap.getCollisionRects(self, emptyIDs)
        --[[ 
This function returns an array of playdate.geometry.rect objects that describe the areas of the tilemap that should trigger collisions. You can also think of them as the "impassable" rects of your tilemap. These rects will be in tilemap coordinates, not pixel coordinates.

emptyIDs is an array that contains the tile IDs of "empty" (or "passable") tiles in the tilemap — in other words, tile IDs that should not trigger a collision. Tiles with default IDs of 0 are treated as empty by default, so you do not need to include 0 in the array.

For example, if you have a tilemap describing terrain, where tile ID 1 represents grass the player can walk over, and tile ID 2 represents mountains that the player can’t cross, you’d pass an array containing just the value 1. You’ll get a back an array of a minimal number of rects describing the areas where there are mountain tiles.

You can then pass each of those rects into playdate.graphics.sprite.addEmptyCollisionSprite() to add an empty (invisible) sprite into the scene for the built-in collision detection methods. In this example, collide rects would be added around mountain tiles but not grass tiles.

Alternatively, instead of calling getCollisionRects() at all, you can use the convenience function playdate.graphics.sprite.addWallSprites(), which is effectively a shortcut for calling getCollisionRects() and passing all the resulting rects to addEmptyCollisionSprite().
Sprite

Sprites are graphic objects that can be used to represent moving entities in your games, like the player, or the enemies that chase after your player. Sprites animate efficiently, and offer collision detection and a host of other built-in functionality. (If you want to create an environment for your sprites to move around in, consider using tilemaps or drawing a background image.)
	To have access to all the sprite functionality described below, be sure to import "CoreLibs/sprites" at the top of your source file.

The simplest way to create a sprite is using sprite.new(image):
Creating a standalone sprite

import "CoreLibs/sprites"

local image = playdate.graphics.image.new("coin")
local sprite = playdate.graphics.sprite.new(image)
sprite:moveTo(100, 100)
sprite:add()

If you want to use an object-oriented approach, you can also subclass sprites and create instance of those subclasses.
Creating a sprite subclass

import "CoreLibs/sprites"

class('MySprite').extends(playdate.graphics.sprite)

local sprite = MySprite()
local image = playdate.graphics.image.new("coin")
sprite:setImage(image)
sprite:moveTo(100, 100)
sprite:add()

Or with a custom initializer:
Creating a sprite subclass with a custom initializer

import "CoreLibs/sprites"

class('MySprite').extends(playdate.graphics.sprite)

local image = playdate.graphics.image.new("coin")

function MySprite:init(x, y)
    MySprite.super.init(self) -- this is critical
    self:setImage(image)
    self:moveTo(x, y)
end

local sprite = MySprite(100, 100)
sprite:add()

Sprite Basics

 ]]
        return playdate.graphics.tilemap.getCollisionRects(self._class, emptyIDs)
    end
    return tilemap
end, {})
local sprite = class(function(sprite)
    function sprite.__init__(self, ...)
        local args = list {...}
        --[[ 
This class method (note the "." syntax rather than ":") returns a new sprite object. A previously-loaded image or tilemap object can be optionally passed-in.
	To see your sprite onscreen, you will need to call :add() on your sprite to add it to the display list.

 ]]
        self._class = playdate.graphics.sprite.new(unpack(args))
    end
    function sprite.setImage(self, image, flip, scale, yscale)
        --[[ 
Sets the sprite’s image to image, which should be an instance of playdate.graphics.image. The .flip_ argument is optional; see playdate.graphics.image:draw() for valid values. Optional scale arguments are also accepted. Unless disabled with playdate.graphics.sprite:setRedrawOnImageChange(), the sprite is automatically marked for redraw if the image isn’t the previous image.

 ]]
        playdate.graphics.sprite.setImage(self._class, image, flip, scale, yscale)
    end
    function sprite.getImage(self)
        --[[ 
Returns the playdate.graphics.image object that was set with setImage().

 ]]
        return playdate.graphics.sprite.getImage(self._class)
    end
    function sprite.add(self)
        --[[ 
Adds the given sprite to the display list, so that it is drawn in the current scene.

 ]]
        playdate.graphics.sprite.add(self._class)
    end
    function sprite.remove(self)
        --[[ 
Removes the given sprite from the display list.

 ]]
        playdate.graphics.sprite.remove(self._class)
    end
    function sprite.moveTo(self, x, y)
        --[[ 
Moves the sprite and resets the bounds based on the image dimensions and center.

 ]]
        playdate.graphics.sprite.moveTo(self._class, x, y)
    end
    function sprite.getPosition(self)
        --[[ 
Returns the sprite’s current x, y position as multiple values (x, y).

 ]]
        return playdate.graphics.sprite.getPosition(self._class)
    end
    function sprite.moveBy(self, x, y)
        --[[ 
Moves the sprite by x, y pixels relative to its current position.

 ]]
        playdate.graphics.sprite.moveBy(self._class, x, y)
    end
    function sprite.setZIndex(self, z)
        --[[ 
Sets the Z-index of the given sprite. Sprites with higher Z-indexes are drawn on top of those with lower Z-indexes. Valid values for z are in the range (-32768, 32767).

 ]]
        playdate.graphics.sprite.setZIndex(self._class, z)
    end
    function sprite.getZIndex(self)
        --[[ 
Returns the Z-index of the given sprite.

 ]]
        return playdate.graphics.sprite.getZIndex(self._class)
    end
    function sprite.setVisible(self, flag)
        --[[ 
Sprites that aren’t visible don’t get their draw() method called.

 ]]
        playdate.graphics.sprite.setVisible(self._class, flag)
    end
    function sprite.isVisible(self)
        --[[ 
Returns a boolean value, true if the sprite is visible.

 ]]
        return playdate.graphics.sprite.isVisible(self._class)
    end
    function sprite.setCenter(self, x, y)
        --[[ 
Sets the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width. Default is 0.5, 0.5 (the center of the sprite). This means that when you call :moveTo(x, y), the center of your sprite will be positioned at x, y. If you want x and y to represent the upper left corner of your sprite, specify the center as 0, 0.

 ]]
        playdate.graphics.sprite.setCenter(self._class, x, y)
    end
    function sprite.getCenter(self)
        --[[ 
Returns multiple values (x, y) representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.

 ]]
        return playdate.graphics.sprite.getCenter(self._class)
    end
    function sprite.getCenterPoint(self)
        --[[ 
Returns a playdate.geometry.point representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.

 ]]
        return playdate.graphics.sprite.getCenterPoint(self._class)
    end
    function sprite.setSize(self, width, height)
        --[[ 
Sets the sprite’s size. The method has no effect if the sprite has an image set.

 ]]
        playdate.graphics.sprite.setSize(self._class, width, height)
    end
    function sprite.getSize(self)
        --[[ 
Returns multiple values (width, height), the current size of the sprite.

 ]]
        return playdate.graphics.sprite.getSize(self._class)
    end
    function sprite.setScale(self, scale, yScale)
        --[[ 
Sets the scaling factor for the sprite, with an optional separate scaling for the y axis. If setImage() is called after this, the scale factor is applied to the new image. Only affects sprites that have an image set.

 ]]
        playdate.graphics.sprite.setScale(self._class, scale, yScale)
    end
    function sprite.getScale(self)
        --[[ 
Returns multiple values (xScale, yScale), the current scaling of the sprite.

 ]]
        return playdate.graphics.sprite.getScale(self._class)
    end
    function sprite.setRotation(self, angle, scale, yScale)
        --[[ 
Sets the rotation for the sprite, in degrees clockwise, with an optional scaling factor. If setImage() is called after this, the rotation and scale is applied to the new image. Only affects sprites that have an image set. This function should be used with discretion, as it’s likely to be slow on the hardware. Consider pre-rendering rotated images for your sprites instead.

 ]]
        playdate.graphics.sprite.setRotation(self._class, angle, scale, yScale)
    end
    function sprite.getRotation(self)
        --[[ 
Returns the current rotation of the sprite.

 ]]
        return playdate.graphics.sprite.getRotation(self._class)
    end
    function sprite.copy(self)
        --[[ 
Returns a copy of the caller.

 ]]
        return playdate.graphics.sprite.copy(self._class)
    end
    function sprite.setUpdatesEnabled(self, flag)
        --[[ 
The sprite’s updatesEnabled flag (defaults to true) determines whether a sprite’s update() method will be called. By default, a sprite’s update method does nothing; however, you may choose to have your sprite do something on every frame by implementing an update method on your sprite instance, or implementing it in your sprite subclass.

 ]]
        playdate.graphics.sprite.setUpdatesEnabled(self._class, flag)
    end
    function sprite.updatesEnabled(self)
        --[[ 
Returns a boolean value, true if updates are enabled on the sprite.

 ]]
        return playdate.graphics.sprite.updatesEnabled(self._class)
    end
    function sprite.setTag(self, tag)
        --[[ 
Sets the sprite’s tag, an integer value in the range of 0 to 255, useful for identifying sprites later, particularly when working with collisions.

 ]]
        playdate.graphics.sprite.setTag(self._class, tag)
    end
    function sprite.getTag(self)
        --[[ 
Returns the sprite’s tag, an integer value.

 ]]
        return playdate.graphics.sprite.getTag(self._class)
    end
    function sprite.setImageDrawMode(self, mode)
        --[[ 
Sets the mode for drawing the bitmap. See playdate.graphics.setImageDrawMode(mode) for valid modes.

 ]]
        playdate.graphics.sprite.setImageDrawMode(self._class, mode)
    end
    function sprite.setImageFlip(self, flip, flipCollideRect)
        --[[ 
Flips the bitmap. See playdate.graphics.image:draw() for valid flip values.

If true is passed for the optional flipCollideRect argument, the sprite’s collideRect will be flipped as well.

Calling setImage() will reset the sprite to its default, non-flipped orientation. So, if you call both setImage() and setImageFlip(), call setImage() first.

 ]]
        playdate.graphics.sprite.setImageFlip(self._class, flip, flipCollideRect)
    end
    function sprite.getImageFlip(self)
        --[[ 
Returns one of the values listed at playdate.graphics.image:draw().

 ]]
        return playdate.graphics.sprite.getImageFlip(self._class)
    end
    function sprite.setIgnoresDrawOffset(self, flag)
        --[[ 
When set to true, the sprite will draw in screen coordinates, ignoring the currently-set drawOffset.

This only affects drawing, and should not be used on sprites being used for collisions, which will still happen in world-space.

 ]]
        playdate.graphics.sprite.setIgnoresDrawOffset(self._class, flag)
    end
    function sprite.setBounds(self, upper_left_x, upper_left_y, width, height)
        --[[ 
setBounds() positions and sizes the sprite, used for drawing and for calculating dirty rects. upper-left-x and upper-left-y are relative to the overall display coordinate system. (If an image is attached to the sprite, the size will be defined by that image, and not by the width and height parameters passed in to setBounds().)
	In setBounds(), x and y always correspond to the upper left corner of the sprite, regardless of how a sprite’s center is defined. This makes it different from sprite:moveTo(), where x and y honor the sprite’s defined center (by default, at a point 50% along the sprite’s width and height.)

 ]]
        playdate.graphics.sprite.setBounds(self._class, upper_left_x, upper_left_y, width, height)
    end
    function sprite.setBounds(self, rect)
        --[[ 
setBounds(rect) sets the bounds of the sprite with a playdate.geometry.rect object.

 ]]
        playdate.graphics.sprite.setBounds(self._class, rect)
    end
    function sprite.getBounds(self)
        --[[ 
getBounds() returns multiple values (x, y, width, height).

 ]]
        return playdate.graphics.sprite.getBounds(self._class)
    end
    function sprite.getBoundsRect(self)
        --[[ 
getBoundsRect() returns the sprite bounds as a playdate.geometry.rect object.

 ]]
        return playdate.graphics.sprite.getBoundsRect(self._class)
    end
    function sprite.setOpaque(self, flag)
        --[[ 
Marking a sprite opaque tells the sprite system that it doesn’t need to draw anything underneath the sprite, since it will be overdrawn anyway. If you set an image without a mask/alpha channel on the sprite, it automatically sets the opaque flag.

Setting a sprite to opaque can have performance benefits.

 ]]
        playdate.graphics.sprite.setOpaque(self._class, flag)
    end
    function sprite.isOpaque(self)
        --[[ 
Returns the sprite’s current opaque flag.
Drawing images alongside sprites

 ]]
        return playdate.graphics.sprite.isOpaque(self._class)
    end
    function sprite.setTilemap(self, tilemap)
        --[[ 
Sets the sprite’s contents to the given tilemap. Useful if you want to automate drawing of your tilemap, especially if interleaved by depth with other sprites being drawn.
Automatically animating sprites

While it is customary to move sprites around onscreen by calling sprite:moveTo(x, y) on successive playdate.update() calls, it is possible to automate animation behavior with the use of animators.

 ]]
        playdate.graphics.sprite.setTilemap(self._class, tilemap)
    end
    function sprite.setAnimator(self, animator, moveWithCollisions, removeOnCollision)
        --[[ 	You must import CoreLibs/sprites to use the setAnimator method.

setAnimator assigns an playdate.graphics.animator to the sprite, which will cause the sprite to automatically update its position each frame while the animator is active.

animator should be a playdate.graphics.animator created using playdate.geometry.points for its start and end values.

movesWithCollisions, if provided and true will cause the sprite to move with collisions. A collision rect must be set on the sprite prior to passing true for this argument.

removeOnCollision, if provided and true will cause the animator to be removed from the sprite when a collision occurs.
	setAnimator should be called only after any custom update method has been set on the sprite.

 ]]
        playdate.graphics.sprite.setAnimator(self._class, animator, moveWithCollisions, removeOnCollision)
    end
    function sprite.removeAnimator(self)
        --[[ 
Removes a playdate.graphics.animator assigned to the sprite
Example: Setting an animator on a sprite

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/animator"
import "CoreLibs/sprites"

-- We'll be demonstrating how to use an animator to animate a sprite
local square = playdate.graphics.image.new(20, 20, playdate.graphics.kColorBlack)
local squareSprite = playdate.graphics.sprite.new(square)
squareSprite:add()

-- 4000ms, or 4 seconds
local animationDuration = 4000
-- We're animating in a rectangle, around the screen. The animator must be animating along some geometry
-- or between two points if used on a sprite - just animating between two values will result in an error
local polygon = playdate.geometry.polygon.new(20, 20, 380, 20, 380, 220, 20, 220, 20, 20)
-- Setting an easing function to get a nice, smooth movement
local easingFunction = playdate.easingFunctions.inOutCubic
local animator = playdate.graphics.animator.new(animationDuration, polygon, easingFunction)

-- Setting the animator on the sprite to move it
squareSprite:setAnimator(animator)

function playdate.update()
    -- Everything is handled automatically, provided you call the sprite update function
    playdate.graphics.sprite.update()

    -- Set to and stays true on animation end - will print continuously when the animation finishes
    if animator:ended() then
        print("Animation ended!")
    end
end

Clipping

 ]]
        playdate.graphics.sprite.removeAnimator(self._class)
    end
    function sprite.setClipRect(self, x, y, width, height)
        --[[ 
 ]]
        playdate.graphics.sprite.setClipRect(self._class, x, y, width, height)
    end
    function sprite.setClipRect(self, rect)
        --[[ 
Sets the clipping rectangle for the sprite, using separate parameters or a playdate.geometry.rect object. Only areas within the rect will be drawn.

 ]]
        playdate.graphics.sprite.setClipRect(self._class, rect)
    end
    function sprite.clearClipRect(self)
        --[[ 
Clears the sprite’s current clipping rectangle.

 ]]
        playdate.graphics.sprite.clearClipRect(self._class)
    end
    function sprite.setStencilImage(self, stencil, tile)
        --[[ 
Specifies a stencil image to be set on the frame buffer before the sprite is drawn. If tile is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.

 ]]
        playdate.graphics.sprite.setStencilImage(self._class, stencil, tile)
    end
    function sprite.setStencilPattern(self, level, ditherType)
        --[[ 
Sets the sprite’s stencil to a dither pattern specified by level and optional ditherType (defaults to playdate.graphics.image.kDitherTypeBayer8x8).

 ]]
        playdate.graphics.sprite.setStencilPattern(self._class, level, ditherType)
    end
    function sprite.clearStencil(self)
        --[[ 
Clears the sprite’s stencil.
Drawing

 ]]
        playdate.graphics.sprite.clearStencil(self._class)
    end
    function sprite.markDirty(self)
        --[[ 
Marks the rect defined by the sprite’s current bounds as needing a redraw.

 ]]
        playdate.graphics.sprite.markDirty(self._class)
    end
    function sprite.setRedrawsOnImageChange(self, flag)
        --[[ 
By default, sprites are automatically marked for redraw when their image is changed via playdate.graphics.sprite:setImage(). If disabled by calling this function with a false argument, playdate.graphics.sprite.addDirtyRect() can be used to mark the (potentially smaller) area of the screen that needs to be redrawn.
Group operations

 ]]
        playdate.graphics.sprite.setRedrawsOnImageChange(self._class, flag)
    end
    function sprite.draw(self, x, y, width, height)
        --[[ 
If the sprite doesn’t have an image, the sprite’s draw function is called as needed to update the display. The rect passed in is the current dirty rect being updated by the display list. The rect coordinates passed in are relative to the sprite itself (i.e. x = 0, y = 0 refers to the top left corner of the sprite). Note that the callback is only called when the sprite is on screen and has a size specified via sprite:setSize() or sprite:setBounds().
Example: Overriding the sprite draw method

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"
import "CoreLibs/sprites"

local mySprite = playdate.graphics.sprite.new()
mySprite:moveTo(200, 120)
-- You MUST set a size first for anything to show up (either directly or by setting an image)
mySprite:setSize(30, 30)
mySprite:add()

-- The x, y, width, and height arguments refer to the dirty rect being updated, NOT the sprite dimensions
function mySprite:draw(x, y, width, height)
    -- Custom draw methods gives you more flexibility over what's drawn, but with the added benefits of sprites

    -- Here we're just modulating the circle radius over time
    local spriteWidth, spriteHeight = self:getSize()
    if not self.radius or self.radius > spriteWidth then
        self.radius = 0
    end
    self.radius += 1

    -- Drawing coordinates are relative to the sprite (e.g. (0, 0) is the top left of the sprite)
    playdate.graphics.fillCircleAtPoint(spriteWidth / 2, spriteHeight / 2, self.radius)
end

function playdate.update()
    -- Your custom draw method gets called here, but only if the sprite is dirty
    playdate.graphics.sprite.update()

    -- You might need to manually mark it dirty
    mySprite:markDirty()
end


 ]]
        playdate.graphics.sprite.draw(self._class, x, y, width, height)
    end
    function sprite.update(self)
        --[[ 
Called by playdate.graphics.sprite.update() (note the syntactic difference between the period and the colon) before sprites are drawn. Implementing :update() gives you the opportunity to perform some code upon every frame.
	The update method will only be called on sprites that have had add() called on them, and have their updates enabled.
	Be careful not confuse sprite:update() with sprite.update(): the latter updates all sprites; the former updates just the sprite being invoked.
Example: Overriding the sprite update method

local mySprite = playdate.graphics.sprite.new()
mySprite:moveTo(200, 120)
mySprite:add() -- Sprite needs to be added to get drawn and updated
-- mySprite:remove() will make it so the sprite stops getting drawn/updated

-- Option 1: override the update method using an anonymous function
mySprite.update = function(self)
    print("This gets called every frame when I'm added to the display list")
    -- Manipulate sprite using "self"
    print(self.x) -- Prints 200.0
    print(self.y) -- Prints 120.0
end

-- Option 2: override the update method using a function stored in a variable
local function mySpriteUpdate(self)
    print("This gets called every frame when I'm added to the display list")
    -- Manipulate sprite using "self"
    print(self.x) -- Prints 200.0
    print(self.y) -- Prints 120.0
end
mySprite.update = mySpriteUpdate

-- Option 3: override the update method by directly defining it
function mySprite:update()
    print("This gets called every frame when I'm added to the display list")
    -- Manipulate sprite using "self"
    print(self.x) -- Prints 200.0
    print(self.y) -- Prints 120.0
end

function playdate.update()
    -- Your custom update method gets called here every frame if the sprite has been added
    playdate.graphics.sprite.update()
end

-- VERY simplified psuedocode explanation of what's happening in sprite.update() (not real code)
local displayList = {} -- Added sprites are kept track of in a list
function playdate.graphics.sprite.update()
    -- The display list is iterated over
    for i=1, #displayList do
        local sprite = displayList[i]
        -- Checks if updates on the sprites are enabled
        if sprite:updatesEnabled() then
            -- The sprite update method is called
            sprite:update()
        end
        ...
        -- Redraw all of the dirty rects, handle collisions, etc.
    end
end

Sprite collision detection

The following functions are based on the bump.lua collision detection library. Some things to note:

    To participate in collisions, a sprite must have its collideRect set.

    Only handles axis-aligned bounding box (AABB) collisions.

    Handles tunneling — all items are treated as "bullets". The fact that we only use AABBs makes this fast.

    Centered on detection, but also offers some (minimal & basic) collision response.

Ideal for:

    Tile-based games, and games where most entities can be represented as axis-aligned rectangles.

    Games which require some physics but not a full realistic simulation, like a platformer.

    Examples of appropriate genres: top-down games (Zelda), shoot 'em ups, fighting games (Street Fighter), platformers (Super Mario).

Not a good match for:

    Games that require polygons for collision detection.

    Games that require highly realistic simulations of physics - things stacking up, rolling over slides, etc.

    Games that require very fast objects colliding realistically against each other (sprites here are moved and collided one at a time).

    Simulations where the order in which the collisions are resolved isn’t known.

Basic collision checking

 ]]
        playdate.graphics.sprite.update(self._class)
    end
    function sprite.setCollideRect(self, x, y, width, height)
        --[[ 
 ]]
        playdate.graphics.sprite.setCollideRect(self._class, x, y, width, height)
    end
    function sprite.setCollideRect(self, rect)
        --[[ 
setCollideRect() marks the area of the sprite, relative to its own internal coordinate system, to be checked for collisions with other sprites' collide rects. Note that the coordinate space is relative to the top-left corner of the bounds, regardless of where the sprite’s center/anchor is located.
	If you want to set the sprite’s collide rect to be the same size as the sprite itself, you can write sprite:setCollideRect( 0, 0, sprite:getSize() ).
	setCollideRect() must be invoked on a sprite in order to get it to participate in collisions.
	Very large sprites with very large collide rects should be avoided, as they will have a negative impact on performance and memory usage.

 ]]
        playdate.graphics.sprite.setCollideRect(self._class, rect)
    end
    function sprite.getCollideRect(self)
        --[[ 
Returns the sprite’s collide rect set with setCollideRect(). Return value is a playdate.geometry.rect.
	This function return coordinates relative to the sprite itself; the sprite’s position has no bearing on these values.

 ]]
        return playdate.graphics.sprite.getCollideRect(self._class)
    end
    function sprite.getCollideBounds(self)
        --[[ 
Returns the sprite’s collide rect as multiple values, (x, y, width, height).
	This function return coordinates relative to the sprite itself; the sprite’s position has no bearing on these values.

 ]]
        return playdate.graphics.sprite.getCollideBounds(self._class)
    end
    function sprite.clearCollideRect(self)
        --[[ 
Clears the sprite’s collide rect set with setCollideRect().

 ]]
        playdate.graphics.sprite.clearCollideRect(self._class)
    end
    function sprite.overlappingSprites(self)
        --[[ 
Returns an array of sprites that have collide rects that are currently overlapping the calling sprite’s collide rect, taking the sprites' groups and collides-with masks into consideration.

 ]]
        return playdate.graphics.sprite.overlappingSprites(self._class)
    end
    function sprite.alphaCollision(self, anotherSprite)
        --[[ 
Returns a boolean value set to true if a pixel-by-pixel comparison of the sprite images shows that non-transparent pixels are overlapping, based on the current bounds of the sprites.

This method may be used in conjunction with the standard collision architecture. Say, if overlappingSprites() or moveWithCollisions() report a collision of two sprite’s bounding rects, alphaCollision() could then be used to discern if a pixel-level collision occurred.

 ]]
        return playdate.graphics.sprite.alphaCollision(self._class, anotherSprite)
    end
    function sprite.setCollisionsEnabled(self, flag)
        --[[ 
The sprite’s collisionsEnabled flag (defaults to true) can be set to false in order to temporarily keep a sprite from colliding with any other sprite.

 ]]
        playdate.graphics.sprite.setCollisionsEnabled(self._class, flag)
    end
    function sprite.collisionsEnabled(self)
        --[[ 
Returns the sprite’s collisionsEnabled flag.
Restricting collisions

Collisions can be restricted using one of two methods: setting collision groups, or setting group masks. Groups are in fact just a simplified API for configuring group masks; they both operate on the same underlying architecture.
Collision groups

 ]]
        return playdate.graphics.sprite.collisionsEnabled(self._class)
    end
    function sprite.setGroups(self, groups)
        --[[ 
Adds the sprite to one or more collision groups. A group is a collection of sprites that exhibit similar collision behavior. (An example: in Atari’s Asteroids, asteroid sprites would all be added to the same group, while the player’s spaceship might be in a different group.) Use setCollidesWithGroups() to define which groups a sprite should collide with.

There are 32 groups, each defined by the integer 1 through 32. To add a sprite to only groups 1 and 3, for example, call mySprite:setGroups({1, 3}).

Alternatively, use setGroupMask() to set group membership via a bitmask.

 ]]
        playdate.graphics.sprite.setGroups(self._class, groups)
    end
    function sprite.setCollidesWithGroups(self, groups)
        --[[ 
Pass in a group number or an array of group numbers to specify which groups this sprite can collide with. Groups are numbered 1 through 32. Use setGroups() to specify which groups a sprite belongs to.

Alternatively, you can specify group collision behavior with a bitmask by using setCollidesWithGroupsMask().
Group masks

Sprites may be assigned to groups and define which groups they collide with as a method of filtering collisions. These groups are represented by two bitmasks on the sprites: a group bitmask, and a collides-with-groups bitmask. If sprite A’s collides-with-groups bitmask overlaps sprite B’s groups (a bitwise AND of the masks is not zero), or if no groups have been set (both masks are set to 0x00000000), a collision will happen when moving sprite A through sprite B. Convenience functions setGroups() and setCollidesWithGroups() exist to avoid the need to deal with bitmasks directly.

 ]]
        playdate.graphics.sprite.setCollidesWithGroups(self._class, groups)
    end
    function sprite.setGroupMask(self, mask)
        --[[ 
setGroupMask() sets the sprite’s group bitmask, which is 32 bits. In conjunction with the setCollidesWithGroupsMask() method, this controls which sprites can collide with each other.

For large group mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.

 ]]
        playdate.graphics.sprite.setGroupMask(self._class, mask)
    end
    function sprite.getGroupMask(self)
        --[[ 
getGroupMask() returns the integer value of the sprite’s group bitmask.

 ]]
        return playdate.graphics.sprite.getGroupMask(self._class)
    end
    function sprite.setCollidesWithGroupsMask(self, mask)
        --[[ 
Sets the sprite’s collides-with-groups bitmask, which is 32 bits. The mask specifies which other sprite groups this sprite can collide with. Sprites only collide if the moving sprite’s collidesWithGroupsMask matches at least one group of a potential collision sprite (i.e. a bitwise AND (&) between the moving sprite’s collidesWithGroupsMask and a potential collision sprite’s groupMask != zero) or if the moving sprite’s collidesWithGroupsMask and the other sprite’s groupMask are both set to 0x00000000 (the default values).

For large mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.

 ]]
        playdate.graphics.sprite.setCollidesWithGroupsMask(self._class, mask)
    end
    function sprite.getCollidesWithGroupsMask(self)
        --[[ 
Returns the integer value of the sprite’s collision bitmask.

 ]]
        return playdate.graphics.sprite.getCollidesWithGroupsMask(self._class)
    end
    function sprite.resetGroupMask(self)
        --[[ 
Resets the sprite’s group mask to 0x00000000.

 ]]
        playdate.graphics.sprite.resetGroupMask(self._class)
    end
    function sprite.resetCollidesWithGroupsMask(self)
        --[[ 
Resets the sprite’s collides-with-groups mask to 0x00000000.
Advanced Collisions

 ]]
        playdate.graphics.sprite.resetCollidesWithGroupsMask(self._class)
    end
    function sprite.moveWithCollisions(self, goalX, goalY)
        --[[ 
 ]]
        playdate.graphics.sprite.moveWithCollisions(self._class, goalX, goalY)
    end
    function sprite.moveWithCollisions(self, goalPoint)
        --[[ 
Moves the sprite towards goalX, goalY or goalPoint taking collisions into account, which means the sprite’s final position may not be the same as goalX, goalY or goalPoint.

Returns actualX, actualY, collisions, length.

actualX, actualY


the final position of the sprite. If no collisions occurred, this will be the same as goalX, goalY.

collisions


an array of userdata objects containing information about all collisions that occurred. Each item in the array contains values for the following indices:

- sprite: The sprite being moved.

- other: The sprite colliding with the sprite being moved.

- type: The result of collisionResponse.

- overlaps: Boolean. True if the sprite was overlapping other when the collision started. False if it didn’t overlap but tunneled through other.

- ti: A number between 0 and 1 indicating how far along the movement to the goal the collision occurred.

- move: playdate.geometry.vector2D. The difference between the original coordinates and the actual ones when the collision happened.

- normal: playdate.geometry.vector2D. The collision normal; usually -1, 0, or 1 in x and y. Use this value to determine things like if your character is touching the ground.

- touch: playdate.geometry.point. The coordinates where the sprite started touching other.

- spriteRect: playdate.geometry.rect. The rectangle the sprite occupied when the touch happened.

- otherRect: playdate.geometry.rect. The rectangle other occupied when the touch happened.

If the collision type was playdate.graphics.sprite.kCollisionTypeBounce the table also contains bounce, a playdate.geometry.point indicating the coordinates to which the sprite attempted to bounce (could be different than actualX, actualY if further collisions occurred).

If the collision type was playdate.graphics.sprite.kCollisionTypeSlide the table also contains slide, a playdate.geometry.point indicating the coordinates to which the sprite attempted to slide.

length


the length of the collisions array, equal to #collisions

Note that the collision info items are only valid until the next call of moveWithCollisions or checkCollisions. To save collision information for later, the data should be copied out of the collision info userdata object.

See also checkCollisions() to check for collisions without actually moving the sprite.
Example: Using moveWithCollisions for a simple player collision example

-- You can copy and paste this example directly as your main.lua file to see it in action
import "CoreLibs/graphics"
import "CoreLibs/sprites"

-- Creating a tags object, to keep track of tags more easily
TAGS = {
    player = 1,
    obstacle = 2,
    coin = 3,
    powerUp = 4
}

-- Creating a player sprite we can move around and collide things with
local playerImage = playdate.graphics.image.new(20, 20)

 ]]
        return playdate.graphics.sprite.moveWithCollisions(self._class, goalPoint)
    end
    function sprite.checkCollisions(self, x, y)
        --[[ 
 ]]
        playdate.graphics.sprite.checkCollisions(self._class, x, y)
    end
    function sprite.checkCollisions(self, point)
        --[[ 
Returns the same values as moveWithCollisions() but does not actually move the sprite.

 ]]
        return playdate.graphics.sprite.checkCollisions(self._class, point)
    end
    function sprite.collisionResponse(self, other)
        --[[ 
A callback that can be defined on a sprite to control the type of collision response that should happen when a collision with other occurs. This callback should return one of the following four values:

    playdate.graphics.sprite.kCollisionTypeSlide: Use for collisions that should slide over other objects, like Super Mario does over a platform or the ground.

    playdate.graphics.sprite.kCollisionTypeFreeze: Use for collisions where the sprite should stop moving as soon as it collides with other, such as an arrow hitting a wall.

    playdate.graphics.sprite.kCollisionTypeOverlap: Use for collisions in which you want to know about the collision but it should not impact the movement of the sprite, such as when collecting a coin.

    playdate.graphics.sprite.kCollisionTypeBounce: Use when the sprite should move away from other, like the ball in Pong or Arkanoid.

The strings "slide", "freeze", "overlap", and "bounce" can be used instead of the constants.

Feel free to return different values based on the value of other. For example, if other is a wall sprite, you may want to return "slide" or "bounce", but if it’s a coin you might return "overlap".

If the callback is not present, or returns nil, kCollisionTypeFreeze is used.
	Instead of defining a callback, the collisionResponse property of a sprite can be set directly to one of the four collision response types. This will be faster, as the lua function will not need to be called, but does not allow for dynamic behavior.

This method should not attempt to modify the sprites in any way. While it might be tempting to deal with collisions here, doing so will have unexpected and undesirable results. Instead, this function should return one of the collision response values as quickly as possible. If sprites need to be modified as the result of a collision, do so elsewhere, such as by inspecting the list of collisions returned by moveWithCollisions().

 ]]
        return playdate.graphics.sprite.collisionResponse(self._class, other)
    end
    return sprite
end, {})
local font = class(function(font)
    function font.__init__(self, path)
        --[[ 
Returns a playdate.graphics.font object from the data at path. If there is no file at path, the function returns nil.

 ]]
        self._class = playdate.graphics.font.new(path)
    end
    function font.drawText(self, text, x, y, width, height, leadingAdjustment, wrapMode, alignment)
        --[[ 
 ]]
        playdate.graphics.font.drawText(self._class, text, x, y, width, height, leadingAdjustment, wrapMode, alignment)
    end
    function font.drawText(self, text, rect, leadingAdjustment, wrapMode, alignment)
        --[[ 
Draws a string at the specified x, y coordinate using this particular font instance. (Compare to playdate.graphics.drawText(text, x, y), which draws the string with whatever the "current font" is, as defined by playdate.graphics.setFont(font)).

If width and height are specified, drawing is constrained to the rectangle (x,y,width,height), using the given wrapMode and alignment if provided. Alternatively, a playdate.geometry.rect object can be passed instead of x,y,width,height. Valid values for wrapMode are

    playdate.graphics.kWrapClip

    playdate.graphics.kWrapCharacter

    playdate.graphics.kWrapWord

and values for alignment are

    playdate.graphics.kAlignLeft

    playdate.graphics.kAlignCenter

    playdate.graphics.kAlignRight

The default wrap mode is playdate.graphics.kWrapWord and the default alignment is playdate.graphics.kAlignLeft.

The optional leadingAdjustment may be used to modify the spacing between lines of text.

The function returns two numbers indicating the width and height of the drawn text.
	font:drawText() does not support inline styles like bold and italics. Instead use playdate.graphics.drawText().

 ]]
        return playdate.graphics.font.drawText(self._class, text, rect, leadingAdjustment, wrapMode, alignment)
    end
    function font.drawTextAligned(self, text, x, y, alignment, leadingAdjustment)
        --[[ 	You must import CoreLibs/graphics to use this function.

Draws the string text aligned to the left, right, or centered on the x coordinate. Pass one of kTextAlignment.left, kTextAlignment.center, kTextAlignment.right for the alignment parameter. (Compare to playdate.graphics.drawTextAligned(text, x, y, alignment), which draws the string with the "current font", as defined by playdate.graphics.setFont(font)).

 ]]
        playdate.graphics.font.drawTextAligned(self._class, text, x, y, alignment, leadingAdjustment)
    end
    function font.getHeight(self)
        --[[ 
Returns the pixel height of this font.

 ]]
        return playdate.graphics.font.getHeight(self._class)
    end
    function font.getTextWidth(self, text)
        --[[ 
Returns the pixel width of the text when rendered with this font.

 ]]
        return playdate.graphics.font.getTextWidth(self._class, text)
    end
    function font.setTracking(self, pixels)
        --[[ 
Sets the tracking of this font (spacing between letters), in pixels.

Equivalent to playdate->graphics->setTextTracking() in the C API.

 ]]
        playdate.graphics.font.setTracking(self._class, pixels)
    end
    function font.getTracking(self)
        --[[ 
Returns the tracking of this font (spacing between letters), in pixels.

Equivalent to playdate->graphics->getTextTracking() in the C API.

 ]]
        return playdate.graphics.font.getTracking(self._class)
    end
    function font.setLeading(self, pixels)
        --[[ 
Sets the leading (spacing between lines) of this font, in pixels.

Equivalent to playdate->graphics->setTextLeading() in the C API.

 ]]
        playdate.graphics.font.setLeading(self._class, pixels)
    end
    function font.getLeading(self)
        --[[ 
Returns the leading (spacing between lines) of this font, in pixels.

 ]]
        return playdate.graphics.font.getLeading(self._class)
    end
    function font.getGlyph(self, character)
        --[[ 
Returns the playdate.graphics.image containing the requested glyph. character can either be a string or a unicode codepoint number.
Drawing Text

 ]]
        return playdate.graphics.font.getGlyph(self._class, character)
    end
    return font
end, {})
local video = class(function(video)
    function video.__init__(self, path)
        --[[ 
Returns a playdate.graphics.video object from the pdv file at path. If the file at path can’t be opened, the function returns nil.

 ]]
        self._class = playdate.graphics.video.new(path)
    end
    function video.getSize(self)
        --[[ 
Returns the width and height of the video as multiple vlaues (width, height).

 ]]
        return playdate.graphics.video.getSize(self._class)
    end
    function video.getFrameCount(self)
        --[[ 
Returns the number of frames in the video.

 ]]
        return playdate.graphics.video.getFrameCount(self._class)
    end
    function video.getFrameRate(self)
        --[[ 
Returns the number of frames per second of the video source. This number is simply for record-keeping, it is not used internally—​the game code is responsible for figuring out which frame to show when.

 ]]
        return playdate.graphics.video.getFrameRate(self._class)
    end
    function video.setContext(self, image)
        --[[ 
Sets the given image to the video render context. Future video:renderFrame() calls will draw into this image.

 ]]
        playdate.graphics.video.setContext(self._class, image)
    end
    function video.getContext(self)
        --[[ 
Returns the image into which the video will be rendered, creating it if needed.

 ]]
        return playdate.graphics.video.getContext(self._class)
    end
    function video.useScreenContext(self)
        --[[ 
Sets the display framebuffer as the video’s render context.

 ]]
        playdate.graphics.video.useScreenContext(self._class)
    end
    function video.renderFrame(self, number)
        --[[ 
Draws the given frame into the video’s render context.
7.21. JSON

Provides encoding and decoding of JSON files and strings.
json.decode(string)

Takes the JSON encoded string and converts it to a Lua table.

Equivalent to playdate->json->decode() in the C API.
json.decodeFile(file)
json.decodeFile(path)

Reads the given playdate.file.file object or the file at the given path and converts it to a Lua table.
json.encode(table)

Returns a string containing the JSON representation of the passed-in Lua table.
json.encodePretty(table)

Returns a string containing the JSON representation of a Lua table, with human-readable formatting.
json.encodeToFile(file, [pretty], table)
json.encodeToFile(path, [pretty], table)

Encodes the Lua table table to JSON and writes it to the given playdate.file.file object or the given path. If pretty is true, the output is formatted to make it human-readable. Otherwise, no additional whitespace is added.
	For a very simple way to serialize a table to a file, see playdate.datastore.
7.22. Keyboard

An on-screen keyboard that can be used for text entry.
	You must import CoreLibs/keyboard to use these functions.
	Keyboard is only designed to work at 1x display scale, and will not work well at other scale factors.

 ]]
        return playdate.graphics.video.renderFrame(self._class, number)
    end
    return video
end, {})
local graph = class(function(graph)
    function graph.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new empty playdate.pathfinder.graph object.

If nodeCount is supplied, that number of nodes will be allocated and added to the graph. Their IDs will be set from 1 to nodeCount.

coordinates, if supplied, should be a table containing tables of x, y values, indexed by node IDs. For example, {{10, 10}, {50, 30}, {20, 100}, {100, 120}, {160, 130}}.

 ]]
        self._class = playdate.pathfinder.graph.new(unpack(args))
    end
    function graph.addNewNode(self, id, x, y, connectedNodes, weights, addReciprocalConnections)
        --[[ 
Creates a new playdate.pathfinder.node and adds it to the graph.

    id: id value for the new node.

    x: Optional x value for the node.

    y: Optional y value for the node.

    connectedNodes: Array of existing nodes to create connections to from the new node.

    weights: Array of weights for the new connections. Array must be the same length as connectedNodes. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.

    addReciprocalConnections: If true, connections will also be added in the reverse direction for each node.


 ]]
        playdate.pathfinder.graph.addNewNode(self._class, id, x, y, connectedNodes, weights, addReciprocalConnections)
    end
    function graph.addNewNodes(self, count)
        --[[ 
Creates count new nodes, adding them to the graph, and returns them in an array-style table. The new node’s id_s will be assigned values 1 through _count-1.

This method is useful to improve performance if many nodes need to be allocated at once rather than one at a time, for example when creating a new graph.

 ]]
        return playdate.pathfinder.graph.addNewNodes(self._class, count)
    end
    function graph.addNode(self, node, connectedNodes, weights, addReciprocalConnections)
        --[[ 
Adds an already-existing node to the graph. The node must have originally belonged to the same graph.

    node: Node to be added to the graph.

    connectedNodes: Array of existing nodes to create connections to from the new node.

    weights: Array of weights for the new connections. Array must be the same length as connectedNodes. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.

    addReciprocalConnections: If true, connections will also be added in the reverse direction for each connection added.


 ]]
        playdate.pathfinder.graph.addNode(self._class, node, connectedNodes, weights, addReciprocalConnections)
    end
    function graph.addNodes(self, nodes)
        --[[ 
Adds an array of already-existing nodes to the graph.

 ]]
        playdate.pathfinder.graph.addNodes(self._class, nodes)
    end
    function graph.allNodes(self)
        --[[ 
Returns an array containing all nodes in the graph.

 ]]
        return playdate.pathfinder.graph.allNodes(self._class)
    end
    function graph.removeNode(self, node)
        --[[ 
Removes node from the graph. Also removes all connections to and from the node.

 ]]
        playdate.pathfinder.graph.removeNode(self._class, node)
    end
    function graph.removeNodeWithXY(self, x, y)
        --[[ 
Returns the first node found with coordinates matching x, y, after removing it from the graph and removing all connections to and from the node.

 ]]
        return playdate.pathfinder.graph.removeNodeWithXY(self._class, x, y)
    end
    function graph.removeNodeWithID(self, id)
        --[[ 
Returns the first node found with a matching id, after removing it from the graph and removing all connections to and from the node.

 ]]
        return playdate.pathfinder.graph.removeNodeWithID(self._class, id)
    end
    function graph.nodeWithID(self, id)
        --[[ 
Returns the first node found in the graph with a matching id, or nil if no such node is found.

 ]]
        return playdate.pathfinder.graph.nodeWithID(self._class, id)
    end
    function graph.nodeWithXY(self, x, y)
        --[[ 
Returns the first node found in the graph with matching x and y values, or nil if no such node is found.

 ]]
        return playdate.pathfinder.graph.nodeWithXY(self._class, x, y)
    end
    function graph.addConnections(self, connections)
        --[[ 
connections should be a table of array-style tables. The keys of the outer table should correspond to node IDs, while the inner array should be a series if connecting node ID and weight combinations that will be assigned to that node. For example, {[1]={2, 10, 3, 12}, [2]={1, 20}, [3]={1, 20, 2, 10}} will create a connection from node ID 1 to node ID 2 with a weight of 10, and a connection to node ID 3 with a weight of 12, and so on for the other entries.

 ]]
        playdate.pathfinder.graph.addConnections(self._class, connections)
    end
    function graph.addConnectionToNodeWithID(self, fromNodeID, toNodeID, weight, addReciprocalConnection)
        --[[ 
Adds a connection from the node with id fromNodeID to the node with id toNodeID with a weight value of weight. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available. If addReciprocalConnection is true, the reverse connection will also be added.

 ]]
        playdate.pathfinder.graph.addConnectionToNodeWithID(self._class, fromNodeID, toNodeID, weight, addReciprocalConnection)
    end
    function graph.removeAllConnections(self)
        --[[ 
Removes all connections from all nodes in the graph.

 ]]
        playdate.pathfinder.graph.removeAllConnections(self._class)
    end
    function graph.removeAllConnectionsFromNodeWithID(self, id, removeIncoming)
        --[[ 
Removes all connections from the matching node.

If removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).

 ]]
        playdate.pathfinder.graph.removeAllConnectionsFromNodeWithID(self._class, id, removeIncoming)
    end
    function graph.findPath(self, startNode, goalNode, heuristicFunction, findPathToGoalAdjacentNodes)
        --[[ 
Returns an array of nodes representing the path from startNode to goalNode, or nil if no path can be found.

    heuristicFunction: If provided, this function should be of the form function(startNode, goalNode) and should return an integer value estimate or underestimate of the distance from startNode to goalNode. If not provided, a manhattan distance function will be used to calculate the estimate. This requires that the x, y values of the nodes in the graph have been set properly.

    findPathToGoalAdjacentNodes: If true, a path will be found to any node adjacent to the goal node, based on the x, y values of those nodes and the goal node. This does not rely on connections between adjacent nodes and the goal node, which can be entirely disconnected from the rest of the graph.


 ]]
        return playdate.pathfinder.graph.findPath(self._class, startNode, goalNode, heuristicFunction, findPathToGoalAdjacentNodes)
    end
    function graph.findPathWithIDs(self, startNodeID, goalNodeID, heuristicFunction, findPathToGoalAdjacentNodes)
        --[[ 
Works the same as findPath, but looks up nodes to find a path between using startNodeID and goalNodeID and returns a list of nodeIDs rather than the nodes themselves.

 ]]
        return playdate.pathfinder.graph.findPathWithIDs(self._class, startNodeID, goalNodeID, heuristicFunction, findPathToGoalAdjacentNodes)
    end
    function graph.setXYForNodeWithID(self, id, x, y)
        --[[ 
Sets the matching node’s x and y values.
Node

You can directly read or write x, y and id values on a playdate.pathfinder.node.

 ]]
        playdate.pathfinder.graph.setXYForNodeWithID(self._class, id, x, y)
    end
    function graph.addConnection(self, node, weight, addReciprocalConnection)
        --[[ 
Adds a new connection between nodes.

    node: The node the new connection will point to.

    weight: Weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.

    addReciprocalConnection: If true, a second connection will be created with the same weight in the opposite direction.


 ]]
        playdate.pathfinder.node.addConnection(self._class, node, weight, addReciprocalConnection)
    end
    function graph.addConnections(self, nodes, weights, addReciprocalConnections)
        --[[ 
Adds a new connection to each node in the nodes array.

    nodes: An array of nodes which the new connections will point to.

    weights: An array of weights for the new connections. Must be of the same length as the nodes array. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.

    addReciprocalConnections: If true, connections will also be added in the reverse direction for each node.


 ]]
        playdate.pathfinder.node.addConnections(self._class, nodes, weights, addReciprocalConnections)
    end
    function graph.addConnectionToNodeWithXY(self, x, y, weight, addReciprocalConnection)
        --[[ 
Adds a connection to the first node found with matching x and y values, if it exists.

    weight: The weight for the new connection. Weights affect the path the A* algorithm will solve for. A longer, lighter-weighted path will be chosen over a shorter heavier path, if available.

    addReciprocalConnections: If true, a connection will also be added in the reverse direction, from the node at x, y to the caller.


 ]]
        playdate.pathfinder.node.addConnectionToNodeWithXY(self._class, x, y, weight, addReciprocalConnection)
    end
    function graph.connectedNodes(self)
        --[[ 
Returns an array of nodes that have been added as connections to this node.

 ]]
        return playdate.pathfinder.node.connectedNodes(self._class)
    end
    function graph.removeConnection(self, node, removeReciprocal)
        --[[ 
Removes a connection to node, if it exists. If removeReciprocal is true the reverse connection will also be removed, if it exists.

 ]]
        playdate.pathfinder.node.removeConnection(self._class, node, removeReciprocal)
    end
    function graph.removeAllConnections(self, removeIncoming)
        --[[ 
Removes all connections from the calling node.

If removeIncoming is true, all connections from other nodes to the calling node are also removed. False by default. Please note: this can signficantly increase the time this function takes as it requires a full search of the graph - O(1) vs O(n)).

 ]]
        playdate.pathfinder.node.removeAllConnections(self._class, removeIncoming)
    end
    function graph.setXY(self, x, y)
        --[[ 
Sets the x and y values for the node.
7.25. Power

 ]]
        playdate.pathfinder.node.setXY(self._class, x, y)
    end
    return graph
end, {})
local sampleplayer = class(function(sampleplayer)
    function sampleplayer.__init__(self, path)
        --[[ 
Returns a new playdate.sound.sampleplayer object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.

 ]]
        self._class = playdate.sound.sampleplayer.new(path)
    end
    return sampleplayer
end, {})
local sampleplayer = class(function(sampleplayer)
    function sampleplayer.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.sound.sampleplayer object for playing the given sample.

 ]]
        self._class = playdate.sound.sampleplayer.new(unpack(args))
    end
    function sampleplayer.copy(self)
        --[[ 
Returns a new playdate.sound.sampleplayer with the same sample, volume, and rate as the given sampleplayer.

 ]]
        return playdate.sound.sampleplayer.copy(self._class)
    end
    function sampleplayer.play(self, repeatCount, rate)
        --[[ 
Starts playing the sample. If repeatCount is greater than one, it loops the given number of times. If zero, it loops endlessly until it is stopped with playdate.sound.sampleplayer:stop(). If rate is set, the sample will be played at the given rate instead of the rate previous set with playdate.sound.sampleplayer.setRate().

 ]]
        playdate.sound.sampleplayer.play(self._class, repeatCount, rate)
    end
    function sampleplayer.playAt(self, when, vol, rightvol, rate)
        --[[ 
Schedules the sound for playing at device time when. If vol is specified, the sample will be played at level vol (with optional separate right channel volume rightvol), otherwise it plays at the volume set by playdate.sound.sampleplayer.setVolume(). Note that the when argument is an offset in the audio device’s time scale, as returned by playdate.sound.getCurrentTime(); it is not relative to the current time! If when is less than the current audio time, the sample is played immediately. If rate is set, the sample will be played at the given rate instead of the rate previously set with playdate.sound.sampleplayer.setRate().

Only one event can be queued at a time. If playAt() is called while another event is queued, it will overwrite it with the new values.

The function returns true if the sample was successfully added to the sound channel, otherwise false (i.e., if the channel is full).

 ]]
        return playdate.sound.sampleplayer.playAt(self._class, when, vol, rightvol, rate)
    end
    function sampleplayer.setVolume(self, left, right)
        --[[ 
Sets the playback volume (0.0 - 1.0) for left and right channels. If the optional right argument is omitted, it is the same as left. If the sampleplayer is currently playing using the default volume (that is, it wasn’t triggered by playAt() with a volume given) it also changes the volume of the playing sample.

 ]]
        playdate.sound.sampleplayer.setVolume(self._class, left, right)
    end
    function sampleplayer.getVolume(self)
        --[[ 
Returns the playback volume for the sampleplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.

 ]]
        return playdate.sound.sampleplayer.getVolume(self._class)
    end
    function sampleplayer.setLoopCallback(self, callback, arg)
        --[[ 
Sets a function to be called every time the sample loops. The sample object is passed to this function as the first argument, and the optional arg argument is passed as the second.

 ]]
        playdate.sound.sampleplayer.setLoopCallback(self._class, callback, arg)
    end
    function sampleplayer.setPlayRange(self, start, _end)
        --[[ 
Sets the range of the sample to play. start and end are frame offsets from the beginning of the sample.

 ]]
        playdate.sound.sampleplayer.setPlayRange(self._class, start, _end)
    end
    function sampleplayer.setPaused(self, flag)
        --[[ 
Pauses or resumes playback.

 ]]
        playdate.sound.sampleplayer.setPaused(self._class, flag)
    end
    function sampleplayer.isPlaying(self)
        --[[ 
Returns a boolean indicating whether the sample is playing.

 ]]
        return playdate.sound.sampleplayer.isPlaying(self._class)
    end
    function sampleplayer.stop(self)
        --[[ 
Stops playing the sample.

 ]]
        playdate.sound.sampleplayer.stop(self._class)
    end
    function sampleplayer.setFinishCallback(self, func, arg)
        --[[ 
Sets a function to be called when playback has completed. The sample object is passed to this function as the first argument, and the optional arg argument is passed as the second.

 ]]
        playdate.sound.sampleplayer.setFinishCallback(self._class, func, arg)
    end
    function sampleplayer.setSample(self, sample)
        --[[ 
Sets the sample to be played.

 ]]
        playdate.sound.sampleplayer.setSample(self._class, sample)
    end
    function sampleplayer.getSample(self)
        --[[ 
Gets the sample to be played.

 ]]
        playdate.sound.sampleplayer.getSample(self._class)
    end
    function sampleplayer.getLength(self)
        --[[ 
Returns the length of the sampleplayer’s sample, in seconds. Length is not scaled by playback rate.

 ]]
        return playdate.sound.sampleplayer.getLength(self._class)
    end
    function sampleplayer.setRate(self, rate)
        --[[ 
Sets the playback rate for the sample. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Sampleplayers can also play samples backwards, by setting a negative rate; note, however, this does not work with ADPCM-encoded files.

 ]]
        playdate.sound.sampleplayer.setRate(self._class, rate)
    end
    function sampleplayer.getRate(self)
        --[[ 
Returns the playback rate for the sample.

 ]]
        return playdate.sound.sampleplayer.getRate(self._class)
    end
    function sampleplayer.setRateMod(self, signal)
        --[[ 
Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.sampleplayer:setRate(). Set to nil to clear the modulator.

 ]]
        playdate.sound.sampleplayer.setRateMod(self._class, signal)
    end
    function sampleplayer.setOffset(self, seconds)
        --[[ 
Sets the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.

 ]]
        playdate.sound.sampleplayer.setOffset(self._class, seconds)
    end
    function sampleplayer.getOffset(self)
        --[[ 
Returns the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.
Fileplayer

The fileplayer class is used for streaming audio from a file on disk. This requires less memory than keeping all of the file’s data in memory (as with the sampleplayer), but can increase overhead at run time.
	Fileplayer can play MP3 files, but MP3 decoding is CPU-intensive. For a balance of good performance and small file size, we recommend encoding audio into ADPCM .wav files.

 ]]
        return playdate.sound.sampleplayer.getOffset(self._class)
    end
    return sampleplayer
end, {})
local fileplayer = class(function(fileplayer)
    function fileplayer.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a fileplayer object, which can stream samples from disk. The file to play is set with the playdate.sound.fileplayer:load() function.

If given, buffersize specifies the size in seconds of the fileplayer’s data buffer. A shorter value reduces the latency of a playdate.sound.fileplayer:setOffset() call, but increases the chance of a buffer underrun.

 ]]
        self._class = playdate.sound.fileplayer.new(unpack(args))
    end
    return fileplayer
end, {})
local fileplayer = class(function(fileplayer)
    function fileplayer.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a fileplayer object for streaming samples from the file at path. Note that the file isn’t loaded until playdate.sound.fileplayer:play() or playdate.sound.fileplayer:setBufferSize() is called, in order to reduce initialization overhead.

If given, buffersize specifies the size in seconds of the fileplayer’s data buffer. A shorter value reduces the latency of a playdate.sound.fileplayer:setOffset() call, but increases the chance of a buffer underrun.

 ]]
        self._class = playdate.sound.fileplayer.new(unpack(args))
    end
    function fileplayer.load(self, path)
        --[[ 
Instructs the fileplayer to load the file at path when play() is called on it. The fileplayer must not be playing when this function is called. The fileplayer’s play offset is reset to the beginning of the file, and its loop range is cleared.

 ]]
        playdate.sound.fileplayer.load(self._class, path)
    end
    function fileplayer.play(self, repeatCount)
        --[[ 
Opens and starts playing the file, first creating and filling a 1/4 second playback buffer if a buffer size hasn’t been set yet.

If repeatCount is set, playback repeats when it reaches the end of the file or the end of the loop range if one is set. After the loop has run repeatCount times, it continues playing to the end of the file. A repeatCount of zero loops endlessly. If repeatCount is not set, the file plays once.

The function returns true if the file was successfully opened and the fileplayer added to the sound channel, otherwise false and a string describing the error.

 ]]
        return playdate.sound.fileplayer.play(self._class, repeatCount)
    end
    function fileplayer.stop(self)
        --[[ 
Stops playing the file, resets the playback offset to zero, and calls the finish callback.

 ]]
        playdate.sound.fileplayer.stop(self._class)
    end
    function fileplayer.pause(self)
        --[[ 
Stops playing the file. A subsequent play() call resumes playback from where it was paused.

 ]]
        playdate.sound.fileplayer.pause(self._class)
    end
    function fileplayer.isPlaying(self)
        --[[ 
Returns a boolean indicating whether the fileplayer is playing.

 ]]
        return playdate.sound.fileplayer.isPlaying(self._class)
    end
    function fileplayer.getLength(self)
        --[[ 
Returns the length, in seconds, of the audio file.

 ]]
        return playdate.sound.fileplayer.getLength(self._class)
    end
    function fileplayer.setFinishCallback(self, func, arg)
        --[[ 
Sets a function to be called when playback has completed. The fileplayer is passed as the first argument to func. The optional argument arg is passed as the second.

 ]]
        playdate.sound.fileplayer.setFinishCallback(self._class, func, arg)
    end
    function fileplayer.didUnderrun(self)
        --[[ 
Returns the fileplayer’s underrun flag, indicating that the player ran out of data. This can be checked in the finish callback function to check for an underrun error.

 ]]
        return playdate.sound.fileplayer.didUnderrun(self._class)
    end
    function fileplayer.setStopOnUnderrun(self, flag)
        --[[ 
By default, the fileplayer stops playback if it can’t provide data fast enough. Setting the flag to false tells the fileplayer to restart playback (after an audible stutter) as soon as data is available.

 ]]
        playdate.sound.fileplayer.setStopOnUnderrun(self._class, flag)
    end
    function fileplayer.setLoopRange(self, start, _end, loopCallback, arg)
        --[[ 
Provides a way to loop a portion of an audio file. In the following code:

local fp = playdate.sound.fileplayer.new( "myaudiofile" )
fp:setLoopRange( 10, 20 )
fp:play( 3 )

…the fileplayer will start playing from the beginning of the audio file, loop the 10-20 second range three times, and then stop playing.

start and end are specified in seconds. If end is omitted, the end of the file is used. If the function loopCallback is provided, it is called every time the player loops, with the fileplayer as the first argument and the optional arg argument as the second.
	The fileplayer:play([repeatCount]) call needs to be invoked with a repeatCount value of 0 (infinite looping), or 2 or greater in order for the looping action to happen.

 ]]
        playdate.sound.fileplayer.setLoopRange(self._class, start, _end, loopCallback, arg)
    end
    function fileplayer.setLoopCallback(self, callback, arg)
        --[[ 
Sets a function to be called every time the fileplayer loops. The fileplayer object is passed to this function as the first argument, and arg as the second.
	The fileplayer:play([repeatCount]) call needs to be invoked with a repeatCount value of 0 (infinite looping), or 2 or greater in order for the loop callback to be invoked.

 ]]
        playdate.sound.fileplayer.setLoopCallback(self._class, callback, arg)
    end
    function fileplayer.setBufferSize(self, seconds)
        --[[ 
Sets the buffer size for the fileplayer, in seconds. Larger buffers protect against buffer underruns, but consume more memory. Calling this function also fills the output buffer if a source file has been set. On success, the function returns true; otherwise it returns false and a string describing the error.

 ]]
        return playdate.sound.fileplayer.setBufferSize(self._class, seconds)
    end
    function fileplayer.setRate(self, rate)
        --[[ 
Sets the playback rate for the file. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Unlike sampleplayers, fileplayers can’t play in reverse (i.e., rate < 0).

 ]]
        playdate.sound.fileplayer.setRate(self._class, rate)
    end
    function fileplayer.getRate(self)
        --[[ 
Returns the playback rate for the file. as set with setRate().

 ]]
        return playdate.sound.fileplayer.getRate(self._class)
    end
    function fileplayer.setRateMod(self, signal)
        --[[ 
Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.fileplayer:setRate(). Set to nil to clear the modulator.

 ]]
        playdate.sound.fileplayer.setRateMod(self._class, signal)
    end
    function fileplayer.setVolume(self, left, right, fadeSeconds, fadeCallback, arg)
        --[[ 
Sets the playback volume (0.0 - 1.0). If a single value is passed in, both left side and right side volume are set to the given value. If two values are given, volumes are set separately. The optional fadeSeconds specifies the time it takes to fade from the current volume to the specified volume, in seconds. If the function fadeCallback is given, it is called when the volume fade has completed. The fileplayer object is passed as the first argument to the callback, and the optional arg argument is passed as the second.

 ]]
        playdate.sound.fileplayer.setVolume(self._class, left, right, fadeSeconds, fadeCallback, arg)
    end
    function fileplayer.getVolume(self)
        --[[ 
Returns the current volume for the fileplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.

 ]]
        return playdate.sound.fileplayer.getVolume(self._class)
    end
    function fileplayer.setOffset(self, seconds)
        --[[ 
Sets the current offset of the fileplayer, in seconds. This value is not adjusted for rate.

 ]]
        playdate.sound.fileplayer.setOffset(self._class, seconds)
    end
    function fileplayer.getOffset(self)
        --[[ 
Returns the current offset of the fileplayer, in seconds. This value is not adjusted for rate.
Sample


 ]]
        return playdate.sound.fileplayer.getOffset(self._class)
    end
    return fileplayer
end, {})
local sample = class(function(sample)
    function sample.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.sound.sample object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.

 ]]
        self._class = playdate.sound.sample.new(unpack(args))
    end
    return sample
end, {})
local sample = class(function(sample)
    function sample.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.sound.sample object, with a buffer size of seconds in the given format. If format is not specified, it defaults to playdate.sound.kFormat16bitStereo. When used with playdate.sound.sample:load(), this allows you to swap in a different sample without re-allocating the buffer, which could lead to memory fragmentation.

 ]]
        self._class = playdate.sound.sample.new(unpack(args))
    end
    function sample.getSubsample(self, startOffset, endOffset)
        --[[ 
Returns a new subsample containing a subrange of the given sample. Offset values are in frames, not bytes.

 ]]
        return playdate.sound.sample.getSubsample(self._class, startOffset, endOffset)
    end
    function sample.load(self, path)
        --[[ 
Loads the sound data from the file at path into an existing sample buffer. If there is no file at path, the function returns nil.

 ]]
        return playdate.sound.sample.load(self._class, path)
    end
    function sample.decompress(self)
        --[[ 
If the sample is ADPCM compressed, decompresses the sample data to 16-bit PCM data. This increases the sample’s memory footprint by 4x and does not affect the quality in any way, but it is necessary if you want to use the sample in a synth or play the file backwards. Returns true if successful, or false and an error message as a second return value if decompression failed.

 ]]
        return playdate.sound.sample.decompress(self._class)
    end
    function sample.getSampleRate(self)
        --[[ 
Returns the sample rate as an integer, such as 44100 or 22050.

 ]]
        return playdate.sound.sample.getSampleRate(self._class)
    end
    function sample.getFormat(self)
        --[[ 
Returns the format of the sample, one of

    playdate.sound.kFormat8bitMono

    playdate.sound.kFormat8bitStereo

    playdate.sound.kFormat16bitMono

    playdate.sound.kFormat16bitStereo


 ]]
        return playdate.sound.sample.getFormat(self._class)
    end
    function sample.getLength(self)
        --[[ 
Returns two values, the length of the available sample data and the size of the allocated buffer. Both values are measured in seconds. For a sample loaded from disk, these will be the same; for a sample used for recording, the available data may be less than the allocated size.

 ]]
        return playdate.sound.sample.getLength(self._class)
    end
    function sample.play(self, repeatCount, rate)
        --[[ 
Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its play function.

 ]]
        playdate.sound.sample.play(self._class, repeatCount, rate)
    end
    function sample.playAt(self, when, vol, rightvol, rate)
        --[[ 
Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its playAt function.

 ]]
        playdate.sound.sample.playAt(self._class, when, vol, rightvol, rate)
    end
    function sample.save(self, filename)
        --[[ 
Saves the sample to the given file. If filename has a .wav extension it will be saved in WAV format (and be unreadable by the Playdate sound functions), otherwise it will be saved in the Playdate pda format.
Channel

Channels are collections of sources (synths, sampleplayers, and fileplayers) with a list of effects to apply to the sounds, and pan and volume parameters.

 ]]
        playdate.sound.sample.save(self._class, filename)
    end
    return sample
end, {})
local channel = class(function(channel)
    function channel.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new channel object and adds it to the global list.

 ]]
        self._class = playdate.sound.channel.new(unpack(args))
    end
    function channel.remove(self)
        --[[ 
Removes the channel from the global list.

 ]]
        playdate.sound.channel.remove(self._class)
    end
    function channel.addEffect(self, effect)
        --[[ 
Adds an effect to the channel.

 ]]
        playdate.sound.channel.addEffect(self._class, effect)
    end
    function channel.removeEffect(self, effect)
        --[[ 
Removes an effect from the channel.

 ]]
        playdate.sound.channel.removeEffect(self._class, effect)
    end
    function channel.addSource(self, source)
        --[[ 
Adds a source to the channel. If a source is not assigned to a channel, it plays on the default global channel.

 ]]
        playdate.sound.channel.addSource(self._class, source)
    end
    function channel.removeSource(self, source)
        --[[ 
Removes a source from the channel.

 ]]
        playdate.sound.channel.removeSource(self._class, source)
    end
    function channel.setVolume(self, volume)
        --[[ 
Sets the volume (0.0 - 1.0) for the channel.

 ]]
        playdate.sound.channel.setVolume(self._class, volume)
    end
    function channel.getVolume(self)
        --[[ 
Gets the volume (0.0 - 1.0) for the channel.

 ]]
        playdate.sound.channel.getVolume(self._class)
    end
    function channel.setPan(self, pan)
        --[[ 
Sets the pan parameter for the channel. -1 is left, 0 is center, and 1 is right.

 ]]
        playdate.sound.channel.setPan(self._class, pan)
    end
    function channel.setPanMod(self, signal)
        --[[ 
Sets a signal to automate the pan parameter. Set to nil to clear the modulator.

 ]]
        playdate.sound.channel.setPanMod(self._class, signal)
    end
    function channel.setVolumeMod(self, signal)
        --[[ 
Sets a signal to automate the volume parameter. Set to nil to clear the modulator.

 ]]
        playdate.sound.channel.setVolumeMod(self._class, signal)
    end
    function channel.getDryLevelSignal(self)
        --[[ 
Returns a signal that follows the volume of the channel before effects are applied.

 ]]
        return playdate.sound.channel.getDryLevelSignal(self._class)
    end
    function channel.getWetLevelSignal(self)
        --[[ 
Returns a signal that follows the volume of the channel after effects are applied.
Source


 ]]
        return playdate.sound.channel.getWetLevelSignal(self._class)
    end
    return channel
end, {})
local synth = class(function(synth)
    function synth.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new synth object to play a waveform or wavetable. See playdate.sound.synth:setWaveform for waveform values.

 ]]
        self._class = playdate.sound.synth.new(unpack(args))
    end
    return synth
end, {})
local synth = class(function(synth)
    function synth.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new synth object to play a Sample. Sample data must be uncompressed PCM, not ADPCM. An optional sustain region (measured in sample frames) defines a loop to play while the note is active. When the note ends, if an envelope has been set on the synth and the sustain range goes to the end of the sample (i.e. there’s no release section of the sample after the sustain range) then the sustain section continues looping during the envelope release; otherwise it plays through the end of the sample and stops. As a convenience, if sustainStart is greater than zero and sustainEnd isn’t given, it will be set to the length of the sample.

 ]]
        self._class = playdate.sound.synth.new(unpack(args))
    end
    function synth.copy(self)
        --[[ 
Returns a copy of the given synth.

 ]]
        return playdate.sound.synth.copy(self._class)
    end
    function synth.playNote(self, pitch, volume, length, when)
        --[[ 
Plays a note with the current waveform or sample.

    pitch: the pitch value is in Hertz. If a sample is playing, pitch=261.63 (C4) plays at normal speed

        in either function, a string like Db3 can be used instead of a number

    volume: 0 to 1, defaults to 1

    length: in seconds. If omitted, note will play until you call noteOff()

    when: seconds since the sound engine started (see playdate.sound.getCurrentTime). Defaults to the current time.

The function returns true if the synth was successfully added to the sound channel, otherwise false (i.e., if the channel is full).

If pitch is zero, this function calls noteOff() instead of potentially adding a non-zero sample, or DC offset, to the output.
	Synths currently only have a buffer of one note event. If you call playNote() while another note is waiting to play, it will replace that note. To create a sequence of notes to play over a period of time, see playdate.sound.sequence.

 ]]
        return playdate.sound.synth.playNote(self._class, pitch, volume, length, when)
    end
    function synth.playMIDINote(self, note, volume, length, when)
        --[[ 
Identical to playNote but uses a note name like "C4", or MIDI note number (60=C4, 61=C#4, etc.). In the latter case, fractional values are allowed.

 ]]
        playdate.sound.synth.playMIDINote(self._class, note, volume, length, when)
    end
    function synth.noteOff(self)
        --[[ 
Releases the note, if one is playing. The note will continue to be voiced through the release section of the synth’s envelope.

 ]]
        playdate.sound.synth.noteOff(self._class)
    end
    function synth.stop(self)
        --[[ 
Stops the synth immediately, without playing the release part of the envelope.

 ]]
        playdate.sound.synth.stop(self._class)
    end
    function synth.isPlaying(self)
        --[[ 
Returns true if the synth is still playing, including the release phase of the envelope.

 ]]
        return playdate.sound.synth.isPlaying(self._class)
    end
    function synth.setAmplitudeMod(self, signal)
        --[[ 
Sets the signal to use as the amplitude modulator. Set to nil to clear the modulator.

 ]]
        playdate.sound.synth.setAmplitudeMod(self._class, signal)
    end
    function synth.setADSR(self, attack, decay, sustain, release)
        --[[ 
Sets the attack time, decay time, sustain level, and release time for the sound envelope, and optionally the curvature.

 ]]
        playdate.sound.synth.setADSR(self._class, attack, decay, sustain, release)
    end
    function synth.setAttack(self, time)
        --[[ 
Sets the attack time, in seconds.

 ]]
        playdate.sound.synth.setAttack(self._class, time)
    end
    function synth.setDecay(self, time)
        --[[ 
Sets the decay time, in seconds.

 ]]
        playdate.sound.synth.setDecay(self._class, time)
    end
    function synth.setSustain(self, level)
        --[[ 
Sets the sustain level, as a proportion of the total level (0.0 to 1.0).

 ]]
        playdate.sound.synth.setSustain(self._class, level)
    end
    function synth.setRelease(self, time)
        --[[ 
Sets the release time, in seconds.

 ]]
        playdate.sound.synth.setRelease(self._class, time)
    end
    function synth.clearEnvelope(self)
        --[[ 
Clears the synth’s envelope settings.

 ]]
        playdate.sound.synth.clearEnvelope(self._class)
    end
    function synth.setEnvelopeCurvature(self, amount)
        --[[ 
Smoothly changes the envelope’s shape from linear (amount=0) to exponential (amount=1).

 ]]
        playdate.sound.synth.setEnvelopeCurvature(self._class, amount)
    end
    function synth.getEnvelope(self)
        --[[ 
Returns the synth’s envelope as a playdate.sound.envelope object.

 ]]
        return playdate.sound.synth.getEnvelope(self._class)
    end
    function synth.setFinishCallback(self, _function)
        --[[ 
Sets a function to be called when the synth stops playing.

 ]]
        playdate.sound.synth.setFinishCallback(self._class, _function)
    end
    function synth.setFrequencyMod(self, signal)
        --[[ 
Sets the signal to use as the frequency modulator. Set to nil to clear the modulator.

 ]]
        playdate.sound.synth.setFrequencyMod(self._class, signal)
    end
    function synth.setLegato(self, flag)
        --[[ 
Sets whether to use legato phrasing for the synth. If the legato flag is set and a new note starts while a previous note is still playing, the synth’s envelope remains in the sustain phase instead of starting a new attack.

 ]]
        playdate.sound.synth.setLegato(self._class, flag)
    end
    function synth.setVolume(self, left, right)
        --[[ 
Sets the synth volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.

Volume values are between 0.0 and 1.0.

 ]]
        playdate.sound.synth.setVolume(self._class, left, right)
    end
    function synth.getVolume(self)
        --[[ 
Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.

Volume values are between 0.0 and 1.0.

 ]]
        return playdate.sound.synth.getVolume(self._class)
    end
    function synth.setWaveform(self, waveform)
        --[[ 
Sets the waveform or Sample the synth plays. If a sample is given, its data must be uncompressed PCM, not ADPCM. Otherwise waveform should be one of the following constants:

    playdate.sound.kWaveSine

    playdate.sound.kWaveSquare

    playdate.sound.kWaveSawtooth

    playdate.sound.kWaveTriangle

    playdate.sound.kWaveNoise

    playdate.sound.kWavePOPhase

    playdate.sound.kWavePODigital

    playdate.sound.kWavePOVosim


 ]]
        playdate.sound.synth.setWaveform(self._class, waveform)
    end
    function synth.setWavetable(self, sample, samplesize, xsize, ysize)
        --[[ 
Sets a wavetable for the synth to play. Sample data must be 16-bit mono uncompressed. samplesize is the number of samples in each waveform "cell" in the table and must be a power of 2. xsize is the number of cells across the wavetable. If the wavetable is two-dimensional, ysize gives the number of cells in the y direction.

The synth’s "position" in the wavetable is set manually with setParameter() or automated with setParameterModulator(). In some cases it’s easier to use a parameter that matches the waveform position in the table, in others (notably when using envelopes and lfos) it’s more convenient to use a 0-1 scale, so there’s some redundancy here. Parameters are

    1: x position, values are from 0 to the table width

    2: x position, values are from 0 to 1, parameter is scaled up to table width

For 2-D tables (rowwidth > 0):

    3: y position, values are from 0 to the table height

    4: y position, values are from 0 to 1, parameter is scaled up to table height

Synth parameters

Some synth types have parameters that can be set manually or driven by a signal, such as an envelope or LFO. On the square waveform the single parameter changes the pulse width; the PO synths have 2 parameters each, changing various aspects of the generator algorithm; and wavetable synths have up to four, described above.

 ]]
        playdate.sound.synth.setWavetable(self._class, sample, samplesize, xsize, ysize)
    end
    function synth.setParameter(self, parameter, value)
        --[[ 
Sets the parameter at (1-based) position num to the given value. Unless otherwise specified, value ranges from 0 to 1.

 ]]
        playdate.sound.synth.setParameter(self._class, parameter, value)
    end
    function synth.setParameterMod(self, parameter, signal)
        --[[ 
Sets the signal to modulate the parameter. Set to nil to clear the modulator.
Signal


 ]]
        playdate.sound.synth.setParameterMod(self._class, parameter, signal)
    end
    function synth.setOffset(self, offset)
        --[[ 
Adds a constant offset to the signal (lfo, envelope, etc.).

 ]]
        playdate.sound.signal.setOffset(self._class, offset)
    end
    function synth.setScale(self, scale)
        --[[ 
Multiplies the signal’s output by the given scale factor. The scale is applied before the offset.

 ]]
        playdate.sound.signal.setScale(self._class, scale)
    end
    function synth.getValue(self)
        --[[ 
Returns the current output value of the signal.
LFO

 ]]
        return playdate.sound.signal.getValue(self._class)
    end
    return synth
end, {})
local lfo = class(function(lfo)
    function lfo.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new LFO object, which can be used to modulate sounds. See playdate.sound.lfo:setType() for LFO types.

 ]]
        self._class = playdate.sound.lfo.new(unpack(args))
    end
    function lfo.setType(self, type)
        --[[ 
Sets the waveform of the LFO. Valid values are

    playdate.sound.kLFOSquare

    playdate.sound.kLFOSawtoothUp

    playdate.sound.kLFOSawtoothDown

    playdate.sound.kLFOTriangle

    playdate.sound.kLFOSine

    playdate.sound.kLFOSampleAndHold


 ]]
        playdate.sound.lfo.setType(self._class, type)
    end
    function lfo.setArpeggio(self, note1, ...)
        local args = list {...}
        --[[ 
Sets the LFO type to arpeggio, where the given values are in half-steps from the center note. For example, the sequence (0, 4, 7, 12) plays the notes of a major chord.

 ]]
        playdate.sound.lfo.setArpeggio(self._class, note1, unpack(args))
    end
    function lfo.setCenter(self, center)
        --[[ 
Sets the center value of the LFO.

 ]]
        playdate.sound.lfo.setCenter(self._class, center)
    end
    function lfo.setDepth(self, depth)
        --[[ 
Sets the depth of the LFO’s modulation.

 ]]
        playdate.sound.lfo.setDepth(self._class, depth)
    end
    function lfo.setRate(self, rate)
        --[[ 
Sets the rate of the LFO, in cycles per second.

 ]]
        playdate.sound.lfo.setRate(self._class, rate)
    end
    function lfo.setPhase(self, phase)
        --[[ 
Sets the current phase of the LFO, from 0 to 1.

 ]]
        playdate.sound.lfo.setPhase(self._class, phase)
    end
    function lfo.setStartPhase(self, phase)
        --[[ 
Sets the initial phase of the LFO, from 0 to 1.

 ]]
        playdate.sound.lfo.setStartPhase(self._class, phase)
    end
    function lfo.setGlobal(self, flag)
        --[[ 
If an LFO is marked global, it is continuously updated whether or not it’s attached to any source.

 ]]
        playdate.sound.lfo.setGlobal(self._class, flag)
    end
    function lfo.setRetrigger(self, flag)
        --[[ 
If retrigger is on, the LFO’s phase is reset to its initial phase (default 0) when a synth using the LFO starts playing a note.

 ]]
        playdate.sound.lfo.setRetrigger(self._class, flag)
    end
    function lfo.setDelay(self, holdoff, ramp)
        --[[ 
Sets an initial holdoff time for the LFO where the LFO remains at its center value, and a ramp time where the value increases linearly to its maximum depth. Values are in seconds.

 ]]
        playdate.sound.lfo.setDelay(self._class, holdoff, ramp)
    end
    function lfo.getValue(self)
        --[[ 
Returns the current signal value of the LFO.
Envelope

 ]]
        return playdate.sound.lfo.getValue(self._class)
    end
    return lfo
end, {})
local envelope = class(function(envelope)
    function envelope.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new envelope with the given (optional) parameters.

 ]]
        self._class = playdate.sound.envelope.new(unpack(args))
    end
    function envelope.setAttack(self, attack)
        --[[ 
Sets the envelope attack time to attack, in seconds.

 ]]
        playdate.sound.envelope.setAttack(self._class, attack)
    end
    function envelope.setDecay(self, decay)
        --[[ 
Sets the envelope decay time to decay, in seconds.

 ]]
        playdate.sound.envelope.setDecay(self._class, decay)
    end
    function envelope.setSustain(self, sustain)
        --[[ 
Sets the envelope sustain level to sustain, as a proportion of the maximum. For example, if the sustain level is 0.5, the signal value rises to its full value over the attack phase of the envelope, then drops to half its maximum over the decay phase, and remains there while the envelope is active.

 ]]
        playdate.sound.envelope.setSustain(self._class, sustain)
    end
    function envelope.setRelease(self, release)
        --[[ 
Sets the envelope release time to release, in seconds.

 ]]
        playdate.sound.envelope.setRelease(self._class, release)
    end
    function envelope.setCurvature(self, amount)
        --[[ 
Smoothly changes the envelope’s shape from linear (amount=0) to exponential (amount=1).

 ]]
        playdate.sound.envelope.setCurvature(self._class, amount)
    end
    function envelope.setVelocitySensitivity(self, amount)
        --[[ 
Changes the amount by which note velocity scales output level. At the default value of 1, output is proportional to velocity; at 0 velocity has no effect on output level.

 ]]
        playdate.sound.envelope.setVelocitySensitivity(self._class, amount)
    end
    function envelope.setRateScaling(self, scaling, start, _end)
        --[[ 
Scales the envelope rate according to the played note. For notes below start, the envelope’s set rate is used; for notes above end envelope rates are scaled by the scaling parameter. Between the two notes the scaling factor is interpolated from 1.0 to scaling. start and end are either MIDI note numbers or names like "C4". If omitted, the default range is C1 (36) to C5 (84).

 ]]
        playdate.sound.envelope.setRateScaling(self._class, scaling, start, _end)
    end
    function envelope.setScale(self, scale)
        --[[ 
Sets the scale value for the envelope. The transformed envelope has an initial value of offset and a maximum (minimum if scale is negative) of offset + scale.

 ]]
        playdate.sound.envelope.setScale(self._class, scale)
    end
    function envelope.setOffset(self, offset)
        --[[ 
Sets the offset value for the envelope. The transformed envelope has an initial value of offset and a maximum (minimum if scale is negative) of offset + scale.

 ]]
        playdate.sound.envelope.setOffset(self._class, offset)
    end
    function envelope.setLegato(self, flag)
        --[[ 
Sets whether to use legato phrasing for the envelope. If the legato flag is set, when the envelope is re-triggered before it’s released, it remains in the sustain phase instead of jumping back to the attack phase.

 ]]
        playdate.sound.envelope.setLegato(self._class, flag)
    end
    function envelope.setRetrigger(self, flag)
        --[[ 
If retrigger is on, the envelope always starts from 0 when a note starts playing, instead of the current value if it’s active.

 ]]
        playdate.sound.envelope.setRetrigger(self._class, flag)
    end
    function envelope.trigger(self, velocity, length)
        --[[ 
Triggers the envelope at the given velocity. If a length parameter is given, the envelope moves to the release phase after the given time. Otherwise, the envelope is held in the sustain phase until the trigger function is called again with velocity equal to zero.

 ]]
        playdate.sound.envelope.trigger(self._class, velocity, length)
    end
    function envelope.setGlobal(self, flag)
        --[[ 
If an envelope is marked global, it is continuously updated whether or not it’s attached to any source.

 ]]
        playdate.sound.envelope.setGlobal(self._class, flag)
    end
    function envelope.getValue(self)
        --[[ 
Returns the current signal value of the envelope.
Effects


 ]]
        return playdate.sound.envelope.getValue(self._class)
    end
    return envelope
end, {})
local bitcrusher = class(function(bitcrusher)
    function bitcrusher.__init__(self)
        --[[ 
Creates a new bitcrusher filter.

 ]]
        self._class = playdate.sound.bitcrusher.new()
    end
    function bitcrusher.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

 ]]
        playdate.sound.bitcrusher.setMix(self._class, level)
    end
    function bitcrusher.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.bitcrusher.setMixMod(self._class, signal)
    end
    function bitcrusher.setAmount(self, amt)
        --[[ 
Sets the amount of crushing to amt. Valid values are 0 (no effect) to 1 (quantizing output to 1-bit).

 ]]
        playdate.sound.bitcrusher.setAmount(self._class, amt)
    end
    function bitcrusher.setAmountMod(self, signal)
        --[[ 
Sets a signal to modulate the filter level. Set to nil to clear the modulator.

 ]]
        playdate.sound.bitcrusher.setAmountMod(self._class, signal)
    end
    function bitcrusher.setUndersampling(self, amt)
        --[[ 
Sets the number of samples to repeat; 0 is no undersampling, 1 effectively halves the sample rate.

 ]]
        playdate.sound.bitcrusher.setUndersampling(self._class, amt)
    end
    function bitcrusher.setUndersamplingMod(self, signal)
        --[[ 
Sets a signal to modulate the filter level. Set to nil to clear the modulator.
Ring Modulator

 ]]
        playdate.sound.bitcrusher.setUndersamplingMod(self._class, signal)
    end
    return bitcrusher
end, {})
local ringmod = class(function(ringmod)
    function ringmod.__init__(self)
        --[[ 
Creates a new ring modulator filter.

 ]]
        self._class = playdate.sound.ringmod.new()
    end
    function ringmod.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

 ]]
        playdate.sound.ringmod.setMix(self._class, level)
    end
    function ringmod.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.ringmod.setMixMod(self._class, signal)
    end
    function ringmod.setFrequency(self, f)
        --[[ 
Sets the ringmod frequency to f.

 ]]
        playdate.sound.ringmod.setFrequency(self._class, f)
    end
    function ringmod.setFrequencyMod(self, signal)
        --[[ 
Sets a signal to modulate the ringmod frequency. Set to nil to clear the modulator.
One pole filter

The one pole filter is a simple low/high pass filter, with a single parameter describing the cutoff frequency: values above 0 (up to 1) are high-pass, values below 0 (down to -1) are low-pass.

 ]]
        playdate.sound.ringmod.setFrequencyMod(self._class, signal)
    end
    return ringmod
end, {})
local onepolefilter = class(function(onepolefilter)
    function onepolefilter.__init__(self)
        --[[ 
Returns a new one pole filter.

 ]]
        self._class = playdate.sound.onepolefilter.new()
    end
    function onepolefilter.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

 ]]
        playdate.sound.onepolefilter.setMix(self._class, level)
    end
    function onepolefilter.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.onepolefilter.setMixMod(self._class, signal)
    end
    function onepolefilter.setParameter(self, p)
        --[[ 
Sets the filter’s single parameter (cutoff frequency) to p.

 ]]
        playdate.sound.onepolefilter.setParameter(self._class, p)
    end
    function onepolefilter.setParameterMod(self, m)
        --[[ 
Sets a modulator for the filter’s parameter. Set to nil to clear the modulator.
Two pole filter

 ]]
        playdate.sound.onepolefilter.setParameterMod(self._class, m)
    end
    return onepolefilter
end, {})
local twopolefilter = class(function(twopolefilter)
    function twopolefilter.__init__(self, type)
        --[[ 
Creates a new two pole IIR filter of the given type:

    playdate.sound.kFilterLowPass (or the string "lowpass" or "lopass")

    playdate.sound.kFilterHighPass (or "highpass" or "hipass")

    playdate.sound.kFilterBandPass (or "bandpass")

    playdate.sound.kFilterNotch (or "notch")

    playdate.sound.kFilterPEQ (or "peq")

    playdate.sound.kFilterLowShelf (or "lowshelf" or "loshelf")

    playdate.sound.kFilterHighShelf (or "highshelf" or "hishelf")


 ]]
        self._class = playdate.sound.twopolefilter.new(type)
    end
    function twopolefilter.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

 ]]
        playdate.sound.twopolefilter.setMix(self._class, level)
    end
    function twopolefilter.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.twopolefilter.setMixMod(self._class, signal)
    end
    function twopolefilter.setFrequency(self, f)
        --[[ 
Sets the center frequency (in Hz) of the filter to f.

 ]]
        playdate.sound.twopolefilter.setFrequency(self._class, f)
    end
    function twopolefilter.setFrequencyMod(self, signal)
        --[[ 
Sets a signal to modulate the filter frequency. Set to nil to clear the modulator.

 ]]
        playdate.sound.twopolefilter.setFrequencyMod(self._class, signal)
    end
    function twopolefilter.setResonance(self, r)
        --[[ 
Sets the resonance of the filter to r. Valid values are in the range 0-1. This parameter has no effect on shelf type filters.

 ]]
        playdate.sound.twopolefilter.setResonance(self._class, r)
    end
    function twopolefilter.setResonanceMod(self, signal)
        --[[ 
Sets a signal to modulate the filter resonance. Set to nil to clear the modulator.

 ]]
        playdate.sound.twopolefilter.setResonanceMod(self._class, signal)
    end
    function twopolefilter.setGain(self, g)
        --[[ 
Sets the gain of the filter to g. Gain is only used in PEQ and shelf type filters.

 ]]
        playdate.sound.twopolefilter.setGain(self._class, g)
    end
    function twopolefilter.setType(self, type)
        --[[ 
Sets the type of the filter to type.
Overdrive

 ]]
        playdate.sound.twopolefilter.setType(self._class, type)
    end
    return twopolefilter
end, {})
local overdrive = class(function(overdrive)
    function overdrive.__init__(self)
        --[[ 
Creates a new overdrive effect.

 ]]
        self._class = playdate.sound.overdrive.new()
    end
    function overdrive.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

 ]]
        playdate.sound.overdrive.setMix(self._class, level)
    end
    function overdrive.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.overdrive.setMixMod(self._class, signal)
    end
    function overdrive.setGain(self, level)
        --[[ 
Sets the gain of the filter.

 ]]
        playdate.sound.overdrive.setGain(self._class, level)
    end
    function overdrive.setLimit(self, level)
        --[[ 
Sets the level where the amplified input clips.

 ]]
        playdate.sound.overdrive.setLimit(self._class, level)
    end
    function overdrive.setLimitMod(self, signal)
        --[[ 
Sets a signal to modulate the limit level. Set to nil to clear the modulator.

 ]]
        playdate.sound.overdrive.setLimitMod(self._class, signal)
    end
    function overdrive.setOffset(self, level)
        --[[ 
Adds an offset to the upper and lower limits to create an asymmetric clipping.

 ]]
        playdate.sound.overdrive.setOffset(self._class, level)
    end
    function overdrive.setOffsetMod(self, signal)
        --[[ 
Sets a signal to modulate the offset value. Set to nil to clear the modulator.
Delay line

 ]]
        playdate.sound.overdrive.setOffsetMod(self._class, signal)
    end
    return overdrive
end, {})
local delayline = class(function(delayline)
    function delayline.__init__(self, length)
        --[[ 
Creates a new delay line effect, with the given length (in seconds).

 ]]
        self._class = playdate.sound.delayline.new(length)
    end
    function delayline.setMix(self, level)
        --[[ 
Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix, which is useful if you’re using taps for varying delays.

 ]]
        playdate.sound.delayline.setMix(self._class, level)
    end
    function delayline.setMixMod(self, signal)
        --[[ 
Sets a signal to modulate the mix level. Set to nil to clear the modulator.

 ]]
        playdate.sound.delayline.setMixMod(self._class, signal)
    end
    function delayline.addTap(self, delay)
        --[[ 
Returns a new playdate.sound.delaylinetap on the delay line, at the given delay (which must be less than or equal to the delay line’s length).

 ]]
        return playdate.sound.delayline.addTap(self._class, delay)
    end
    function delayline.setFeedback(self, level)
        --[[ 
Sets the feedback level of the delay line.
Delay line tap


 ]]
        playdate.sound.delayline.setFeedback(self._class, level)
    end
    function delayline.setDelay(self, time)
        --[[ 
Sets the position of the tap on the delay line, up to the delay line’s length.

 ]]
        playdate.sound.delaylinetap.setDelay(self._class, time)
    end
    function delayline.setDelayMod(self, signal)
        --[[ 
Sets a signal to modulate the tap delay. If the signal is continuous (e.g. an envelope or a triangle LFO, but not a square LFO) playback is sped up or slowed down to compress or expand time. Set to nil to clear the modulator.

 ]]
        playdate.sound.delaylinetap.setDelayMod(self._class, signal)
    end
    function delayline.setVolume(self, level)
        --[[ 
Sets the tap’s volume.

 ]]
        playdate.sound.delaylinetap.setVolume(self._class, level)
    end
    function delayline.getVolume(self)
        --[[ 
Returns the tap’s volume.

 ]]
        return playdate.sound.delaylinetap.getVolume(self._class)
    end
    function delayline.setFlipChannels(self, flag)
        --[[ 
If set and the delay line is stereo, the tap outputs the delay line’s left channel to its right output and vice versa.
Sequence

 ]]
        playdate.sound.delaylinetap.setFlipChannels(self._class, flag)
    end
    return delayline
end, {})
local sequence = class(function(sequence)
    function sequence.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new sound sequence. If midi_path is given, it attempts to load data from the midi file into the sequence.

 ]]
        self._class = playdate.sound.sequence.new(unpack(args))
    end
    function sequence.play(self, finishCallback)
        --[[ 
Starts playing the sequence. finishCallback is an optional function to be called when the sequence finishes playing or is stopped. The sequence is passed to the callback as its single argument.

 ]]
        playdate.sound.sequence.play(self._class, finishCallback)
    end
    function sequence.stop(self)
        --[[ 
Stops playing the sequence.

 ]]
        playdate.sound.sequence.stop(self._class)
    end
    function sequence.isPlaying(self)
        --[[ 
Returns true if the sequence is currently playing.

 ]]
        return playdate.sound.sequence.isPlaying(self._class)
    end
    function sequence.getLength(self)
        --[[ 
Returns the length of the longest track in the sequence, in steps. See also playdate.sound.track.getLength().

 ]]
        return playdate.sound.sequence.getLength(self._class)
    end
    function sequence.goToStep(self, step, play)
        --[[ 
Moves the play position for the sequence to step number step. If play is set, triggers the notes at that step.

 ]]
        playdate.sound.sequence.goToStep(self._class, step, play)
    end
    function sequence.getCurrentStep(self)
        --[[ 
Returns the step number the sequence is currently at.

 ]]
        return playdate.sound.sequence.getCurrentStep(self._class)
    end
    function sequence.setTempo(self, stepsPerSecond)
        --[[ 
Sets the tempo of the sequence, in steps per second.

 ]]
        playdate.sound.sequence.setTempo(self._class, stepsPerSecond)
    end
    function sequence.getTempo(self)
        --[[ 
Returns the tempo of the sequence, in steps per second.

 ]]
        return playdate.sound.sequence.getTempo(self._class)
    end
    function sequence.setLoops(self, startStep, endStep, loopCount)
        --[[ 
Sets the looping range of the sequence. If loops is 0 or unset, the loop repeats endlessly.

 ]]
        playdate.sound.sequence.setLoops(self._class, startStep, endStep, loopCount)
    end
    function sequence.setLoops(self, loopCount)
        --[[ 
Same as above, with startStep set to 0 and endStep set to sequence:getLength().

 ]]
        playdate.sound.sequence.setLoops(self._class, loopCount)
    end
    function sequence.getTrackCount(self)
        --[[ 
Returns the number of tracks in the sequence.

 ]]
        return playdate.sound.sequence.getTrackCount(self._class)
    end
    function sequence.addTrack(self, track)
        --[[ 
Adds the given playdate.sound.track to the sequence. If track omitted, the function creates and returns a new track.

 ]]
        return playdate.sound.sequence.addTrack(self._class, track)
    end
    function sequence.setTrackAtIndex(self, n, track)
        --[[ 
Sets the given playdate.sound.track object at position n in the sequence.

 ]]
        playdate.sound.sequence.setTrackAtIndex(self._class, n, track)
    end
    function sequence.getTrackAtIndex(self, n)
        --[[ 
Returns the playdate.sound.track object at position n in the sequence.

 ]]
        return playdate.sound.sequence.getTrackAtIndex(self._class, n)
    end
    function sequence.allNotesOff(self)
        --[[ 
Sends an allNotesOff() message to each track’s instrument.
Track

 ]]
        playdate.sound.sequence.allNotesOff(self._class)
    end
    return sequence
end, {})
local track = class(function(track)
    function track.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new playdate.sound.track object.

 ]]
        self._class = playdate.sound.track.new(unpack(args))
    end
    function track.addNote(self, step, note, length, velocity)
        --[[ 
 ]]
        playdate.sound.track.addNote(self._class, step, note, length, velocity)
    end
    function track.addNote(self, table)
        --[[ 
Adds a single note event to the track, letting you specify step, note, length, and velocity directly. The second format allows you to pack them into a table, using the format returned by getNotes(). The note argument can be a MIDI note number or a note name like "Db3". length is the length of the note in steps, not time—​that is, it follows the sequence’s tempo. The default velocity is 1.0.

See setNotes() for the ability to add more than one note at a time.

 ]]
        return playdate.sound.track.addNote(self._class, table)
    end
    function track.setNotes(self, list)
        --[[ 
Set multiple notes at once, each array element should be a table containing values for the keys The tables contain values for keys step, note, length, and velocity.

 ]]
        playdate.sound.track.setNotes(self._class, list)
    end
    function track.getNotes(self, step, endstep)
        --[[ 
Returns an array of tables representing the note events in the track.

The tables contain values for keys step, note, length, and velocity. If step is given, the function returns only the notes at that step; if both step and endstep are set, it returns the notes between the two steps (including notes at endstep). n.b. The note field in the event tables is always a MIDI note number value, even if the note was added using the string notation.

 ]]
        return playdate.sound.track.getNotes(self._class, step, endstep)
    end
    function track.removeNote(self, step, note)
        --[[ 
Removes the note event at step playing note.

 ]]
        playdate.sound.track.removeNote(self._class, step, note)
    end
    function track.clearNotes(self)
        --[[ 
Clears all notes from the track.

 ]]
        playdate.sound.track.clearNotes(self._class)
    end
    function track.getLength(self)
        --[[ 
Returns the length, in steps, of the track—​that is, the step where the last note in the track ends.

 ]]
        return playdate.sound.track.getLength(self._class)
    end
    function track.getNotesActive(self)
        --[[ 
Returns the current number of notes active in the track.

 ]]
        return playdate.sound.track.getNotesActive(self._class)
    end
    function track.getPolyphony(self)
        --[[ 
Returns the maximum number of notes simultaneously active in the track. (Known bug: this currently only works for midi files)

 ]]
        return playdate.sound.track.getPolyphony(self._class)
    end
    function track.setInstrument(self, inst)
        --[[ 
Sets the playdate.sound.instrument that this track plays. If inst is a playdate.sound.synth, the function creates an instrument for the synth.

 ]]
        playdate.sound.track.setInstrument(self._class, inst)
    end
    function track.getInstrument(self)
        --[[ 
Gets the playdate.sound.instrument that this track plays.

 ]]
        playdate.sound.track.getInstrument(self._class)
    end
    function track.setMuted(self, flag)
        --[[ 
Mutes or unmutes the track.

 ]]
        playdate.sound.track.setMuted(self._class, flag)
    end
    function track.addControlSignal(self, s)
        --[[ 
Adds a playdate.sound.controlsignal object to the track. Note that the signal must be assigned to a modulation input for it to have any audible effect. The input can be anywhere in the sound engine—​it’s not required to belong to the track in any way.

 ]]
        playdate.sound.track.addControlSignal(self._class, s)
    end
    function track.getControlSignals(self)
        --[[ 
Returns an array of playdate.sound.controlsignal objects assigned to this track.
Instrument

 ]]
        return playdate.sound.track.getControlSignals(self._class)
    end
    return track
end, {})
local instrument = class(function(instrument)
    function instrument.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new playdate.sound.instrument object. If synth is given, adds it as a voice for the instrument.

 ]]
        self._class = playdate.sound.instrument.new(unpack(args))
    end
    function instrument.addVoice(self, v, note, rangeend, transpose)
        --[[ 
Adds the given playdate.sound.synth to the instrument. If only the note argument is given, the voice is only used for that note, and is transposed to play at normal speed (i.e. rate=1.0 for samples, or C4 for synths). If rangeend is given, the voice is assigned to the range note to rangeend, inclusive, with the first note in the range transposed to rate=1.0/C4. The note and rangeend arguments can be MIDI note numbers or note names like "Db3". The final transpose argument transposes the note played, in half-tone units.

 ]]
        playdate.sound.instrument.addVoice(self._class, v, note, rangeend, transpose)
    end
    function instrument.setPitchBend(self, amount)
        --[[ 
Sets the pitch bend to be applied to the voices in the instrument, as a fraction of the full range.

 ]]
        playdate.sound.instrument.setPitchBend(self._class, amount)
    end
    function instrument.setPitchBendRange(self, halfsteps)
        --[[ 
Sets the pitch bend range for the voices in the instrument. The default range is 12, for a full octave.

 ]]
        playdate.sound.instrument.setPitchBendRange(self._class, halfsteps)
    end
    function instrument.setTranspose(self, halfsteps)
        --[[ 
Transposes all voices in the instrument. halfsteps can be a fractional value.

 ]]
        playdate.sound.instrument.setTranspose(self._class, halfsteps)
    end
    function instrument.playNote(self, frequency, vel, length, when)
        --[[ 
Plays the given note on the instrument. A string like Db3 can be used instead of a pitch/note number. Fractional values are allowed. vel defaults to 1.0, fully on. If length isn’t specified, the note stays on until instrument.noteOff(note) is called. when is the number of seconds in the future to start playing the note, default is immediately.

 ]]
        playdate.sound.instrument.playNote(self._class, frequency, vel, length, when)
    end
    function instrument.playMIDINote(self, note, vel, length, when)
        --[[ 
Identical to instrument:playNote() but note is a MIDI note number: 60=C4, 61=C#4, etc. Fractional values are allowed.

 ]]
        playdate.sound.instrument.playMIDINote(self._class, note, vel, length, when)
    end
    function instrument.noteOff(self, note, when)
        --[[ 
Stops the instrument voice playing note note. If when is given, the note is stopped when seconds in the future, otherwise it’s stopped immediately.

 ]]
        playdate.sound.instrument.noteOff(self._class, note, when)
    end
    function instrument.allNotesOff(self)
        --[[ 
Sends a stop signal to all playing notes.

 ]]
        playdate.sound.instrument.allNotesOff(self._class)
    end
    function instrument.setVolume(self, left, right)
        --[[ 
Sets the instrument volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.

Volume values are between 0.0 and 1.0.

 ]]
        playdate.sound.instrument.setVolume(self._class, left, right)
    end
    function instrument.getVolume(self)
        --[[ 
Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.

Volume values are between 0.0 and 1.0.
Control Signal

 ]]
        return playdate.sound.instrument.getVolume(self._class)
    end
    return instrument
end, {})
local controlsignal = class(function(controlsignal)
    function controlsignal.__init__(self, ...)
        local args = list {...}
        --[[ 
Creates a new control signal object, for automating effect parameters, channel pan and level, etc.

 ]]
        self._class = playdate.sound.controlsignal.new(unpack(args))
    end
    function controlsignal.addEvent(self, step, value, interpolate)
        --[[ 
 ]]
        playdate.sound.controlsignal.addEvent(self._class, step, value, interpolate)
    end
    function controlsignal.addEvent(self, event)
        --[[ 
addEvent is a simpler way of adding events one at a time than setting the entire events table. Arguments are either the values themselves in the given order, or a table containing values for step, value, and optionally interpolate.

 ]]
        playdate.sound.controlsignal.addEvent(self._class, event)
    end
    function controlsignal.clearEvents(self)
        --[[ 
Clears all events from the control signal.

 ]]
        playdate.sound.controlsignal.clearEvents(self._class)
    end
    function controlsignal.setControllerType(self, number)
        --[[ 
Sets the midi controller number for the control signal, if that’s something you want to do. The value has no effect on playback.

 ]]
        playdate.sound.controlsignal.setControllerType(self._class, number)
    end
    function controlsignal.getControllerType(self)
        --[[ 
Control signals in midi files are assigned a controller number, which describes the intent of the control. This function returns the controller number.

 ]]
        return playdate.sound.controlsignal.getControllerType(self._class)
    end
    function controlsignal.getValue(self)
        --[[ 
Returns the current output value of the control signal.
Mic Input

 ]]
        return playdate.sound.controlsignal.getValue(self._class)
    end
    return controlsignal
end, {})
local timer = class(function(timer)
    function timer.__init__(self, duration, callback, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.timer that will run for duration milliseconds. callback is a function closure that will be called when the timer is complete.

Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

By default, timers start upon instantiation. To modify the behavior of a timer, see common timer methods and properties.
Delay timers

 ]]
        self._class = playdate.timer.new(duration, callback, unpack(args))
    end
    return timer
end, {})
local timer = class(function(timer)
    function timer.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.timer that will run for duration milliseconds. If not specified, startValue and endValue will be 0, and a linear easing function will be used.

By default, timers start upon instantiation. To modify the behavior of a timer, see common timer methods and properties.

 ]]
        self._class = playdate.timer.new(unpack(args))
    end
    function timer.pause(self)
        --[[ 
Pauses a timer. (There is no need to call :start() on a newly-instantiated timer: timers start automatically.)

 ]]
        playdate.timer.pause(self._class)
    end
    function timer.start(self)
        --[[ 
Resumes a previously paused timer. There is no need to call :start() on a newly-instantiated timer: timers start automatically.

 ]]
        playdate.timer.start(self._class)
    end
    function timer.remove(self)
        --[[ 
Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches its _end, but you can use this method to dispose of timers manually.

Note that timers do not actually get removed until the next invocation of playdate.timer.updateTimers().

 ]]
        playdate.timer.remove(self._class)
    end
    function timer.reset(self)
        --[[ 
Resets a timer to its initial values.

 ]]
        playdate.timer.reset(self._class)
    end
    return timer
end, {})
local frameTimer = class(function(frameTimer)
    function frameTimer.__init__(self, duration, callback, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.frameTimer that will run for duration frames. callback is a function closure that will be called when the timer is complete.

Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

By default, frame timers start upon instantiation. To modify the behavior of a frame timer, see common frame timer methods and properties.
Delay frame timers

 ]]
        self._class = playdate.frameTimer.new(duration, callback, unpack(args))
    end
    return frameTimer
end, {})
local frameTimer = class(function(frameTimer)
    function frameTimer.__init__(self, ...)
        local args = list {...}
        --[[ 
Returns a new playdate.frameTimer that will run for duration number of frames. If not specified, startValue and endValue will be 0, and a linear easing function will be used.

By default, frame timers start upon instantiation. To modify the behavior of a frame timer, see common frame timer methods and properties.

 ]]
        self._class = playdate.frameTimer.new(unpack(args))
    end
    function frameTimer.pause(self)
        --[[ 
Pauses a timer.

 ]]
        playdate.frameTimer.pause(self._class)
    end
    function frameTimer.start(self)
        --[[ 
Resumes a timer. There is no need to call :start() on a newly-instantiated frame timer: frame timers start automatically.

 ]]
        playdate.frameTimer.start(self._class)
    end
    function frameTimer.remove(self)
        --[[ 
Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches it’s _end, but you can use this method to dispose of timers manually.

 ]]
        playdate.frameTimer.remove(self._class)
    end
    function frameTimer.reset(self)
        --[[ 
Resets a timer to its initial values.

 ]]
        playdate.frameTimer.reset(self._class)
    end
    function frameTimer.draw(self, xOffset, yOffset)
        --[[ 
Draws the next frame of the crank indicator animation, and is typically invoked in the playdate.update() callback. xOffset and yOffset can be used to alter the position of the indicator by a specified number of pixels if desired. To stop drawing the crank indicator, simply stop calling :draw() in playdate.update().

Note that if sprites are being used, this call should usually happen after playdate.graphics.sprite.update().

 ]]
        playdate.ui.crankIndicator.draw(self._class, xOffset, yOffset)
    end
    function frameTimer.resetAnimation(self)
        --[[ 
Resets the crank animation to the beginning of its sequence.

 ]]
        playdate.ui.crankIndicator.resetAnimation(self._class)
    end
    function frameTimer.getBounds(self)
        --[[ 
Returns x, y, width, height representing the bounds that the crank indicator draws within. If necessary, this rect could be passed into playdate.graphics.sprite.addDirtyRect(), or used to manually draw over the indicator image drawn by playdate.ui.crankIndicator:draw() when you want to stop showing the crank indicator.
Grid view


 ]]
        return playdate.ui.crankIndicator.getBounds(self._class)
    end
    return frameTimer
end, {})
local gridview = class(function(gridview)
    function gridview.__init__(self, cellWidth, cellHeight)
        --[[ 
Returns a new playdate.ui.gridview with cells sized cellWidth, cellHeight. (Sizes are in pixels.) If cells should span the entire width of the grid (as in a list view), pass zero (0) for cellWidth.
Drawing

 ]]
        self._class = playdate.ui.gridview.new(cellWidth, cellHeight)
    end
    function gridview.drawCell(self, section, row, column, selected, x, y, width, height)
        --[[ 
Override this method to draw the cells in the gridview. selected is a boolean, true if the cell being drawn is the currently-selected cell.

 ]]
        playdate.ui.gridview.drawCell(self._class, section, row, column, selected, x, y, width, height)
    end
    function gridview.drawSectionHeader(self, section, x, y, width, height)
        --[[ 
Override this method to draw section headers. This function will only be called if the header height has been set to a value greater than zero (0).

 ]]
        playdate.ui.gridview.drawSectionHeader(self._class, section, x, y, width, height)
    end
    function gridview.drawHorizontalDivider(self, x, y, width, height)
        --[[ 
Override this method to customize the drawing of horizontal dividers. This function will only be called if the horizontal divider height is greater than zero (0) and at least one divider has been added.

 ]]
        playdate.ui.gridview.drawHorizontalDivider(self._class, x, y, width, height)
    end
    function gridview.drawInRect(self, x, y, width, height)
        --[[ 
Draws the gridview in the specified rect. Ideally this should be called on every playdate.update() to accommodate scrolling.

 ]]
        playdate.ui.gridview.drawInRect(self._class, x, y, width, height)
    end
    function gridview.setNumberOfSections(self, num)
        --[[ 
Sets the number of sections in the grid view. Each section contains at least one row, and row numbering starts at 1 in each section.

 ]]
        playdate.ui.gridview.setNumberOfSections(self._class, num)
    end
    function gridview.getNumberOfSections(self)
        --[[ 
Returns the number of sections in the grid view.

 ]]
        return playdate.ui.gridview.getNumberOfSections(self._class)
    end
    function gridview.setNumberOfRowsInSection(self, section, num)
        --[[ 
Sets the number of rows in section.

 ]]
        playdate.ui.gridview.setNumberOfRowsInSection(self._class, section, num)
    end
    function gridview.getNumberOfRowsInSection(self, section)
        --[[ 
Returns the number of rows in section.

 ]]
        return playdate.ui.gridview.getNumberOfRowsInSection(self._class, section)
    end
    function gridview.setNumberOfColumns(self, num)
        --[[ 
Sets the number of columns in the gridview. 1 by default.

 ]]
        playdate.ui.gridview.setNumberOfColumns(self._class, num)
    end
    function gridview.getNumberOfColumns(self)
        --[[ 
Returns the number of columns in the gridview. 1 by default.

 ]]
        return playdate.ui.gridview.getNumberOfColumns(self._class)
    end
    function gridview.setNumberOfRows(self, ...)
        local args = list {...}
        --[[ 
Convenience method for list-style gridviews, or for setting the number of rows for multiple sections at a time. Pass in a list of numbers of rows for sections starting from section 1.

 ]]
        playdate.ui.gridview.setNumberOfRows(self._class, unpack(args))
    end
    function gridview.setCellSize(self, cellWidth, cellHeight)
        --[[ 
Sets the size of the cells in the gridview. If cells should span the entire width of the grid (as in a list view), pass zero (0) for cellWidth.

 ]]
        playdate.ui.gridview.setCellSize(self._class, cellWidth, cellHeight)
    end
    function gridview.setCellPadding(self, left, right, top, bottom)
        --[[ 
Sets the amount of padding around cells.

 ]]
        playdate.ui.gridview.setCellPadding(self._class, left, right, top, bottom)
    end
    function gridview.setContentInset(self, left, right, top, bottom)
        --[[ 
Sets the amount of space the content is inset from the edges of the gridview. Useful if a background image is being used as a border.

 ]]
        playdate.ui.gridview.setContentInset(self._class, left, right, top, bottom)
    end
    function gridview.getCellBounds(self, section, row, column, gridWidth)
        --[[ 
Returns multiple values (x, y, width, height) representing the bounds of the cell, not including padding, relative to the top-right corner of the grid view.

If the grid view is configured with zero width cells (see playdate.ui.gridview:new), gridWidth is required, and should be the same value you would pass to playdate.ui.gridview:drawInRect.

 ]]
        return playdate.ui.gridview.getCellBounds(self._class, section, row, column, gridWidth)
    end
    function gridview.setSectionHeaderHeight(self, height)
        --[[ 
Sets the height of the section headers. 0 by default, which causes section headers not to be drawn.

 ]]
        playdate.ui.gridview.setSectionHeaderHeight(self._class, height)
    end
    function gridview.setSectionHeaderPadding(self, left, right, top, bottom)
        --[[ 
Sets the amount of padding around section headers.

 ]]
        playdate.ui.gridview.setSectionHeaderPadding(self._class, left, right, top, bottom)
    end
    function gridview.setHorizontalDividerHeight(self, height)
        --[[ 
Sets the height of the horizontal dividers. The default height is half the cell height specified when creating the grid view.

 ]]
        playdate.ui.gridview.setHorizontalDividerHeight(self._class, height)
    end
    function gridview.getHorizontalDividerHeight(self)
        --[[ 
Returns the height of the horizontal dividers.

 ]]
        return playdate.ui.gridview.getHorizontalDividerHeight(self._class)
    end
    function gridview.addHorizontalDividerAbove(self, section, row)
        --[[ 
Causes a horizontal divider to be drawn above the specified row. Drawing can be customized by overriding playdate.ui.gridview:drawHorizontalDivider.

 ]]
        playdate.ui.gridview.addHorizontalDividerAbove(self._class, section, row)
    end
    function gridview.removeHorizontalDividers(self)
        --[[ 
Removes all horizontal dividers from the grid view.
Scrolling

 ]]
        playdate.ui.gridview.removeHorizontalDividers(self._class)
    end
    function gridview.setScrollDuration(self, ms)
        --[[ 
Controls the duration of scroll animations. 250ms by default.

 ]]
        playdate.ui.gridview.setScrollDuration(self._class, ms)
    end
    function gridview.setScrollPosition(self, x, y, animated)
        --[[ 
'set' scrolls to the coordinate x, y.

If animated is true (or not provided) the new scroll position is animated to using playdate.ui.gridview.scrollEasingFunction and the value set in playdate.ui.gridview:setScrollDuration().

 ]]
        playdate.ui.gridview.setScrollPosition(self._class, x, y, animated)
    end
    function gridview.getScrollPosition(self)
        --[[ 
Returns the current scroll location as a pair x, y.

 ]]
        return playdate.ui.gridview.getScrollPosition(self._class)
    end
    function gridview.scrollToCell(self, section, row, column, animated)
        --[[ 
Scrolls to the specified cell, just enough so the cell is visible.

 ]]
        playdate.ui.gridview.scrollToCell(self._class, section, row, column, animated)
    end
    function gridview.scrollCellToCenter(self, section, row, column, animated)
        --[[ 
Scrolls to the specified cell, so the cell is centered in the gridview, if possible.

 ]]
        playdate.ui.gridview.scrollCellToCenter(self._class, section, row, column, animated)
    end
    function gridview.scrollToRow(self, row, animated)
        --[[ 
Convenience function for list-style gridviews. Scrolls to the specified row in the list.

 ]]
        playdate.ui.gridview.scrollToRow(self._class, row, animated)
    end
    function gridview.scrollToTop(self, animated)
        --[[ 
Scrolls to the top of the gridview.
Selection

Changing the selection can also change the scroll position. By default cells are scrolled so that they are centered in the gridview, if possible. To change that behavior so the grid is just scrolled enough to make the cell visible, set scrollCellsToCenter to false.

 ]]
        playdate.ui.gridview.scrollToTop(self._class, animated)
    end
    function gridview.setSelection(self, section, row, column)
        --[[ 
Selects the cell at the given position.

 ]]
        playdate.ui.gridview.setSelection(self._class, section, row, column)
    end
    function gridview.getSelection(self)
        --[[ 
Returns the currently-selected cell as section, row, column

 ]]
        return playdate.ui.gridview.getSelection(self._class)
    end
    function gridview.setSelectedRow(self, row)
        --[[ 
Convenience method for list-style gridviews. Selects the cell at row in section 1.

 ]]
        playdate.ui.gridview.setSelectedRow(self._class, row)
    end
    function gridview.getSelectedRow(self)
        --[[ 
Convenience method for list-style gridviews. Returns the selected cell at row in section 1.

 ]]
        return playdate.ui.gridview.getSelectedRow(self._class)
    end
    function gridview.selectNextRow(self, wrapSelection, scrollToSelection, animate)
        --[[ 
Selects the cell directly below the currently-selected cell.

If wrapSelection is true, the selection will wrap around to the opposite end of the grid. If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

 ]]
        playdate.ui.gridview.selectNextRow(self._class, wrapSelection, scrollToSelection, animate)
    end
    function gridview.selectPreviousRow(self, wrapSelection, scrollToSelection, animate)
        --[[ 
Identical to selectNextRow() but goes the other direction.

 ]]
        playdate.ui.gridview.selectPreviousRow(self._class, wrapSelection, scrollToSelection, animate)
    end
    function gridview.selectNextColumn(self, wrapSelection, scrollToSelection, animate)
        --[[ 
Selects the cell directly to the right of the currently-selected cell.

If the last column is currently selected and wrapSelection is true, the selection will wrap around to the opposite side of the grid. If a wrap occurs and the gridview’s changeRowOnColumnWrap is true the row will also be advanced or moved back.

If scrollToSelection is true (or not provided), the newly-selected cell will be scrolled to. If animate is true (or not provided), the scroll will be animated.

 ]]
        playdate.ui.gridview.selectNextColumn(self._class, wrapSelection, scrollToSelection, animate)
    end
    function gridview.selectPreviousColumn(self, wrapSelection, scrollToSelection, animate)
        --[[ 
Identical to selectNextColumn() but goes the other direction.
Properties

 ]]
        playdate.ui.gridview.selectPreviousColumn(self._class, wrapSelection, scrollToSelection, animate)
    end
    return gridview
end, {})