export const rows = ['A', 'B', 'C', 'D'];
export const columns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
export const seats = rows.map((row) => columns.map((column) => `${row}${column}`));
export const initialSeatState = rows.map((_row) => columns.map((_column) => 'empty'));
