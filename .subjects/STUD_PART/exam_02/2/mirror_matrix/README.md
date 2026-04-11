Assignment name  : mirror_matrix
Expected files   : mirror_matrix.py
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that mirrors a 2D matrix horizontally by reversing each row.

Your function must be declared as follows:

def mirror_matrix(matrix: list[list[int]]) -> list[list[int]]:

The function should:
- Take a 2D list (matrix) of integers as input
- Return a new 2D list where each row is reversed horizontally
- Handle matrices of any size (square or rectangular)
- Preserve the original order of rows
- Not modify the original matrix

Examples:

Input: mirror_matrix([[1, 2, 3], [4, 5, 6]])
Output: [[3, 2, 1], [6, 5, 4]]

Input: mirror_matrix([[1, 2], [3, 4], [5, 6]])
Output: [[2, 1], [4, 3], [6, 5]]

Input: mirror_matrix([[7]])
Output: [[7]]

Input: mirror_matrix([[1, 2, 3, 4]])
Output: [[4, 3, 2, 1]]

Input: mirror_matrix([[-1, -2], [-3, -4]])
Output: [[-2, -1], [-4, -3]]