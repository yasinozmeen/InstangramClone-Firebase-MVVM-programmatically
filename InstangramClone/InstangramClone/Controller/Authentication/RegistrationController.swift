//
//  RegistrationController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 22.06.2023.
//
import UIKit

class RegistrationController: UIViewController{
    // MARK: - UI Elements
    private let pulshPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(image, for: .normal)
        return button
    }()
    private let emailTextField: UITextField = {
        let tf = CustomTextFieldLoginView(placeholder: "Email")
        return tf
    }()
    private let passwordTextField: UITextField = {
        let tf = CustomTextFieldLoginView(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    private let fullnameTextField = CustomTextFieldLoginView(placeholder: "Fullname")
    private let usernameTextField = CustomTextFieldLoginView(placeholder: "Username")
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?  ", secondPart: "Sign In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    // MARK: - Actions
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Functions
    func configureUI() {
        configureGradientLayer()
        setupPulshPhotoButton()
        setupTextFieldAndStackView()
        setupAlreadyAccount()
    }
    
    func setupPulshPhotoButton() {
        view.addSubview(pulshPhotoButton)
        
        pulshPhotoButton.centerX(inView: view)
        pulshPhotoButton.setDimensions(height: 140, width: 140)
        pulshPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
        paddingTop: 32)
    }
    func setupTextFieldAndStackView() {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: pulshPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
    }
    func setupAlreadyAccount() {
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
