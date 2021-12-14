//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Francisco Washington de Almeida Oliveira on 14/12/21.
//

import Foundation

class PasswordGenerator{
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords:[String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%&*()_-+=˜`|]}[{:;?/<>.,"
    private let numbers = "012345678"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool,  useSpecialCharacters: Bool){
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    func generate(total: Int) -> [String]{
        passwords.removeAll()
        var universe: String = ""
        if useLetters {
            universe += letters
        }
        if useNumbers{
            universe += numbers
        }
        if useSpecialCharacters{
            universe += specialCharacters
        }
        if useCapitalLetters{
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = "";
            for _ in 1...numberOfCharacters{
                let index  = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
