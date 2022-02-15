//
//  VerifyCodeVC.swift
//  Taxation
//
//  Created by Admin on 1/28/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Firebase

class VerifyCodeVC: UIViewController {
    
    @IBOutlet weak var codeWrapper: UIView!
    @IBOutlet weak var codeBgView: UIView!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.setHidesBackButton(true, animated: true)
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationItem.setHidesBackButton(true, animated: true)
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
        title = "Verify Code"
        
        nextButton.shadow()
    }
    
    func updateWrappers() {
        codeBgView.layer.cornerRadius = codeBgView.frame.height / 2
        codeBgView.shadow()
        codeWrapper.setRoundBorderEdgeView(cornerRadius: codeWrapper.frame.height / 2, borderWidth: 0.5, borderColor: .darkGray)
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        
        let credentials = PhoneAuthProvider.provider().credential(withVerificationID: Globals.Info.veri, verificationCode: codeField.text ?? "000000")
        
        
        
        Auth.auth().signIn(with: credentials) { (success,error) in
            if error == nil {
                self.performSegue(withIdentifier: "VeriMain", sender: nil)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)

                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
            }
        }
        
        
        
        
//        performSegue(withIdentifier: "ShowTerms", sender: nil)
    }

}
