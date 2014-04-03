
# Master mind
def play(player, creator, no_turns)
    if player.eql? creator
        puts "You Win!"
        return -1
    elsif no_turns == 0
        puts "You Lose!\nThe solution was #{p2.join(' ')}"
        return -1
    end
    
    pegs = []
    soln = creator.dup
    
    # get white pegs
    player.each {|el|
        if not soln.index(el).nil?
          # delete at index
            soln.delete_at(soln.index(el))
            pegs.push('w')   
        end
    }
    
    #check black ones
    player.each_with_index{|el, i|
        if el == creator[i]
            pegs.delete_at(0)
            pegs.push('b')
        end
    }
    
    puts "Attempt: [#{player.join(' ')}]. Pegs: #{pegs.join(' ')}"
    if no_turns != 1
        puts "Please try again, you have #{no_turns-1} remaining.\n"
    else
        puts "You Lose the solution is #{creator.join(' ')}"
    end
    return no_turns-1, pegs
end

def enter_code(is_creator, pegs=nil, player=nil)
    if is_creator
        puts "Enter the code"
        return gets.chomp.split(' ').map{|x| x.to_i}
    elsif pegs.nil? or player.nil?
        return 4.times.map{|x| rand(6)+1}
    else
        return player.shuffle.first(pegs.length).push(rand(6)+1)
    end
end


no_turns = 12
puts "Enter (Y) if you wish to be creator: "
is_creator = gets.chomp == "Y" ? true : false

creator = enter_code(is_creator)

while no_turns > 0
    player = enter_code((not is_creator))
    no_turns, pegs = play(player, creator, no_turns)
end




