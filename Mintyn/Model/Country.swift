//
//  Country.swift
//  Mintyn
//
//  Created by Faruk Amoo on 10/03/2025.
//


// Custom Country model
struct Country {
    let code: String
    let name: String
    let dialCode: String
    
    var flag: String {
        let base: UInt32 = 127397
        var flagString = ""
        for scalar in code.uppercased().unicodeScalars {
            flagString.append(String(UnicodeScalar(base + scalar.value)!))
        }
        return flagString
    }
}