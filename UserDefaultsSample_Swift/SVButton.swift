//
//  SVButton.swift
//  UserDefaultsSample_Swift
//
//  Created by Erkan on 11/9/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

class SVButton: UIButton {
    override init(frame:CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    private func setUpButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor    =  Colors.lightBlue
        titleLabel?.font   = .boldSystemFont(ofSize: 20)
        layer.cornerRadius =  frame.size.height / 2
    }
}
