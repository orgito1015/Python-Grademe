def pattern_tracker(text: str) -> int:
    """Count valid consecutive digit pairs in a string.

    Args:
        text: The string to analyze

    Returns:
        Number of valid pairs where second digit is exactly first digit + 1
    """
    count = 0

    for i in range(len(text) - 1):
        # Check if both consecutive characters are digits
        if text[i].isdigit() and text[i + 1].isdigit():
            first_digit = int(text[i])
            second_digit = int(text[i + 1])
            # Check if second digit is exactly first digit + 1
            # Handle wrap-around: 9 followed by 0 is NOT valid
            if second_digit == first_digit + 1:
                count += 1

    return count
