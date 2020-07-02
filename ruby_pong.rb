require 'ruby2d'

set background: 'navy'

class Paddle
    def initialize(side)
        attr_writer :direction
        @direction = nil
        @y = 160
        if side == :left
            @x = 40
        else
            @x = 600
        end
    end

    def draw
        Rectangle.new(x: @x, y: @y, width: 25, height: 150, color: "white")
    end

    def move
        if @direction == :up 
            @y -= 1
        elsif @direction == :down
            @y += 1
        end
    end
end

player = Paddle.new(:left)

update do
    clear
    
    player.move
    player.draw
end

on :key_down do |event|
    if event.key == 'up'
        player.direction = :up
    elsif event.key == 'down'
        player.direction = :down
    end
end

on :key_up do |event|
end

show