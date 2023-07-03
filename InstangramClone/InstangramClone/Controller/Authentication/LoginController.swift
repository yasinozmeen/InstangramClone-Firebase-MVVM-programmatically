//
//  LoginController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 22.06.2023.
//

import UIKit

class LoginController: UIViewController{
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    
    // MARK: - UI Elements
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    private let emailTextField: UITextField = {
        let tf = CustomTextFieldLoginView(placeholder: "Email")
        return tf
    }()
    private let passwordTextField: UITextField = {
        let tf = CustomTextFieldLoginView(placeholder: "Password")
        tf.isSecureTextEntry = false
        return tf
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.textColor = UIColor(white: 1, alpha: 0.67)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot yor password?  ", secondPart: "Get help signing in.")
        return button
    }()
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Dont't have an account?  ", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    func configureUI() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupGradient()
        setupIconImageView()
        setupTextFieldAndStackView()
        setupDontHaveAnAcount()
        configuratNotificationObserver()
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    func setupGradient() {
        configureGradientLayer()
    }
    
    func setupIconImageView() {
        view.addSubview(iconImage)
        
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }
    func setupTextFieldAndStackView() {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
    }
    func setupDontHaveAnAcount() {
        view.addSubview(dontHaveAccountButton)
        
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    func configuratNotificationObserver() {
        emailTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - Actions
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleShowLogin() {
        guard let email = emailTextField.text else { return }
        guard let pasword = passwordTextField.text else { return }
        AuthService.logUserIn(email: email, password: pasword) { result, error in
            if let error = error {
                print("DEBUG: Failed to log user in \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true)
        }
    }
    @objc func textDidChange(_ sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        uptadeForm()
    }
}

// MARK: - FormViewModel
extension LoginController: FormViewModel {
    func uptadeForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
}
