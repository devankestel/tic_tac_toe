class Board
  attr_reader :values

  def initialize
    values = [[],[],[]]
      values.each do |row|
        3.times do
        row << "_" 
      end
    end
    @values = values
  end
  def modify(row, col, mark)
    @values[row][col] = mark
  end
  def empty?
    @values.flatten.all?{|value| value == "_"}
  end
  def full?
    @values.flatten.all?{|value| value != "_"}
  end
  def to_s
    display = ""
    @values.each do |row|
      display += "#{row[0]} #{row[1]} #{row[2]}\n" 
    end
    return display
  end
  def cols
    col1 = []
    col2 = []
    col3 = []
    cols = [col1, col2, col3]
    @values.each do |row|
      col1 << row[0]
      col2 << row[1]
      col3 << row[2]
    end
    return cols
  end
  def diags
    diag1 = [values[0][0], values[1][1], values[2][2]]
    diag2 = [values[2][0], values[1][1], values[0][2]]
    diags = [diag1, diag2]
  end
  
  def row_win?
    row1_win = @values[0].all?{|value| value == "X"} || @values[0].all?{|value| value == "O"}
    row2_win = @values[1].all?{|value| value == "X"} || @values[1].all?{|value| value == "O"}
    row3_win = @values[2].all?{|value| value == "X"} || @values[2].all?{|value| value == "O"}

    row1_win || row2_win || row3_win
  end
  def col_win?
    col1_win = self.cols[0].all?{|value| value == "X"} || self.cols[0].all?{|value| value == "O"}
    col2_win = self.cols[1].all?{|value| value == "X"} || self.cols[1].all?{|value| value == "O"}
    col3_win = self.cols[2].all?{|value| value == "X"} || self.cols[2].all?{|value| value == "O"}

    col1_win || col2_win || col3_win
  end
  def diag_win?
    diag1_win = self.diags[0].all?{|value| value == "X"} || self.diags[0].all?{|value| value == "O"}
    diag2_win = self.diags[1].all?{|value| value == "X"} || self.diags[1].all?{|value| value == "O"}

    diag1_win || diag2_win
  end

  def win?
    
     self.row_win? || self.col_win? || self.diag_win?   
  end

end