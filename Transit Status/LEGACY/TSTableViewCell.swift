//
//  TSTableViewCell.swift
//  Transit Status
//
//  Created by Neftali Samarey on 11/11/17.
//  Copyright © 2017 Neftali Samarey. All rights reserved.
//

import UIKit

class TSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TrainLineView: UIView!
    @IBOutlet weak var TrainLineLabel: UILabel!
    // Peroperties for the tableview cell
    var NTLabel = UILabel()
    var NTTransitLineLogo = UIView() // instance of the transit logo
    var NTImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        TrainLineView.frame = CGRect(x: 10, y: 10, width: 200, height: 200 )
        self.addSubview(TrainLineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    
}
