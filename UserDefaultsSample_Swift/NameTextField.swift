//
//  NameTextField.swift
//  UserDefaultsSample_Swift
//
//  Created by Erkan on 11/9/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

class NameTextField: UITextField {
    override init (frame: CGRect){
        super.init(frame: frame)
        setUpTextField()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTextField()
    }
    func setUpTextField() {
        tintColor       = Colors.darkGrey
        textColor       = Colors.darkGrey
        backgroundColor = .white
    }
    func updatedStyle(isDarkMode: Bool) {
        var isDarkMode: Bool!
        let mainColor      = isDarkMode ? .white : Colors.darkGrey
        keyboardAppearance = isDarkMode ? .dark : .light
        UIView.animate(withDuration: 0.4) {
            self.tintColor       = mainColor
            self.textColor       = mainColor
            self.backgroundColor = isDarkMode ? Colors.darkGrey : .white
        }
        
    }
}
