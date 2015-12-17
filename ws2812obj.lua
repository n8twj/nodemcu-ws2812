local module = {}

-- setup module pin assignments
module.PIN = 3;
-- create "class" object for led bar
local rgbColor = {}
function rgbColor:new()
    obj = { r=0; g=0; b=0 };
    setmetatable( obj, self );
    self.__index = self;
    return obj;
end;
function rgbColor:red( v )
    if ( v ) then
        self.r = v;
    else
        v = self.r;
    end;
    return v;
end;
function rgbColor:green( v )
    if ( v ) then
        self.g = v;
    else
        v = self.g;
    end;
    return v;
end;
function rgbColor:blue( v )
    if ( v ) then
        self.b = v;
    else
        v = self.b;
    end;
    return v;
end;
function rgbColor:string()
    return string.char( self.r, self.g, self.b );
end;
module.rgbBar = {};
function module.rgbBar:new()
    obj = {
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new(),
        rgbColor:new()
    };
    setmetatable( obj, self );
    self.__index = self;
    return obj;
end;
function module.rgbBar:set( i, r, g, b )
    self[i]:red  ( r );
    self[i]:green( g );
    self[i]:blue ( b );
end;
function module.rgbBar:update()
    local s =
        self[1]:string() ..
        self[2]:string() ..
        self[3]:string() ..
        self[4]:string() ..
        self[5]:string() ..
        self[6]:string() ..
        self[7]:string() ..
        self[8]:string();
    ws2812.writergb( barPin, s );
end;
return module