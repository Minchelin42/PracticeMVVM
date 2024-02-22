//
//  guideLabel.swift
//  PracticeMVVM
//
//  Created by 민지은 on 2024/02/22.
//

import UIKit

class guideLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .left
        font = .systemFont(ofSize: 14, weight: .medium)
        textColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
