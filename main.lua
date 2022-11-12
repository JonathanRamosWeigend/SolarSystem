
z = 0
phi = 180
radius = 100

function printCounter() 
    width, height = love.window.getDesktopDimensions(1)
    love.graphics.print(z, width - 100, height - 100)
    z = z +1
end

function love.load()
    love.window.setFullscreen(true);
end


function love.draw()
  
    love.graphics.setColor(love.math.colorFromBytes(128, 234, 255))

    x = math.cos(math.rad(phi))
    y = math.sin(math.rad(phi))
    x1 = x * radius
    y1 = y * radius
    xS = x1 + 400
    yS = y1 + 250


    love.graphics.circle( "fill", xS, yS, 20 )
 
    love.graphics.setColor(love.math.colorFromBytes(0xFC, 0xC2, 0x01))
    love.graphics.circle( "fill", 400, 250, 10 )

    printCounter()

    phi   = (phi + 0.1) % 360
end
