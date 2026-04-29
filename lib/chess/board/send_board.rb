# Send board module
module SendBoard
  def send_board
    puts generate_board
  end

  def generate_board
    board_rows = []
    @board.each_with_index do |row, i|
      board_rows << board_row(row, i)
    end
    board_rows.reverse
  end

  def board_row(row, index)
    if index.even?
      "\e[40m #{piece(row[0])} \e[47m\e[30m #{piece(row[1])} \e[40m #{piece(row[2])} \e[47m\e[30m #{piece(row[3])} \e[40m #{piece(row[4])} \e[47m\e[30m #{piece(row[5])} \e[40m #{piece(row[6])} \e[47m\e[30m #{piece(row[7])} \e[0m"
    else
      "\e[47m\e[30m #{piece(row[0])} \e[40m #{piece(row[1])} \e[47m\e[30m #{piece(row[2])} \e[40m #{piece(row[3])} \e[47m\e[30m #{piece(row[4])} \e[40m #{piece(row[5])} \e[47m\e[30m #{piece(row[6])} \e[40m #{piece(row[7])} \e[0m"
    end
  end

  def piece(item)
    return ' ' if item.nil?

    item.bp
  end
end
