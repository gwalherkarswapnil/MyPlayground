//
//  SingleElement.swift
//  
//
//  Created by Swapnil on 07/12/24.
//

import Foundation
func getSingleElement( array: inout [Int] ) -> Int?  {
    //If array is having single elements
    if array.count == 1 {
        return array.first
    }
    
    // to get single element out we need to find midNumber denote that by m
    let m = array.count / 2
    for val in array[m...] {
        if array.count.isMultiple(of: 2) { 
            let midNumber = array[m - 1]
            
            if midNumber == array[m] {
                continue
            }
            return midNumber
        }
    }

    return nil
    
    
    
    
}



func minWindowSubstring(_ strArr: [String]) -> String {
    guard strArr.count == 2 else { return "" }
    let N = strArr[0]
    let K = strArr[1]
    
    // Step 1: Create a frequency map for K
    var freqK: [Character: Int] = [:]
    for char in K {
        freqK[char, default: 0] += 1
    }
    
    // Step 2: Initialize sliding window variables
    var windowCounts: [Character: Int] = [:]
    var start = 0
    var minLen = Int.max
    var minWindow = ""
    var required = freqK.count // Unique characters in K
    var formed = 0 // Characters in the window matching required frequency
    
    // Step 3: Sliding window traversal
    for end in 0..<N.count {
        let endChar = N[N.index(N.startIndex, offsetBy: end)]
        windowCounts[endChar, default: 0] += 1
        
        // Check if this character matches the frequency in freqK
        if let freq = freqK[endChar], windowCounts[endChar] == freq {
            formed += 1
        }
        
        // Step 4: Contract the window if all characters are matched
        while formed == required {
            // Update the smallest window
            let windowLen = end - start + 1
            if windowLen < minLen {
                minLen = windowLen
                let startIdx = N.index(N.startIndex, offsetBy: start)
                let endIdx = N.index(N.startIndex, offsetBy: end)
                minWindow = String(N[startIdx...endIdx])
            }
            
            // Contract from the left
            let startChar = N[N.index(N.startIndex, offsetBy: start)]
            windowCounts[startChar, default: 0] -= 1
            if let freq = freqK[startChar], windowCounts[startChar]! < freq {
                formed -= 1
            }
            start += 1
        }
    }
    
    // Step 5: Return the smallest window found
    return minWindow
}


