//
//  SignupVC.swift
//  Taxation
//
//  Created by Admin on 1/28/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameWrapper: UIView!
    @IBOutlet weak var nameBgView: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailWrapper: UIView!
    @IBOutlet weak var emailBgView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordWrapper: UIView!
    @IBOutlet weak var passwordBgView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.setHidesBackButton(true, animated: true)
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
        title = "Registration"
        
        doneButton.shadow()
    }
    
    func updateWrappers() {
        nameBgView.layer.cornerRadius = nameBgView.frame.height / 2
        nameBgView.shadow()
        nameWrapper.setRoundBorderEdgeView(cornerRadius: nameWrapper.frame.height / 2, borderWidth: 0.5, borderColor: .darkGray)
        
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
    
    @IBAction func tapDoneButton(_ sender: Any) {
      if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
                  let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)

                  let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  alertController.addAction(defaultAction)

                  present(alertController, animated: true, completion: nil)

        }
        else{
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in

                if error == nil {
                    print("You have successfully signed up")
                    self.performSegue(withIdentifier: "ShowTermsVC", sender: nil)

                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)

                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)

                    self.present(alertController, animated: true, completion: nil)
                }
            }


        }
        
    
    }
}
