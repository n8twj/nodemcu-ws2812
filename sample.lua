led = require('ws2812rgb')

b = ws2812rgb:new();
b:set( 1, 255,   0,   0 ); -- red
b:set( 2, 255, 128,   0 ); -- orange
b:set( 3, 128, 255,   0 ); -- yellow
b:set( 4,   0, 255,   0 ); -- green
b:set( 5,   0, 255, 255 ); -- cyan
b:set( 6,   0,   0, 255 ); -- blue
b:set( 7, 128,   0, 255 ); -- indigo
b:set( 8, 255,   0, 128 ); -- violet
b:update();

