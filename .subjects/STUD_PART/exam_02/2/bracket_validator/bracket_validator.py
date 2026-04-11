def bracket_validator(s: str) -> bool:
    """Check if brackets, parentheses, and braces are properly balanced and nested.  # noqa: E501

    Args:
        s: The input string to validate

    Returns:
        True if brackets are balanced and properly nested, False otherwise
    """
    stack = []
    bracket_map = {')': '(', ']': '[', '}': '{'}

    for char in s:
        if char in '([{':
            stack.append(char)
        elif char in ')]}':
            if not stack or stack[-1] != bracket_map[char]:
                return False
            stack.pop()

    return len(stack) == 0
