/**
 * Counts the number of vowels in a given string.
 *
 * @param input The string to count vowels in.
 * @return The total number of vowels in the string.
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