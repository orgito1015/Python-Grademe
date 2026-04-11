import sys


def string_sculptor(text: str) -> str:
    """Transform string by alternating case of alphabetic characters.

    Args:
        text: The string to transform

    Returns:
        String with alternating case for alphabetic chars, non-alphabetic unchanged  # noqa: E501
    """
    result = []
    alpha_count = 0

    for char in text:
        if char.isalpha():
            # First alphabetic char (index 0) should be lowercase
            if alpha_count % 2 == 0:
                result.append(char.lower())
            else:
                result.append(char.upper())
            alpha_count += 1
        else:
            # Keep non-alphabetic characters unchanged
            result.append(char)

    return ''.join(result)


def main() -> None:
    """Run the string sculptor transformation from CLI input."""
    if len(sys.argv) > 1:
        text = ' '.join(sys.argv[1:])
    else:
        text = sys.stdin.read().rstrip('\n')

    print(string_sculptor(text))


if __name__ == '__main__':
    main()
