def string_permutation_checker(s1: str, s2: str) -> bool:
    """Determine if two strings are permutations of each other.

    Args:
        s1: First string to compare
        s2: Second string to compare

    Returns:
        True if strings are permutations of each other, False otherwise
    """
    if len(s1) != len(s2):
        return False

    char_count: dict[str, int] = {}

    for char in s1:
        char_count[char] = char_count.get(char, 0) + 1

    for char in s2:
        if char not in char_count:
            return False
        char_count[char] -= 1
        if char_count[char] < 0:
            return False

    return all(count == 0 for count in char_count.values())
