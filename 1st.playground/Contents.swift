/*
 Roman to Integer
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.
 
 */
class Solution {
    
    enum RNumber: String {
        case I
        case V
        case X
        case L
        case C
        case D
        case M
        
        var num: Int {
            switch self {
            case .I:
                return 1
            case .V:
                return 5
            case .X:
                return 10
            case .L:
                return 50
            case .C:
                return 100
            case .D:
                return 500
            case .M:
                return 1000
            }
        }
    }
    func romanToInt(_ s: String) -> Int {
        var sum = 0
        var first = 0
        var second = first
        
        for i in s {
            first = RNumber(rawValue: "\(i)".uppercased())?.num ?? 0
            print(first, second)
            sum += first
            if first > second {
                sum -= 2 * second
            }
            second = first
        }
        
        return sum
    }
}

Solution().romanToInt("MCMXCIV")

