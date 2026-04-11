def mirror_matrix(matrix: list[list[int]]) -> list[list[int]]:
    """Mirror a 2D matrix horizontally by reversing each row.

    Args:
        matrix: A 2D list of integers

    Returns:
        A new 2D list where each row is reversed
    """
    return [row[::-1] for row in matrix]
