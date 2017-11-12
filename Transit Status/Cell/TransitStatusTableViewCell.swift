//
//  TransitStatusTableViewCell.swift
//  Transit Status
//
//  Created by Neftali Samarey on 11/11/17.
//  Copyright © 2017 Neftali Samarey. All rights reserved.
//

import UIKit

class TransitStatusTableViewCell: UITableViewCell {
    
    struct ParsedData {
    
        var status = "Status:"
    }
    
    var TSTrainLineView = UIView()
    var TSLabel = UILabel()
    var TSStatusUpdateAlertLabel = UILabel()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.TSTrainLineView.frame = CGRect(x: 10, y: 5, width: 80, height: 80)
        self.TSTrainLineView.translatesAutoresizingMaskIntoConstraints = false
        self.TSTrainLineView.backgroundColor = UIColor.emeraldColor()
        self.TSTrainLineView.layer.cornerRadius = self.TSTrainLineView.frame.size.width/2
        self.TSTrainLineView.clipsToBounds = true
        
        self.TSLabel.frame = CGRect(x: 25, y: 20, width: self.bounds.size.width, height: 40)
        self.TSLabel.textColor = UIColor.white
        self.TSLabel.font = UIFont(name: "avenir", size: 50)
        
        let datain = ParsedData()
        self.TSStatusUpdateAlertLabel.frame = CGRect(x: 100, y: 15, width: Int(self.bounds.width), height: 30)
        self.TSStatusUpdateAlertLabel.text = datain.status
        self.TSStatusUpdateAlertLabel.textColor = UIColor.black
        
        
        
        self.addSubview(TSTrainLineView)
        TSTrainLineView.addSubview(TSLabel)
        self.addSubview(TSStatusUpdateAlertLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ConstrainComponentsWith(inputView: UIView, inputLabel: UILabel) {
        
    }
    
    
    
}
