module Constants

  ROWS = ['A', 'B', 'C', 'D']
  COLUMNS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  BLANK_ROOM = ROWS.map { |_row| COLUMNS.map { |_column| 'empty' } }

end