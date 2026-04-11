def shadow_merge(list1: list[int], list2: list[int]) -> list[int]:
    """Merge two sorted lists into one sorted list.

    Args:
        list1: First sorted list of integers
        list2: Second sorted list of integers

    Returns:
        A new sorted list containing all elements from both input lists
    """
    result = []
    i, j = 0, 0

    # Merge while both lists have elements
    while i < len(list1) and j < len(list2):
        if list1[i] <= list2[j]:
            result.append(list1[i])
            i += 1
        else:
            result.append(list2[j])
            j += 1

    # Add remaining elements from list1
    while i < len(list1):
        result.append(list1[i])
        i += 1

    # Add remaining elements from list2
    while j < len(list2):
        result.append(list2[j])
        j += 1

    return result
