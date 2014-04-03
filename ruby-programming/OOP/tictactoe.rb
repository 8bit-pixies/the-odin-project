#board

class Board
    @@cells = Array.new(3){Array.new(3, "")}

    def display
        @@cells.each { |row|
            puts row.join" | "
            puts "-"*9
        }
    end
    
    def win
        # check if someone has won and return the symbol
        #check each row
        def check_row(board)
            board.any? { |row|
                row.all? {|col| col == row[0] && row[0] != ""}
            }
        end
        
        def check_diag(board)
            arr = []
            board.each_with_index {|el, i|
                arr[i] = el[i]
            }
            arr.all? {|el| el == arr[0] && arr[0] != ""}
        end
        
        [check_row(@@cells), check_row(@@cells.transpose), 
            check_diag(@@cells), check_diag(@@cells.transpose)].any? { |el| el == true }
    end
end

class Player < Board
    
    
    def initialize(piece)
        @piece = piece
        @no_turns = 0
    end
    
    def play_move(row, col)
        # attempts to place piece into cells[row][col]
        if @@cells[row][col] == ""
            @@cells[row][col] = @piece
            @no_turns += 1
            return true
        else
            puts "Invalid move, please enter new move"
            return false
        end
    end
    
    def turns
        return @no_turns
    end
    
    def play
        played = false
        puts "Player #{@piece}, please enter your next move (row, col)"
        while not played
           move = gets.chomp
           move = move.split(' ').map{|x| x.to_i}
           played = play_move(move[0], move[1])
       end
    end
end

def tictactoe
    b = Board.new()
    p1 = Player.new("X")
    p2 = Player.new("O")
    while not b.win
        b.display
        if p1.turns == p2.turns
            p1.play
        else
            p2.play
        end
    end
    
    b.display
    if p1.turns == p2.turns
        puts "Player 2 wins!"
    else
        puts "Player 1 wins!"
    end
       
end

tictactoe
