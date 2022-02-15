//
//  PDFData.swift
//  pdfCreator
//
//  Created by Admin on 10/28/20.
//  Copyright © 2020 HobbyDev. All rights reserved.
//

import UIKit

class PDFData: NSObject {

    var dataInfo = [String: String]()
    var labelWidthInfo = [String: CGFloat]()
    var maxHeight: CGFloat = 40.0
    
    override init() {
        
    }
    
    init(info: [String: String], widthInfo: [String: CGFloat]) {
        super.init()
        
        dataInfo = info
        labelWidthInfo = widthInfo
        
        calcMaxHeight()
    }
    
    func getValueSize(key: String) -> CGSize {
        let value = dataInfo[key] ?? ""
        let width = labelWidthInfo[key]! - 10.0
        let height = value.height(withConstrainedWidth: width, font: DataFont) + 10.0
        
        return CGSize(width: width, height: height)
    }
    
    func calcMaxHeight() {
        for key in dataInfo.keys {
            let size = getValueSize(key: key)
            maxHeight = max(maxHeight, size.height)
        }
    }
    
}
