//
//  inputTextField.swift
//  PracticeMVVM
//
//  Created by 민지은 on 2024/02/22.
//

import UIKit

class InputTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
        clipsToBounds = true
        layer.cornerRadius = 10
        textColor = .white
        textAlignment = .center
        font = .systemFont(ofSize: 15, weight: .regular)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InputTextField {
    func makePlaceholder(_ text: String) {
        attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
}

#Preview {
    LoginViewController()
}
