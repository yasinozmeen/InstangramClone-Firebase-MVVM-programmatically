//
//  LoginController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 22.06.2023.
//

import UIKit

class LoginController: UIViewController{
    // MARK: - UI Elements
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: " Email",
                                                      attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])
        return tf
    }()
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: " Password",
                                                      attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])
        return tf
    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),.font:UIFont.systemFont(ofSize: 16)]
        let attributesTitle = NSMutableAttributedString(string: "Dont't have an account? ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),.font:UIFont.boldSystemFont(ofSize: 16)]
        attributesTitle.append(NSMutableAttributedString(string: "Sign Up", attributes: boldAtts))
        button.setAttributedTitle(attributesTitle, for: .normal)
        return button
    }()
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),.font:UIFont.systemFont(ofSize: 16)]
        let attributesTitle = NSMutableAttributedString(string: "Forgot you password? ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7),.font:UIFont.boldSystemFont(ofSize: 16)]
        attributesTitle.append(NSMutableAttributedString(string: "Get help signing in.", attributes: boldAtts))
        button.setAttributedTitle(attributesTitle, for: .normal)
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
    }
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
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
}
