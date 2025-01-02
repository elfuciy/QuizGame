//
//  LoginController.swift
//  QuizGameMidApp
//
//  Created by Elsever on 30.12.24.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var login: UIButton!
    
    var colorConfigure = ColorConfigurations()
    override func viewDidLoad() {
        super.viewDidLoad()
        colorConfigure.backgroundColor(view)
        errorLabel.isHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        if let nameField = nameField.text, !nameField.isEmpty, let emailField = emailField.text, !emailField.isEmpty {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
//            sceneDelegate.game()
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill all fields"
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = UIColor.red.cgColor
            emailView.layer.borderWidth = 1
            emailView.layer.borderColor = UIColor.red.cgColor
            
        }
       
    }
    
    @IBAction func emailCheck(_ sender: Any) {
        if let email = emailField.text {
            if let error = invalidateEmail(email) {
                errorLabel.text = error
                errorLabel.isHidden = false
            } else {
                errorLabel.isHidden = true
            }
        }
        check()
    }
    
    func invalidateEmail(_ value: String) -> String? {
        let rexExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", rexExp)
        if !predicate.evaluate(with: value) {
            return "Invalid email"
        }
        
        return nil
    }
    
    func check() {
        if errorLabel.isHidden {
            login.isEnabled = true
        } else {
            login.isEnabled = false
        }
    }
    
}
