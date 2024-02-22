//
//  LoginViewController.swift
//  PracticeMVVM
//
//  Created by 민지은 on 2024/02/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    
    let viewModel = LoginViewModel()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "EUNFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 45, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    let idTextField = InputTextField()
    let idGuideLabel: guideLabel = {
        let label = guideLabel()
        label.text = ""
        return label
    }()
    
    let passwordTextField = InputTextField()
    let passwordGuideLabel: guideLabel = {
        let label = guideLabel()
        label.text = ""
        return label
    }()
    
    let loginButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        viewModel.outputID.bind { value in
            self.idGuideLabel.text = value
        }

        viewModel.outputPassword.bind { value in
            self.passwordGuideLabel.text = value
        }
        
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func idTextFieldChanged() {
        print(#function)
        viewModel.type = LoginInfo.id
        viewModel.inputText.text = idTextField.text!
    }
    
    @objc func passwordTextFieldChanged() {
        print(#function)
        viewModel.type = LoginInfo.password
        viewModel.inputText.text = passwordTextField.text!
    }
    
    @objc func loginButtonTapped() {
        print(#function)
        viewModel.newUser = Login(id: idTextField.text!, password: passwordTextField.text!)
        viewModel.type = .login
    }
    
    override func configureHierarchy() {
        view.addSubview(logoLabel)
        view.addSubview(idTextField)
        view.addSubview(idGuideLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordGuideLabel)
        view.addSubview(loginButton)
    }
    
    override func configureLayout() {
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(120)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(50)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(50)
        }
        
        idGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idGuideLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(50)
        }
        
        passwordGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordGuideLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(20)
            make.height.equalTo(50)
        }
        
    }

    override func configureView() {
        idTextField.makePlaceholder("아이디")
        passwordTextField.makePlaceholder("비밀번호")
    }
    
}

#Preview {
    LoginViewController()
}
