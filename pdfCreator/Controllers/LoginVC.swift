//
//  LoginVC.swift
//  Taxation
//
//  Created by Admin on 1/28/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailWrapper: UIView!
    @IBOutlet weak var emailBgView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordWrapper: UIView!
    @IBOutlet weak var passwordBgView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateWrappers()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Main functions
    
    func initUI() {
        title = "Sign In"
        
        signInButton.shadow()
        registerButton.shadow()
    }
    
    func updateWrappers() {
        emailBgView.layer.cornerRadius = emailBgView.frame.height / 2
        emailBgView.shadow()
        emailWrapper.setRoundBorderEdgeView(cornerRadius: emailWrapper.frame.height / 2, borderWidth: 0.5, borderColor: .darkGray)
        
        passwordBgView.layer.cornerRadius = passwordBgView.frame.height / 2
        passwordBgView.shadow()
        passwordWrapper.setRoundBorderEdgeView(cornerRadius: passwordWrapper.frame.height / 2, borderWidth: 0.5, borderColor: .darkGray)
    }
    
    @IBAction func tapShowPasswordButton(_ sender: Any) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
    }
    
    @IBAction func tapSignInButton(_ sender: Any) {
        if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
                  let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)

                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  alertController.addAction(defaultAction)

                  present(alertController, animated: true, completion: nil)

        }
        else{
            Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                   self.performSegue(withIdentifier: "MainSegue", sender: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
            
        }
        
        
        
        
    }
    
    @IBAction func unwindToLoginVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}
