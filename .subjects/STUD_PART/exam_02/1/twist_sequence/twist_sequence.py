def twist_sequence(arr: list[int], k: int) -> list[int]:
    """Rotate an array to the right by k positions.

    Args:
        arr: List of integers to rotate
        k: Number of positions to rotate right

    Returns:
        A new list rotated k positions to the right
    """
    if not arr:
        return arr

    n = len(arr)
    # Handle k larger than array length using modulo
   k = k % n
    if k == 0:
    return arr[:]
return arr[-k:] + arr[:-k]
