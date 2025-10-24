


-- How we call a library in Lua
push = require'libs.push'

-- Defining the resolution of the game window.
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- Defines a virtual resolution to help with a more Retro look
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'x' then
        love.event.quit()
    end
end

--function love.update(dt)

--end

function love.draw()
    push:apply('start')

        love.graphics.printf(
            'hello Pong!',
            0,
            VIRTUAL_HEIGHT / 2 - 6,
            VIRTUAL_WIDTH,
            'center')

    push:apply('end')
end

