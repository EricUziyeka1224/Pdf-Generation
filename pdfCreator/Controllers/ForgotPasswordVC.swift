//
//  ForgotPasswordVC.swift
//  Taxation
//
//  Created by Admin on 1/28/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import Firebase

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var phoneWrapper: UIView!
    @IBOutlet weak var flagButton: UIButton!
    @IBOutlet weak var phoneCodeLabel: UILabel!
    @IBOutlet weak var phoneNumberWrapper: UIView!
    @IBOutlet weak var phoneNumberBgView: UIView!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var fpnTextField: FPNTextField!
    
    
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
        title = "Find Password"
        
        nextButton.shadow()
        
        let actions = fpnTextField.flagButton.actions(forTarget: fpnTextField, forControlEvent: .touchUpInside)
        flagButton.addTarget(fpnTextField, action: Selector(actions![0]), for: .touchUpInside)
    }
    
    func updateWrappers() {
        flagButton.layer.cornerRadius = flagButton.frame.height / 2
        
        phoneNumberBgView.layer.cornerRadius = phoneNumberBgView.frame.height / 2
        phoneNumberBgView.shadow()
        phoneNumberWrapper.setRoundBorderEdgeView(cornerRadius: phoneNumberWrapper.frame.height / 2, borderWidth: 0.5, borderColor: .darkGray)
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        
        var phonenumber = (phoneCodeLabel.text ?? "1") + (phoneNumberField.text ?? "1234567890")
        print(phonenumber)

        PhoneAuthProvider.provider().verifyPhoneNumber(phonenumber, uiDelegate: nil)   { (verificationId,error) in
            if error == nil{
                Globals.Info.veri = verificationId ?? "000000"
                print(verificationId ?? "123456")
                self.showAlert(title: "The code has been sent to your phone") { (action) in
                    self.performSegue(withIdentifier: "ShowVerifyCodeVC", sender: nil)
                }
            }
            else{
                print("unable to secret phone verification")
            }

        }
        
        
        
    }
}


extension ForgotPasswordVC: FPNTextFieldDelegate {

    func fpnDisplayCountryList() {}

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {

        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
            textField.getRawPhoneNumber() ?? "Raw: nil"
        )
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
        
        var selectedFlag: UIImage?
        if let flag = UIImage(named: code, in: Bundle.FlagIcons, compatibleWith: nil) {
            selectedFlag = flag
        } else {
            selectedFlag = UIImage(named: "unknown", in: Bundle.FlagIcons, compatibleWith: nil)
        }
        
        flagButton.setBackgroundImage(selectedFlag, for: .normal)
        phoneCodeLabel.text = dialCode
    }
}
