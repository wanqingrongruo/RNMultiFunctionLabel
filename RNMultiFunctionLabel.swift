//
//  RNMultiFunctionLabel.swift
//  HoyoServicer
//
//  Created by 婉卿容若 on 2017/5/18.
//  Copyright © 2017年 com.ozner.net. All rights reserved.
//

import Foundation
import UIKit

class RNMultiFunctionLabel: UILabel {
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addLongPressGesture()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addLongPressGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)){
            return true
        }else{
            return false
        }
        
    }
   
    override func copy(_ sender: Any?) {
        let pastBoard = UIPasteboard.general
        pastBoard.string = self.text
    }
}

//MARK: - private methods

extension RNMultiFunctionLabel {
    
    func addLongPressGesture() {
        
        self.isUserInteractionEnabled = true
        
        let longPressGesture = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressAction(gesture:)))
        self.addGestureRecognizer(longPressGesture)
    }
    
    func longPressAction(gesture: UILongPressGestureRecognizer){
        
        if gesture.state == .began{
        
            self.becomeFirstResponder()
            
            //let copyItem = UIMenuItem(title: "复制", action: #selector(copy(_:)))
            let menuVC = UIMenuController.shared
           // menuVC.menuItems = [copyItem]
            if menuVC.isMenuVisible {
                return
            }
            menuVC.setTargetRect(bounds, in: self)
            menuVC.setMenuVisible(true, animated: true)
        }
       
    }
}
