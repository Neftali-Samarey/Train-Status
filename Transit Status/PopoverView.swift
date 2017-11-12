//
//  PopoverView.swift
//  Transit Status
//
//  Created by Neftali Samarey on 11/12/17.
//  Copyright © 2017 Neftali Samarey. All rights reserved.
//

import UIKit

class PopoverView: UIView {
    
    
    var background = UIView()
    var card = UIView()
    
    var DetailError = UILabel()
    var dismissButton  = UIButton()
    var textpad = UITextView()

    private override init(frame: CGRect) {
        
        super.init(frame: frame)
       self.background.frame = CGRect(x: 0, y: 0, width: width(), height: height())
       self.background.layer.backgroundColor = UIColor.black.withAlphaComponent(0.7).cgColor
        self.background.isUserInteractionEnabled = false
        
        self.card.frame = CGRect(x: 20, y: 160, width: 340, height: 400)
        self.card.layer.cornerRadius = 10
        self.card.backgroundColor = UIColor.white
        
        
        self.textpad.frame = CGRect(x: 10, y: 170, width: 320, height: 200)
       
        
        
        
        
        
        
       self.addSubview(background)
        self.background.addSubview(card)
        self.card.addSubview(textpad)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismissView(){
        
    
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
          //  NotificationCenter.default.post(name: Notification.Name(rawValue: dismissedKey), object: self)
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)       // Not working
            
        }
    }
    
}
extension UIView{
    
    func width() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func height() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
}

