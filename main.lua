


-- How we call a library in Lua
push = require'libs.push'

-- Defining the resolution of the game window.
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- Defines a virtual resolution to help with a more Retro look
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

player1Score = 0
player2Score = 0
scoreTextPosition = 18

player1Y = VIRTUAL_HEIGHT / 2 - 10
player2Y = VIRTUAL_HEIGHT / 2 - 10



function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('libs/font.ttf', 8)
    scoreFont = love.graphics.newFont('libs/font.ttf', 32)

    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50, 50)

    gameState = 'start'
end

function love.update(dt)

    if love.keyboard.isDown('w') then
        player1Y = math.max(0, player1Y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('s') then
        player1Y = math.min(VIRTUAL_HEIGHT - 20, player1Y + PADDLE_SPEED * dt)
    end

    if love.keyboard.isDown('up') then
        player2Y = math.max(0, player2Y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('down') then
        player2Y = math.min(VIRTUAL_HEIGHT - 20, player2Y + PADDLE_SPEED * dt)
    end


    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'

            ballX = VIRTUAL_WIDTH / 2 - 2
            ballY = VIRTUAL_HEIGHT / 2 - 2

            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50, 50)
            
        end
    end
end


function love.draw()
    push:apply('start')

    love.graphics.clear(50/255, 123/255, 168/255, 255/255)

    
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, scoreTextPosition)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, scoreTextPosition)

    love.graphics.setFont(smallFont)
    love.graphics.print(tostring(gameState), 2, 1)
    love.graphics.rectangle('fill', 10, player1Y, 5, 20) -- Left Paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, player2Y, 5, 20) -- Right Paddle
    love.graphics.rectangle('fill', ballX, ballY, 4, 4) -- Ball

    push:apply('end')
end