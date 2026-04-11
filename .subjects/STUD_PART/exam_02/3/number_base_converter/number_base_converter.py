def number_base_converter(number: str, from_base: int, to_base: int) -> str:
    """Convert a number from one base to another.

    Args:
        number: The number string to convert
        from_base: The base of the input number (2-36)
        to_base: The base to convert to (2-36)

    Returns:
        The converted number string, or "ERROR" if invalid input
    """
    if from_base < 2 or from_base > 36 or to_base < 2 or to_base > 36:
        return "ERROR"

    if not number:
        return "ERROR"

    digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    for char in number.upper():
        if char not in digits[:from_base]:
            return "ERROR"

    try:
        decimal_value = 0
        for char in number.upper():
            decimal_value = decimal_value * from_base + digits.index(char)

        if decimal_value == 0:
            return "0"

        result = ""
        while decimal_value > 0:
            result = digits[decimal_value % to_base] + result
            decimal_value //= to_base

        return result

    except (ValueError, IndexError):
        return "ERROR"
