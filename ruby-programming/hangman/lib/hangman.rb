require "csv"
require 'erb'

def load_game
    contents = CSV.open "save.csv", headers: true, header_converters: :symbol
    contents.each do |content|
        return content[:letters].split(//), content[:attempts].to_i, content[:word]
    end
end

def choose_word
    lines = File.readlines "5desk.txt"
    words = []
    lines.each do |line|
        l = line.chomp
        if l.length >= 5 && l.length <= 12
            words.push(l)
        end
    end
    return words.shuffle[0]
end

def enter_guess(letters, word, attempts)
    puts "Enter letter for guessing or 'save' to save current game"
    guess = gets.chomp.downcase
    if guess == 'save'
        tsave = File.read "save.erb"
        erb_template = ERB.new tsave
        fsave = erb_template.result(binding)
        
        File.open('save.csv', 'w') do |file|
            file.puts fsave
        end
        exit
    end
    
    return guess[0]
end

def board(letters, word)
    return word.split(//).map {|w| letters.index(w).nil?  ? '_' : w}.join(' ')
end
    
def play(save=false)
    if save
        letters, attempts, word = load_game
    else
        letters = []
        attempts = 12
        word = choose_word
    end
    
    puts "Loading game"
    board(letters, word)
    while attempts > 0 
        letter = enter_guess(letters, word, attempts)
        letters.push(letter)
        soln = board(letters, word)
        puts soln
        
        if soln.split(//).index('_').nil?
            attempts = -1
            puts "You found the word"
            break
        elsif word.index(letter).nil?
            attempts = attempts -1
            puts "Letter not found in this word, you have #{attempts} remaining"
        else
            puts "Letter found! You have #{attempts} remaining"
        end
    end
end


puts "Starting up Hangman..."
puts "enter 'load' to load save game, otherwise a new game will commerce"
opt = gets.chomp
play(save=(opt=='load'))




