			require_relative 'tile.rb'
			require_relative 'board.rb'

	class GameStatus

			@order
			@board
			@player_one_turn
			@player_two_turn
			@first
			@second

		def initialize
			@order=gets.chomp.to_i

			@board=Board.new @order

			@board.display

			@first="player 1"

			@second="player 2"

			@player_one_turn = true
			@player_two_turn = false

			puts "Enter Symbol for player 1"
			@player_one=gets.chomp

			puts "Enter Symbol for player 2"
			@player_two=gets.chomp

			while !game_over 
			if @player_one_turn 
				
				puts "Player 1's turn"		
				puts "x = "
				x=gets.chomp.to_i
				puts "y = "
				y=gets.chomp.to_i
				tile_num=@board.rowcol_To_tile_number x,y
				while tile_num>@order*@order-1 || @board.tiles[tile_num].symbol!=" "
				puts "Player 1's turn"		
				puts "x = "
				x=gets.chomp.to_i
				puts "y = "
				y=gets.chomp.to_i
				tile_num=@board.rowcol_To_tile_number x,y
				end 
				@tile=@board.tiles[tile_num]
				@tile.symbol=@player_one
				@player_one_turn=false
				@player_two_turn=true

			  else 
				puts "Player 2's turn"
				puts "x="
				x=gets.chomp.to_i
				puts "y="
				y=gets.chomp.to_i
				tile_num=@board.rowcol_To_tile_number x,y
				while tile_num>@order*@order-1 || @board.tiles[tile_num].symbol!=" "
				puts "Player 2's turn"		
				puts "x = "
				x=gets.chomp.to_i
				puts "y = "
				y=gets.chomp.to_i
				tile_num=@board.rowcol_To_tile_number x,y
				end 
				@tile=@board.tiles[tile_num]
				@tile.symbol=@player_two
				@player_one_turn=true
				@player_two_turn=false
			end

			@board.display	
			end

		end




			def game_over 
					if @player_two_turn
					player_turn @first,@player_one
					

					elsif @player_one_turn
					player_turn @second,@player_two
				

					else

					return false

					end
			end

			def player_turn player,player_symbol

					counter=0
					for i in 0...@order*@order
							tile=@board.tiles[i]
							if tile.symbol!=" "
								counter+=1
							end
						if counter==@order*@order

						puts "Its a draw"
						return true

						end

					end


					counter=0
					for i in 0...@order
						
							tile=@board.tiles[@board.rowcol_To_tile_number i,@order-1-i]
							if tile.symbol==player_symbol
								counter=counter+1							
							end
					end
						if(counter==@order)
						puts "#{player} won"
						return true
					end

					counter=0
					for i in 0...@order
						for j in 0...@order
							tile=@board.tiles[@board.rowcol_To_tile_number i,j]
							if tile.symbol==player_symbol
								counter=counter+1
							end
						end
						if(counter==@order)
						puts "#{player} won"
						return true
					    else
					    counter=0
						end
					end
					counter=0
					for i in 0...@order
						for j in 0...@order
							tile=@board.tiles[@board.rowcol_To_tile_number j,i]
							if tile.symbol==player_symbol
								counter=counter+1
							end
						end
						if(counter==@order)
						puts "#{player} won"
						return true
					    else
					    counter=0
						end
					end
					counter=0
					for i in 0...@order
						tile=@board.tiles[@board.rowcol_To_tile_number i,i]
						if tile.symbol==player_symbol
							counter=counter+1
						end
					end
					if(counter==@order)
					puts "#{player} won"
					return true
					end
					counter=0
					for i in 0...@order
						tile=@board.tiles[@board.rowcol_To_tile_number i,@order-i]
						if tile.symbol==player_symbol
							counter=counter+1
						end
					end
					if(counter==@order)
					puts "#{player} won"
					return true
					end
				end
	end