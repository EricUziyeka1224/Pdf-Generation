//
//  FieldView.swift
//  pdfCreator
//
//  Created by Admin on 10/28/20.
//  Copyright © 2020 HobbyDev. All rights reserved.
//

import UIKit

class FieldView: UIView {
    
    var label: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        
        label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        addSubview(label)
    }
    
    func setValue(value: String, height: CGFloat, font: UIFont) {
        label.text = value
        label.font = font
        
        let width = frame.width - 10.0
        label.frame = CGRect(x: 5.0, y: frame.height - height, width: width, height: height)
    }
}
