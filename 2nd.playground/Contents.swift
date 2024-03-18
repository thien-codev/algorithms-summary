/*
 Longest Substring Without Repeating Characters
 
 Given a string s, find the length of the longest
 substring
  without repeating characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */

class Solution {
    // First solution
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var differChars: ArraySlice<Character> = []
        
        for i in s {
            if let index = differChars.firstIndex(of: i) {
                differChars.append(i)
                differChars = differChars.suffix(from: index + 1)
            } else {
                differChars.append(i)
                if differChars.count > result {
                    result = differChars.count
                }
            }
            
            print(i, result, differChars)
        }
        
        return result
    }
    
    // Second solution
    func lengthOfLongestSubstring2nd(_ s: String) -> Int {
        var result = 0
        var startIndex = -1
        var differChars: Dictionary<Character, Int> = .init()
        
        for (i, value) in s.enumerated() {
            if let lastSeen = differChars[value] {
                if startIndex < lastSeen {
                    startIndex = lastSeen
                }
            }
            differChars[value] = i
            
            if i - startIndex > result {
                result = i - startIndex
            }
        }
        
        return result
    }
    
}

Solution().lengthOfLongestSubstring2nd("dvdf")
