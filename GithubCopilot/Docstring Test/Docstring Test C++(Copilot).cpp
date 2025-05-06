/**
 * @brief Counts the number of vowels in a given string.
 *
 * This function iterates through each character of the input string and
 * checks if it is a vowel (case-insensitive). It considers 'a', 'e', 'i', 
 * 'o', and 'u' as vowels. The function then returns the total count of vowels.
 *
 * @param input The input string in which vowels are to be counted.
 * @return The number of vowels in the input string.
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