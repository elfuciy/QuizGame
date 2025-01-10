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
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var login: UIButton!
    
    var colorConfigure = ColorConfigurations()
    var helper = FileManagerHelper()
    var userArray = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorConfigure.backgroundColor(view)
        errorLabel.isHidden = true
        
        helper.readData { user in
            userArray = user
        }
    }
    
    @IBAction func login(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        if let nameField = nameField.text {
            UserDefaults.standard.set(nameField, forKey: "username")
//            let name = userArray.filter({ $0.username == nameField}).first?.username
            print(userArray.filter({ $0.username == nameField}).first?.username)
            if userArray.filter({ $0.username == nameField}).first?.username == nil {
                DataSaver().dataSave(name: nameField)
                let user: UserModel = UserModel(username: nameField, point: 0)
                userArray.append(user)
                helper.saveData(user: userArray)
            }
        
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
            sceneDelegate.startGame()
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter You name"
            nameView.layer.borderWidth = 1
            nameView.layer.borderColor = UIColor.red.cgColor
        }
    }
}
