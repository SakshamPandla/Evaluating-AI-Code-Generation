/**
 * @brief Counts the number of vowels in a given string.
 *
 * This function iterates through the input string and counts
 * how many characters are vowels (a, e, i, o, u, case-insensitive).
 *
 * @param input The string to count vowels from.
 * @return The total number of vowels found in the string.
 */
int countVowels(const std::string& input) {
    int count = 0;
    const std::string vowels = "aeiouAEIOU";

    for(char c : input) {
        if(vowels.find(c) != std::string::npos) {
            count++;
        }
    }
    return count;
}