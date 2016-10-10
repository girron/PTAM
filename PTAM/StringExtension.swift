//
//  StringExtension.swift
//  PTAM
//
//  Created by Henry Swanson on 9/28/16.
//  Copyright © 2016 PorkChopExpress. All rights reserved.
//

import Foundation

extension String {
    
    func isAnagramOfString(_ s: String) -> Bool {
        // 1
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        
        // 2
        return lowerSelf.characters.sorted() == lowerOther.characters.sorted()
    }
    
    func isPalindrome() -> Bool {
        // 1
        
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        
        //2 
        let s = String(f.characters.reversed())
        
        //3
        return f == s
    }
}
