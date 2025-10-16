 
 push = require 'libs.push'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('libs/font.ttf', 8)

    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'z' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')


    love.graphics.clear(40/255, 45/255, 52/255, 255/255)


    love.graphics.printf("Cute Pong :3", 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Pong?!", 0, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH - 100, 'center')
    push:apply('end')
end

