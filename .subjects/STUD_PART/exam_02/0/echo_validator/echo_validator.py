def echo_validator(text: str) -> bool:
    """Check if a string is a palindrome, ignoring spaces and case.

    Args:
        text: The string to check

    Returns:
        True if the string is a palindrome (ignoring spaces and case), False otherwise  # noqa: E501
    """
    # Extract only alphabetic characters and convert to lowercase
    cleaned = ''.join(char.lower() for char in text if char.isalpha())

    # Return False for empty strings or strings with no alphabetic characters
    if not cleaned:
        return False

    # Check if cleaned string equals its reverse
    return cleaned == cleaned[::-1]
