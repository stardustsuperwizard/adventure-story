#!/usr/bin/ruby

#rooms
def gold_room
    puts 
    
    print $prompt
    choice = user_choice("this room is full of gold. How much do you take?")

    if /[0-9]/.match(choice)
        how_much = choice.to_i
    else
        gameover("Man, learn to type a number.")
    end

    if how_much < 50
        gameover("You are not greedy, you win!")
    else
        gameover("You are a greedy treasure hunter, you win!")
    end        
end

def bear_room
    puts """
There is a bear in here.
The bear has a bunch of honey.
The bear is also in front of another door.
How are you going to move the bear?
    """
    bear_moved = false

    while true
        choice = user_choice()

        case choice
            when "taunt the bear"
                if !bear_moved
                    output("the bear has moved. You can open the door.")
                    bear_moved = true
                else
                    gameover("The bear gets angry and chews your leg off.")
                end
            when "open the door"
                if bear_moved
                    gold_room
                else
                    gameover("The bear gets angry and chews your arm off.")
                end
            when "take the honey"
                gameover("the bear looks at you and then slaps your face off.")    
            when "go back"
                return
            else
                output("I don't understand. Try again.")
        end
    end
end

def cthulhu_room
    puts """
Here you the great evil Cthulhu.
He, It, Whatever stares at you and you begin to go insane.
Do you flee for your life or eat your head?
"""

    while true
        choice = user_choice
    
        if choice.include? "flee"
            return
        elsif choice.include? "head"
            gameover("Well that was tasty!")
        else
            "the dark one awaits your choice..."
        end
    end
end

#start the game
def start_game
    while true
        puts """
You are in a dark room.
There is a door to your right and left.
Which one do you take?
        """
        choice = user_choice
        bear = false
        cthulhu = false

        if choice.include? "left"
            bear_room
        elsif choice.include? "right"
            cthulhu_room
        elsif !bear && !bear
            gameover("you stumble around the room and until you starve.")
        end
    end
end

# Prompts for the user, and game exit modes.
def gameover(why)
    puts why, "Good Job!"
    exit(0)
end

def output(response)
    puts response
end

def user_choice(*information)
    prompt = '> '
    puts information
    print prompt
    return choice = $stdin.gets.chomp
end

start_game