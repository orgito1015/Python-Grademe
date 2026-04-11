Assignment name  : string_sculptor
Expected files   : string_sculptor.py
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that transforms a string by alternating the case of alphabetic
characters only. Non-alphabetic characters remain unchanged and are ignored for
the purpose of alternation. The first alphabetic character should be lowercase,
the second uppercase, the third lowercase, and so on.

Your function must be declared as follows:

def string_sculptor(text: str) -> str:

Examples:

Input: string_sculptor("hello")
Output: "hElLo"

Input: string_sculptor("Hello World")
Output: "hElLo WoRlD"

Input: string_sculptor("abc123def")
Output: "aBc123DeF"

Input: string_sculptor("Python3.9!")
Output: "pYtHoN3.9!"

Input: string_sculptor("")
Output: ""
