/**
 * @brief Counts the number of vowels in a given string.
 *
 * This function iterates through each character of the input string and
 * increments a counter for every character that is a vowel (both uppercase and lowercase).
 * Supported vowels: a, e, i, o, u (case-insensitive).
 *
 * @param input The string in which vowels are to be counted.
 * @return The total number of vowels in the input string.
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
