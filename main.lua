 
 push = require 'push'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


function love.load()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'p' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.printf(
        "Cute Pong :3",
        0,
        WINDOW_HEIGHT / 2 - 6,
        WINDOW_WIDTH,
        'center')

    love.graphics.printf(
        "Pong?!",
        0,
        WINDOW_HEIGHT / 2 - 30,
        WINDOW_WIDTH - 100,
        'center')
end
