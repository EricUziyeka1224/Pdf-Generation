//
//  InputVC.swift
//  pdfCreator
//
//  Created by Angelo on 10/24/20.
//  Copyright © 2020 HobbyDev. All rights reserved.
//

import UIKit
import DatePicker
class InputVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var wrapper: UIView!
    @IBOutlet weak var lastView: UIButton!
    @IBOutlet weak var wrapperHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var btn_Pdf: UIButton!
    @IBOutlet weak var btn_Clear: UIButton!
    
    
    @IBOutlet weak var tf_geoX: UITextField!
    @IBOutlet weak var tf_geoY: UITextField!
    @IBOutlet weak var tf_Date: UITextField!
    @IBOutlet weak var tf_Name: UITextField!
    @IBOutlet weak var tf_Relationship: UITextField!
    @IBOutlet weak var tf_Sex: UITextField!
    @IBOutlet weak var tf_Age: UITextField!
    @IBOutlet weak var tf_SubCountry: UITextField!
    @IBOutlet weak var tf_Parish: UITextField!
    @IBOutlet weak var tf_Village: UITextField!
    @IBOutlet weak var tf_Domestic: UITextField!
    @IBOutlet weak var tf_GBVform: UITextField!
    @IBOutlet weak var tf_GBVBy: UITextField!
    @IBOutlet weak var tf_Status: UITextField!
    
    
    
    
    @IBAction func tap_Addbtn(_ sender: Any) {
        if tf_geoY.text != "" && tf_geoX.text != "" && tf_Date.text != "" && tf_Name.text != ""
            && tf_Relationship.text != "" && tf_Sex.text != "" && tf_Age.text != "" && tf_SubCountry.text != ""
            && tf_Parish.text != "" && tf_Village.text != "" && tf_Domestic.text != "" && tf_GBVform.text != ""
            && tf_GBVBy.text != "" && tf_Status.text != ""{
            
            initialDict.updateValue(String(describing: res+1), forKey: "s_no" )
            initialDict.updateValue(tf_geoX.text!, forKey: "value_x" )
            initialDict.updateValue(tf_geoY.text!, forKey: "value_y" )
            initialDict.updateValue(tf_Date.text!, forKey: "date")
            initialDict.updateValue(tf_Name.text!, forKey: "name_of_victim")
            initialDict.updateValue(tf_Relationship.text!, forKey: "relationship" )
            initialDict.updateValue(tf_Sex.text!, forKey: "sex")
            initialDict.updateValue(tf_Age.text!, forKey: "age" )
            initialDict.updateValue(tf_SubCountry.text!, forKey: "sub_county")
            initialDict.updateValue(tf_Parish.text!, forKey: "parish" )
            initialDict.updateValue(tf_Village.text!, forKey: "village" )
            initialDict.updateValue(tf_Domestic.text!, forKey: "domestic_violence" )
            initialDict.updateValue(tf_GBVform.text!, forKey: "gbv_form" )
            initialDict.updateValue(tf_GBVBy.text!, forKey: "gbv_intervention_by" )
            initialDict.updateValue(tf_Status.text!, forKey: "intervention_status")
            
            outputDic.append(initialDict)
            res += 1;
            
            tf_geoX.text = ""
            tf_geoY.text = ""
            tf_Date.text = ""
            tf_Name.text = ""
            tf_Relationship.text = ""
            tf_Sex.text = ""
            tf_Age.text = ""
            tf_SubCountry.text = ""
            tf_Parish.text = ""
            tf_Village.text = ""
            tf_Domestic.text = ""
            tf_GBVform.text = ""
            tf_GBVBy.text = ""
            tf_Status.text = ""
        } else{
            let alert = UIAlertController(title: "Error", message: "Wrong Input!!!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBAction func tap_clearPdf(_ sender: Any) {
        self.outputDic.removeAll()
        res = 0
        
        
    }
    @IBAction func tap_popUpDate(_ sender: Any) {
        
        
        let picker = DatePicker()
        
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.tf_Date.text = "\(selectedDate.day())" + "/" + "\(selectedDate.month())" + "/" + "\(selectedDate.year())"
            } else {
                print("Cancelled")
            }
        }

        picker.show(in: self, on: sender as! UIView)
        
        
    }
    @IBAction func tap_Showbtn(_ sender: Any) {
        if tf_geoY.text != "" && tf_geoX.text != "" && tf_Date.text != "" && tf_Name.text != ""
            && tf_Relationship.text != "" && tf_Sex.text != "" && tf_Age.text != "" && tf_SubCountry.text != ""
            && tf_Parish.text != "" && tf_Village.text != "" && tf_Domestic.text != "" && tf_GBVform.text != ""
            && tf_GBVBy.text != "" && tf_Status.text != ""{
            initialDict.updateValue(String(describing: res+1), forKey: "s_no" )
            initialDict.updateValue(tf_geoX.text!, forKey: "value_x" )
            initialDict.updateValue(tf_geoY.text!, forKey: "value_y" )
            initialDict.updateValue(tf_Date.text!, forKey: "date")
            initialDict.updateValue(tf_Name.text!, forKey: "name_of_victim")
            initialDict.updateValue(tf_Relationship.text!, forKey: "relationship" )
            initialDict.updateValue(tf_Sex.text!, forKey: "sex")
            initialDict.updateValue(tf_Age.text!, forKey: "age" )
            initialDict.updateValue(tf_SubCountry.text!, forKey: "sub_county")
            initialDict.updateValue(tf_Parish.text!, forKey: "parish" )
            initialDict.updateValue(tf_Village.text!, forKey: "village" )
            initialDict.updateValue(tf_Domestic.text!, forKey: "domestic_violence" )
            initialDict.updateValue(tf_GBVform.text!, forKey: "gbv_form" )
            initialDict.updateValue(tf_GBVBy.text!, forKey: "gbv_intervention_by" )
            initialDict.updateValue(tf_Status.text!, forKey: "intervention_status")
            
            outputDic.append(initialDict)
            res += 1
            
            tf_geoX.text = ""
            tf_geoY.text = ""
            tf_Date.text = ""
            tf_Name.text = ""
            tf_Relationship.text = ""
            tf_Sex.text = ""
            tf_Age.text = ""
            tf_SubCountry.text = ""
            tf_Parish.text = ""
            tf_Village.text = ""
            tf_Domestic.text = ""
            tf_GBVform.text = ""
            tf_GBVBy.text = ""
            tf_Status.text = ""            
        }
        if self.outputDic.count != 0 {
            StructClass.glovalVariable.globalDic = self.outputDic
            print(StructClass.glovalVariable.globalDic)
            performSegue(withIdentifier: "ShowPDF", sender: nil)
        }
        
        
    }
    //intialize String value
    
    var selectedRelationship: String?
    var selectedSex: String?
    var selectedDomestic: String?
    var selectedGBVform: String?
    var selectedGBVby: String?
    var selectedStatus: String?
    
    var RelationList = ["Family", "Non-Family"]
    var SexList = ["Male", "Female"]
    var DomesticList = ["Domestic violence", "Forced marriage", "Sexual violence", "Child neglect", "Others"]
    var GBVformList = ["Physical assault", "Rape", "Defilement", "Psychological", "Economic","Others"]
    var GBVbyList = ["Police", "LC", "CDO", "Others"]
    var StatusList = ["Not Started", "Started", "Resolved"]
    
    public var property_status: Int = 0
    var initialDict:[String:String] = ["s_no": "1",
                                       "value_x": "31.56009",
                                       "value_y": "2.59676",
                                       "date": "11/01/2020",
                                       "name_of_victim": "Florence G",
                                       "relationship": "Non family",
                                       "sex": "Female",
                                       "age": "17",
                                       "sub_county": "Alero",
                                       "parish": "Koch",
                                       "village": "Koch",
                                       "domestic_violence": "Sexual violence",
                                       "gbv_form": "Rape",
                                       "gbv_intervention_by": "Police",
                                       "intervention_status": "Not started"]
    
    
    
    var res: Int = 0
    var outputDic = [[String:String]]()
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1{
            return RelationList.count
        }else if pickerView.tag == 2{
            return SexList.count
        }else if pickerView.tag == 3{
            return DomesticList.count
        }else if pickerView.tag == 4{
            return GBVformList.count
        }else if pickerView.tag == 5{
            return GBVbyList.count
        }
            return StatusList.count
    
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return RelationList[row]
        }else if pickerView.tag == 2{
            return SexList[row]
        }else if pickerView.tag == 3{
            return DomesticList[row]
        }else if pickerView.tag == 4{
            return GBVformList[row]
        }else if pickerView.tag == 5{
            return GBVbyList[row]
        }else{
            return StatusList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            selectedRelationship = RelationList[row]
            tf_Relationship.text = selectedRelationship
        }else if pickerView.tag == 2{
            selectedSex = SexList[row]
            tf_Sex.text = selectedSex
        }else if pickerView.tag == 3{
            selectedDomestic = DomesticList[row]
            tf_Domestic.text = selectedDomestic
        }else if pickerView.tag == 4{
            selectedGBVform = GBVformList[row]
            tf_GBVform.text = selectedGBVform
        }else if pickerView.tag == 5{
            selectedGBVby = GBVbyList[row]
            tf_GBVBy.text = selectedGBVby
        }else{
            selectedStatus = StatusList[row]
            tf_Status.text = selectedStatus
        }
    }    
    func createPickerView() {
        scrollView.canCancelContentTouches = false
        
        let pickerView = UIPickerView()
        pickerView.tag = 1
        pickerView.delegate = self
        pickerView.dataSource = self
        tf_Relationship.inputView = pickerView
        pickerView.isExclusiveTouch = true
        
        let pickerView1 = UIPickerView()
        pickerView1.tag = 2
        pickerView1.delegate = self
        pickerView1.dataSource = self
        tf_Sex.inputView = pickerView1
        pickerView1.isExclusiveTouch = true
        
        let pickerView2 = UIPickerView()
        pickerView2.tag = 3
        pickerView2.delegate = self
        tf_Domestic.inputView = pickerView2
        pickerView2.dataSource = self
        pickerView2.isExclusiveTouch = true
        
        let pickerView3 = UIPickerView()
        pickerView3.tag = 4
        pickerView3.delegate = self
        tf_GBVform.inputView = pickerView3
        pickerView3.dataSource = self
        pickerView3.isExclusiveTouch = true
        
        let pickerView4 = UIPickerView()
        pickerView4.tag = 5
        pickerView4.delegate = self
        tf_GBVBy.inputView = pickerView4
        pickerView4.dataSource = self
        pickerView4.isExclusiveTouch = true
        
        let pickerView5 = UIPickerView()
        pickerView5.tag = 6
        pickerView5.delegate = self
        tf_Status.inputView = pickerView5
        pickerView5.dataSource = self
        pickerView5.isExclusiveTouch = true
        
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf_Relationship.inputAccessoryView = toolBar
        tf_Sex.inputAccessoryView = toolBar
        tf_Domestic.inputAccessoryView = toolBar
        tf_GBVform.inputAccessoryView = toolBar
        tf_GBVBy.inputAccessoryView = toolBar
        tf_Status.inputAccessoryView = toolBar
    }
    
    @objc func action() {
       view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Report GBV"
        updateWrapper()
        initUI()
        createPickerView()
        dismissPickerView()
        navigationItem.setHidesBackButton(true, animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationItem.setHidesBackButton(true, animated: true)
        title = "Report GBV"
        updateWrapper()
        createPickerView()
        dismissPickerView()
        initUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Report GBV"
        navigationItem.setHidesBackButton(true, animated: true)
        updateWrapper()
        createPickerView()
        dismissPickerView()
        initUI()
    }
    
    func updateWrapper(){
        let scrollViewHeight = scrollView.frame.height
        let height = lastView.frame.maxY + 20.0
        wrapperHeight.constant = height > scrollViewHeight ? height : scrollViewHeight
        view.layoutIfNeeded()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: wrapperHeight.constant)
    }
    func initUI(){
        tf_geoX.initTextfield()
        tf_geoY.initTextfield()
        tf_Date.initTextfield()
        tf_Name.initTextfield()
        tf_Relationship.initTextfield()
        tf_Sex.initTextfield()
        tf_Age.initTextfield()
        tf_SubCountry.initTextfield()
        tf_Parish.initTextfield()
        tf_Village.initTextfield()
        tf_Domestic.initTextfield()
        tf_GBVform.initTextfield()
        tf_GBVBy.initTextfield()
        tf_Status.initTextfield()
        lastView.layer.cornerRadius = 0.5 * lastView.bounds.size.height
        lastView.clipsToBounds = true
        btn_Pdf.layer.cornerRadius = 0.5 * btn_Pdf.bounds.size.height
        btn_Pdf.clipsToBounds = true
        btn_Clear.layer.cornerRadius = 0.5 * btn_Pdf.bounds.size.height
        btn_Clear.clipsToBounds = true
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UITextField
{
    func initTextfield() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.height
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.rightViewMode = .always
        
        
    }
}
