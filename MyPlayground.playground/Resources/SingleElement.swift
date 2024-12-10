//
//  SingleElement.swift
//  
//
//  Created by Swapnil on 07/12/24.
//

import Foundation
//func getSingleElement(array: [Int] _ inout) -> Int?  {
//    //If array is having single elements
//    if array.count == 1 {
//        return array.first
//    }
//    
//    // to get single element out we need to find midNumber denote that by m
//    let m = array.count / 2
//    for val in array[m...] {
//        if array.count.isMultiple(of: 2) {
//            let midNumber = array[m - 1]
//            
//            if midNumber == array[m] {
//                continue
//            }
//            return midNumber
//        }
//    }
//
//    return nil
//    
//}


print(getSingleElement(array: &[5,5,6,6,7,8,8,9,9]))
