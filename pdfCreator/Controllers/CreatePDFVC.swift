//
//  CreatePDFVC.swift
//  pdfCreator
//
//  Created by Admin on 10/29/20.
//  Copyright © 2020 HobbyDev. All rights reserved.
//

import UIKit
import QuickLook

let FieldsInfo: [String: [String: Any]] = [G.s_no: [G.field_index: 0, G.field_key: G.s_no, G.field_name: "S/No", G.field_width_rate: CGFloat(1.0)],
                                           G.value_x: [G.field_index: 1, G.field_key: G.value_x, G.field_name: "X", G.field_width_rate: CGFloat(0.9)],
                                           G.value_y: [G.field_index: 2, G.field_key: G.value_y, G.field_name: "Y", G.field_width_rate: CGFloat(0.9)],
                                           G.date: [G.field_index: 3, G.field_key: G.date, G.field_name: "Date", G.field_width_rate: CGFloat(1.9)],
                                           G.name_of_victim: [G.field_index: 4, G.field_key: G.name_of_victim, G.field_name: "Name of Victim", G.field_width_rate: CGFloat(1.2)],
                                           G.relationship: [G.field_index: 5, G.field_key: G.relationship, G.field_name: "Relationship\nwith the\nperpetrator", G.field_width_rate: CGFloat(1.0)],
                                           G.sex: [G.field_index: 6, G.field_key: G.sex, G.field_name: "Sex", G.field_width_rate: CGFloat(1.0)],
                                           G.age: [G.field_index: 7, G.field_key: G.age, G.field_name: "Age", G.field_width_rate: CGFloat(0.9)],
                                           G.sub_county: [G.field_index: 8, G.field_key: G.sub_county, G.field_name: "Sub-county", G.field_width_rate: CGFloat(0.9)],
                                           G.parish: [G.field_index: 9, G.field_key: G.parish, G.field_name: "Parish", G.field_width_rate: CGFloat(0.9)],
                                           G.village: [G.field_index: 10, G.field_key: G.village, G.field_name: "Village", G.field_width_rate: CGFloat(0.9)],
                                           G.domestic_violence: [G.field_index: 11, G.field_key: G.domestic_violence, G.field_name: "Domestic violence", G.field_width_rate: CGFloat(1.3)],
                                           G.gbv_form: [G.field_index: 12, G.field_key: G.gbv_form, G.field_name: "GBV form", G.field_width_rate: CGFloat(1.0)],
                                           G.gbv_intervention_by: [G.field_index: 13, G.field_key: G.gbv_intervention_by, G.field_name: "GBV Intervention by", G.field_width_rate: CGFloat(1.9)],
                                           G.intervention_status: [G.field_index: 14, G.field_key: G.intervention_status, G.field_name: "Intervention Status", G.field_width_rate: CGFloat(1.3)]]

let HeaderFont = UIFont.boldSystemFont(ofSize: 17.0)
let DataFont = UIFont.systemFont(ofSize: 17.0)


class CreatePDFVC: UIViewController {

    @IBOutlet weak var pdfScrollView: UIScrollView!
    @IBOutlet weak var pdfTableView: UITableView!
    @IBOutlet weak var pdfTableViewWidth: NSLayoutConstraint!
    
    var pdfDatas = [PDFData]()
    
    var unitWidth: CGFloat = 0.0
    
    
    var quickLookController:QLPreviewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = ""
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.navigationBar.backItem?.title = ""
        updateWrappers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backItem?.title = ""
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func updateWrappers() {
        var totalRates: CGFloat = 0.0
        for key in FieldsInfo.keys {
            let fieldInfo = FieldsInfo[key]!
            let rate = fieldInfo[G.field_width_rate] as! CGFloat
            totalRates += rate
        }
        pdfTableViewWidth.constant = unitWidth * totalRates
        view.layoutIfNeeded()
        
        pdfScrollView.contentSize = CGSize(width: pdfTableViewWidth.constant, height: pdfScrollView.frame.height)
    }
    
    func setupUI() {
        title = "Create PDF"
        
        unitWidth = "Relationship\nwith the\nperpetrator".width(withConstrainedHeight: 80.0, font: HeaderFont) + 50.0
        
        loadPDFData()
    }
    
    func loadPDFData() {
        var widthInfo = [String: CGFloat]()
        for key in FieldsInfo.keys {
            let fieldInfo = FieldsInfo[key]!
            let rate = fieldInfo[G.field_width_rate] as! CGFloat
            widthInfo[key] = unitWidth * rate
        }
        
        // test code
        for info in StructClass.glovalVariable.globalDic {            
            let data = PDFData(info: info, widthInfo: widthInfo)
            pdfDatas.append(data)
        }
        // test
        
        pdfTableView.reloadData()
    }
    
    @IBAction func tapDoneButton(_ sender: Any) {
//        let pdfFilePath = self.pdfTableView.exportAsPdfFromTable()
        let renderView = self.renderViewFromPDFData()
        let pdfFilePath = renderView.exportAsPdfFromView()
        
        intializeQuicklook()
        //Show PDF in QuickLook
        viewPDF()
        print(pdfFilePath)
    }

    func renderViewFromPDFData() -> UIView {
        let width = pdfTableViewWidth.constant
        
        let renderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: 0.0))
        renderView.backgroundColor = UIColor.white
        renderView.layer.borderWidth = 1.0
        renderView.layer.borderColor = UIColor.black.cgColor
        
        
        let headerRowView = generateHeaderRowView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: 80.0))
        renderView.addSubview(headerRowView)
        
        var height: CGFloat = 80.0
        for data in pdfDatas {
            let rowHeight = data.maxHeight
            let rowView = generateRowView(frame: CGRect(x: 0.0, y: height, width: width, height: rowHeight), data: data)
            renderView.addSubview(rowView)
            
            height += rowHeight
        }
        renderView.frame.size.height = height
        
        return renderView
    }
    
    func generateHeaderRowView(frame: CGRect) -> UIView {
        let rowView = UIView(frame: frame)
        rowView.backgroundColor = UIColor.clear
        
        let fields = FieldsInfo.values.sorted { (field1, field2) -> Bool in
            return (field1[G.field_index] as! Int) < (field2[G.field_index] as! Int)
        }
        
        var originX: CGFloat = 0.0
        for field in fields {
            let value = field[G.field_name] as! String
            let rate = field[G.field_width_rate] as! CGFloat
            let width = unitWidth * rate
            let valueHeight = value.height(withConstrainedWidth: width, font: HeaderFont) + 10.0
            
            let fieldView = FieldView(frame: CGRect(x: originX, y: 0.0, width: width, height: frame.height))
            fieldView.setValue(value: value, height: valueHeight, font: HeaderFont)
            rowView.addSubview(fieldView)
            
            originX += width
        }
        
        return rowView
    }
    
    func generateRowView(frame: CGRect, data: PDFData) -> UIView {
        let rowView = UIView(frame: frame)
        rowView.backgroundColor = UIColor.clear
        
        let fields = FieldsInfo.values.sorted { (field1, field2) -> Bool in
            return (field1[G.field_index] as! Int) < (field2[G.field_index] as! Int)
        }
        
        var originX: CGFloat = 0.0
        for field in fields {
            let key = field[G.field_key] as! String
            let valueSize = data.getValueSize(key: key)
            let fieldView = FieldView(frame: CGRect(x: originX, y: 0.0, width: valueSize.width + 10.0, height: frame.height))
            fieldView.setValue(value: data.dataInfo[key] ?? "", height: valueSize.height, font: DataFont)
            rowView.addSubview(fieldView)
            
            originX += valueSize.width + 10.0
        }
        
        return rowView
    }

}


extension CreatePDFVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pdfDatas.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 40
        if indexPath.row == 0 {
            height = 80.0
        }
        else {
            let pdfData = pdfDatas[indexPath.row - 1]
            height = pdfData.maxHeight
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PDFHeaderCell", for: indexPath)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PDFDataCell", for: indexPath) as! PDFCell
            
            let data = pdfDatas[indexPath.row - 1]
            
            cell.sNoLabel.text = data.dataInfo[G.s_no] ?? ""
            cell.valueXLabel.text = data.dataInfo[G.value_x] ?? ""
            cell.valueYLabel.text = data.dataInfo[G.value_y] ?? ""
            cell.dateLabel.text = data.dataInfo[G.date] ?? ""
            cell.nameOfVictimLabel.text = data.dataInfo[G.name_of_victim] ?? ""
            cell.relationshipLabel.text = data.dataInfo[G.relationship] ?? ""
            cell.sexLabel.text = data.dataInfo[G.sex] ?? ""
            cell.ageLabel.text = data.dataInfo[G.age] ?? ""
            cell.subCountyLabel.text = data.dataInfo[G.sub_county] ?? ""
            cell.parishLabel.text = data.dataInfo[G.parish] ?? ""
            cell.villageLabel.text = data.dataInfo[G.village] ?? ""
            cell.domesticViolenceLabel.text = data.dataInfo[G.domestic_violence] ?? ""
            cell.gbvFormLabel.text = data.dataInfo[G.gbv_form] ?? ""
            cell.gbvInterventionByLabel.text = data.dataInfo[G.gbv_intervention_by] ?? ""
            cell.interventionStatusLabel.text = data.dataInfo[G.intervention_status] ?? ""
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


struct G {
    static var age = "age"
    static var date = "date"
    static var domestic_violence = "domestic_violence"
    static var field_index = "field_index"
    static var field_key = "field_key"
    static var field_name = "field_name"
    static var field_width_rate = "field_width_rate"
    static var gbv_form = "gbv_form"
    static var gbv_intervention_by = "gbv_intervention_by"
    static var intervention_status = "intervention_status"
    static var name_of_victim = "name_of_victim"
    static var parish = "parish"
    static var relationship = "relationship"
    static var s_no = "s_no"
    static var sex = "sex"
    static var sub_county = "sub_county"
    static var value_x = "value_x"
    static var value_y = "value_y"
    static var village = "village"
}
//extension CreatePDFVC:UICollectionViewDelegate,
//UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: (self.view.bounds.width/3)-10, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionVIew.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        if let label =  cell.viewWithTag(2) as? UILabel {
//            label.text = UUID.init().uuidString
//        }
//        return cell
//    }
//}

//MARK: PDF viewer
extension CreatePDFVC {
    func intializeQuicklook(){
        quickLookController = QLPreviewController.init()
        self.quickLookController.dataSource = self
    }
    func viewPDF() {
        DispatchQueue.main.async {
            self.present(self.quickLookController, animated: true, completion: nil)
        }
        
    }
}
extension CreatePDFVC:QLPreviewControllerDataSource{
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let renderView = self.renderViewFromPDFData()
        let pdfFilePath = renderView.exportAsPdfFromView()
        
        let fileURL = URL(fileURLWithPath: pdfFilePath)
        print(fileURL)
        return fileURL as QLPreviewItem
        
    }
    
    
    
}

