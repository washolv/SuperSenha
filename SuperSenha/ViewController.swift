//
//  ViewController.swift
//  SuperSenha
//
//  Created by Francisco Washington de Almeida Oliveira on 14/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var tfNumberOfCaracters: UITextField!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var tfTotalPasswords: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController;
        if let numberOfPassword = Int(tfTotalPasswords.text!){
            passwordsViewController.numberOfPasswords = numberOfPassword
        }
        if let numberOfCharacters = Int(tfNumberOfCaracters.text!){
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        view.endEditing(true)
    }

}

