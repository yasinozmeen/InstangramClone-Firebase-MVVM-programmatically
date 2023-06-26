//
//  RegistrationController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 22.06.2023.
//
import UIKit

class RegistrationController: UIViewController{
    // MARK: - Propetries
    private var viewModel = RegistrationViewModel()
    
    // MARK: - UI Elements
    private let pulshPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(image, for: .normal)
        return button
    }()
    private let emailTextField = CustomTextFieldLoginView(placeholder: "Email")
    private let passwordTextField = CustomTextFieldLoginView(placeholder: "Password")
    private let fullnameTextField = CustomTextFieldLoginView(placeholder: "Fullname")
    private let usernameTextField = CustomTextFieldLoginView(placeholder: "Username")
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        return button
    }()
    
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
    
    // MARK: - Functions
    func configureUI() {
        configureGradientLayer()
        setupPulshPhotoButton()
        setupTextFieldAndStackView()
        setupAlreadyAccount()
        configuratNotificationObserver()
    }
    
    // MARK: - Actions
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    @objc func textDidChange(_ sender: UITextField){
        switch sender {
        case emailTextField:
            viewModel.email = sender.text
        case passwordTextField:
            viewModel.password = sender.text
        case fullnameTextField:
            viewModel.fullname = sender.text
        case usernameTextField:
            viewModel.username = sender.text
        default:
            print("Wrong TextField")
        }
        uptadeForm()
    }
}
// MARK: - FormViewModel
extension RegistrationController: FormViewModel {
    func uptadeForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

// MARK: - UI Functions
extension RegistrationController{
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
    
    func configuratNotificationObserver() {
        emailTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
}
