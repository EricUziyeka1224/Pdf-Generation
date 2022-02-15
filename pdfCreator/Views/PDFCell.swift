//
//  PDFCell.swift
//  pdfCreator
//
//  Created by Admin on 10/28/20.
//  Copyright © 2020 HobbyDev. All rights reserved.
//

import UIKit

class PDFCell: UITableViewCell {
    
    @IBOutlet weak var wrapper: UIView!
    
    @IBOutlet weak var sNoView: UIView!
    @IBOutlet weak var valueXView: UIView!
    @IBOutlet weak var valueYView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var nameOfVictimView: UIView!
    @IBOutlet weak var relationshipView: UIView!
    @IBOutlet weak var sexView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var subCountyView: UIView!
    @IBOutlet weak var parishView: UIView!
    @IBOutlet weak var villageView: UIView!
    @IBOutlet weak var domesticViolenceView: UIView!
    @IBOutlet weak var gbvFormView: UIView!
    @IBOutlet weak var gbvInterventionByView: UIView!
    @IBOutlet weak var interventionStatusView: UIView!
    
    @IBOutlet weak var sNoLabel: UILabel!
    @IBOutlet weak var valueXLabel: UILabel!
    @IBOutlet weak var valueYLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameOfVictimLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var subCountyLabel: UILabel!
    @IBOutlet weak var parishLabel: UILabel!
    @IBOutlet weak var villageLabel: UILabel!
    @IBOutlet weak var domesticViolenceLabel: UILabel!
    @IBOutlet weak var gbvFormLabel: UILabel!
    @IBOutlet weak var gbvInterventionByLabel: UILabel!
    @IBOutlet weak var interventionStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        wrapper.layer.borderWidth = 1.0
        wrapper.layer.borderColor = UIColor.black.cgColor
        
        sNoView.layer.borderWidth = 0.5
        sNoView.layer.borderColor = UIColor.black.cgColor
        valueXView.layer.borderWidth = 0.5
        valueXView.layer.borderColor = UIColor.black.cgColor
        valueYView.layer.borderWidth = 0.5
        valueYView.layer.borderColor = UIColor.black.cgColor
        dateView.layer.borderWidth = 0.5
        dateView.layer.borderColor = UIColor.black.cgColor
        nameOfVictimView.layer.borderWidth = 0.5
        nameOfVictimView.layer.borderColor = UIColor.black.cgColor
        relationshipView.layer.borderWidth = 0.5
        relationshipView.layer.borderColor = UIColor.black.cgColor
        sexView.layer.borderWidth = 0.5
        sexView.layer.borderColor = UIColor.black.cgColor
        ageView.layer.borderWidth = 0.5
        ageView.layer.borderColor = UIColor.black.cgColor
        subCountyView.layer.borderWidth = 0.5
        subCountyView.layer.borderColor = UIColor.black.cgColor
        parishView.layer.borderWidth = 0.5
        parishView.layer.borderColor = UIColor.black.cgColor
        villageView.layer.borderWidth = 0.5
        villageView.layer.borderColor = UIColor.black.cgColor
        domesticViolenceView.layer.borderWidth = 0.5
        domesticViolenceView.layer.borderColor = UIColor.black.cgColor
        gbvFormView.layer.borderWidth = 0.5
        gbvFormView.layer.borderColor = UIColor.black.cgColor
        gbvInterventionByView.layer.borderWidth = 0.5
        gbvInterventionByView.layer.borderColor = UIColor.black.cgColor
        interventionStatusView.layer.borderWidth = 0.5
        interventionStatusView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
