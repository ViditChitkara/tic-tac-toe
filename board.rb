system("clear")
require_relative 'tile.rb'
class Board
	@tiles
	attr_accessor :tiles,:order
	def initialize order
		@order=order
		@tiles=[]

		limit=(@order*@order)-1

		for i in 0..limit
		 tile=Tile.new
			@tiles[i]=tile
		end

	end

	def rowcol_To_tile_number row_number,col_number
		(row_number*@order)+col_number
	end	

	def display
		limit=@order-1
		for i in 0..limit
			for j in 0..limit
				 
				tile=@tiles[rowcol_To_tile_number i,j]
								 
				 print "|"+tile.symbol+"|"
				
			end
		  puts
		end
	end

end