local ws2812rgb = {};
function ws2812rgb:new( p, c )
    obj       = {};
    obj.pin   = p or 0;
    obj.count = c or 0;
    for i = 1, c, 1 do
        obj[i] = { 0, 0, 0 }
    end;
    setmetatable( obj, self );
    self.__index = self;
    return obj;
end;
function ws2812rgb:set( i, r, g, b )
    self[i][1] = ( r );
    self[i][2] = ( g );
    self[i][3] = ( b );
end;
function ws2812rgb:get( i )
    c = self[i];
    return string.char( c[1], c[2], c[3] );
end;
function ws2812rgb:update()
    local s = "";
    for i = 1, self.count, 1 do
        s = s .. self:get(i);
    end;
    ws2812.writergb( self.pin, s );
end;
return ws2812rgb;
