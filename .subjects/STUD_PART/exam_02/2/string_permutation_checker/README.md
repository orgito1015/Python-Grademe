Assignment name  : string_permutation_checker
Expected files   : string_permutation_checker.py
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that determines if two strings are permutations of each other.
Two strings are permutations if they contain the same characters with the same frequencies.

Your function must be declared as follows:

def string_permutation_checker(s1: str, s2: str) -> bool:

The function should:
- Check if both strings contain exactly the same characters
- Count character frequencies (case-sensitive)
- Return True if strings are permutations, False otherwise
- Handle empty strings (two empty strings are permutations)
- Consider whitespace and punctuation as regular characters

Examples:

Input: string_permutation_checker("abc", "bca")
Output: True

Input: string_permutation_checker("abc", "def")
Output: False

Input: string_permutation_checker("listen", "silent")
Output: True

Input: string_permutation_checker("hello", "bello")
Output: False

Input: string_permutation_checker("", "")
Output: True

Input: string_permutation_checker("a", "")
Output: False

Input: string_permutation_checker("Abc", "abc")
Output: False

Input: string_permutation_checker("a gentleman", "elegant man")
Output: True