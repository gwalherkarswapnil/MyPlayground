import Foundation

//Write a generic Swift function that takes a collection of elements (where elements conform to Hashable) and returns all unique permutations of that collection.




func permutation<T> (array: [T]) -> [[T]] where T: Hashable {
    let uniqueElements = Array(Set(array))
    var combination = [[[T]: Int]] ()
    var tempArray = uniqueElements

    for  (index,element) in uniqueElements.enumerated() {
        if combination[index] == nil {
            combination.append([tempArray: index] )
            tempArray.removeLast()
        }
    }
    let result = combination.map({$0.values}) as? [[T]]
    return result ?? []
}

print(permutation(array: [4,5,6,8, 10, 10]))


//You are given an integer array values where values[i] represents the value of the ith sightseeing spot. Two sightseeing spots i and j have a distance j - i between them.
//
//The score of a pair (i < j) of sightseeing spots is values[i] + values[j] + i - j: the sum of the values of the sightseeing spots, minus the distance between them.
//
//Return the maximum score of a pair of sightseeing spots.
//
// 
//
//Example 1:
//
//Input: values = [8,1,5,2,6]
//Output: 11
//Explanation: i = 0, j = 2, values[i] + values[j] + i - j = 8 + 5 + 0 - 2 = 11
//Example 2:
//
//Input: values = [1,2]
//Output: 2
// 
//
//Constraints:
//
//2 <= values.length <= 5 * 104
//1 <= values[i] <= 1000

func maxScoreSightseeingPair(_ values: [Int]) -> Int {
    
    return 0
}


/*Given an integer array nums and an integer k, find three non-overlapping subarrays of length k with maximum sum and return them.
 
 Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.

  

 Example 1:

 Input: nums = [1,2,1,2,6,7,5,1], k = 2
 Output: [0,3,5]
 Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
 We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
 Example 2:

 Input: nums = [1,2,1,2,1,2,1,2,1], k = 2
 Output: [0,2,4]*/
class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        
        var prefixSum = Array(repeating: 0, count: n + 1)
        for i in 0..<n {
            prefixSum[i + 1] = prefixSum[i] + nums[i]
        }
        
        func getSubarraySum(_ start: Int) -> Int {
            return prefixSum[start + k] - prefixSum[start]
        }
        
        var leftBest = Array(repeating: 0, count: n)
        var leftSum = Array(repeating: 0, count: n)
        var maxSum = getSubarraySum(0)
        var maxIndex = 0
        
        for i in 0...(n - k) {
            let currentSum = getSubarraySum(i)
            if currentSum > maxSum {
                maxSum = currentSum
                maxIndex = i
            }
            leftBest[i] = maxIndex
            leftSum[i] = maxSum
        }
        
        var rightBest = Array(repeating: 0, count: n)
        var rightSum = Array(repeating: 0, count: n)
        maxSum = getSubarraySum(n - k)
        maxIndex = n - k
        
        for i in stride(from: n - k, through: 0, by: -1) {
            let currentSum = getSubarraySum(i)
            if currentSum >= maxSum {
                maxSum = currentSum
                maxIndex = i
            }
            rightBest[i] = maxIndex
            rightSum[i] = maxSum
        }
        
        // Find the best combination of three intervals
        var result = [0, 0, 0]
        maxSum = 0
        
        for i in k...(n - 2 * k) {
            let leftIndex = leftBest[i - k]
            let rightIndex = rightBest[i + k]
            let totalSum = leftSum[i - k] + getSubarraySum(i) + rightSum[i + k]
            
            if totalSum > maxSum {
                maxSum = totalSum
                result = [leftIndex, i, rightIndex]
            }
        }
        
        return result
    }
}



//Brute Force Solution

func isAnagram(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    return s.sorted() == t.sorted()
}


//The brute force solution is to check the lengths of s and t, and if they are not equal, return false. Otherwise, compare the sorted s and t strings and return the result.
//
//Time/Space Complexity
//
//Time complexity: Depends on the sorting algorithm, on average O(N log N).
//Space complexity: O(1) or O(N) depending on the sorting algorithm.
//Solution - 2

func isAnagram(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }

    var sDict: [Character: Int] = [:]
    var tDict: [Character: Int] = [:]

    for i in 0 ..< s.count {
        sDict[s[i], default: 0] += 1
        tDict[t[i], default: 0] += 1
    }

    return sDict == tDict
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}



class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
    let chars = Array(s)
    var first = [Character: Int]()
    var last = [Character: Int]()
    
    for i in 0..<chars.count {
        if first[chars[i]] == nil {
            first[chars[i]] = i
        }
        last[chars[i]] = i
    }
    
    var result = Set<String>()
    for mid in 0..<chars.count {
        for c in "abcdefghijklmnopqrstuvwxyz" {
            guard let firstIndex = first[c],
                  let lastIndex = last[c],
                  firstIndex < mid,
                  mid < lastIndex else {
                continue
            }
            result.insert(String([c, chars[mid], c]))
        }
    }
    
    return result.count
    }
}
