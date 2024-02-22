//
//  Observable.swift
//  PracticeMVVM
//
//  Created by 민지은 on 2024/02/22.
//

import Foundation

class Observable {
    
    private var closure: ((String) -> Void)?
    
    var text: String {
        didSet{
            closure?(text)
        }
    }
    
    init(_ text: String){
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(text)
        self.closure = closure
    }
}
