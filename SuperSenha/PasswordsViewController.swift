//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Francisco Washington de Almeida Oliveira on 14/12/21.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPassword: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Total de Senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        generatePasswords();
    }
    func generatePasswords(){
        tvPassword.text = ""
        tvPassword.scrollRangeToVisible(NSRange(location: 0, length: 0))
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords{
            tvPassword.text.append(password + "\n\n")
        }
    }

    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    

}
