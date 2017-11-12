//
//  Card.swift
//  Transit Status
//
//  Created by Neftali Samarey on 11/12/17.
//  Copyright © 2017 Neftali Samarey. All rights reserved.
//

import UIKit

class Card: UIView {

    private override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
