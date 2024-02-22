//
//  LoginViewModel.swift
//  PracticeMVVM
//
//  Created by 민지은 on 2024/02/22.
//

import Foundation

enum LoginInfo {
    case id
    case password
    case login
}

final class LoginViewModel {
    
    var inputText = Observable("")
    var outputID = Observable("")
    var outputPassword = Observable("")
    
    var newUser = Login(id: "", password: "")
    
    var userList: [Login] = []
    
    var type: LoginInfo = .id {
        didSet {
            if self.type == .id {
                print("checkID")
                inputText.bind { value in
                    self.checkID(value)
                }
            } else if self.type == .password {
                print("checkPassword")
                inputText.bind { value in
                    self.checkPassword(value)
                }
            } else if self.type == .login {
               ("new user login")
                self.userLogin(newUser)
            } else {
                print("Error")
            }
        }
    }

    private func checkID(_ text: String) {
        if text.isEmpty {
            outputID.text = "아이디를 입력해주세요"
            return
        }
        
        if text.count < 5 || text.count > 15{
            outputID.text = "아이디는 최소 5자 ~ 최대 15자까지 가능합니다"
        } else {
            outputID.text = "사용가능한 아이디 입니다"
        }
    }
    
    private func checkPassword(_ text: String) {
        
        if text.isEmpty {
            outputPassword.text = "비밀번호를 입력해주세요"
            return
        }
        
        if let _ = Int(text) {
            outputPassword.text = "숫자로만 구성된 비밀번호는 불가능합니다"
            return
        }
        
        if text.count < 8 || text.count > 20 {
            outputPassword.text = "비밀번호는 최소 8자부터 최대 20자까지 가능합니다"
        } else {
            outputPassword.text = "사용가능한 비밀번호 입니다"
        }
    }
    
    private func userLogin(_ user: Login){
        if let _ = Int(user.password) { return }
        
        if (user.id.count >= 5 && user.id.count <= 15) && (user.password.count >= 8 && user.password.count <= 20) {
            print("들어갔어..?")
            self.userList.append(user)
        }
        print(userList)
    }
    
    
    
}
