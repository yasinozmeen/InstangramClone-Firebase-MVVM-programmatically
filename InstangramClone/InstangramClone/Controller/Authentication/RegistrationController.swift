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
    var profileImage : UIImage?
    
    // MARK: - UI Elements
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(handlePickingPhoto), for: .touchUpInside)
        return button
    }()
    private let emailTextField = CustomTextFieldLoginView(placeholder: "Email")
    private let passwordTextField = CustomTextFieldLoginView(placeholder: "Password")
    private let fullnameTextField = CustomTextFieldLoginView(placeholder: "Fullname")
    private let usernameTextField = CustomTextFieldLoginView(placeholder: "Username")
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
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
    @objc func handlePickingPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let pasword = passwordTextField.text else { return }
        guard let fullName = fullnameTextField.text else { return }
        guard let userName = usernameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credantials = AuthCredentials(email: email,
                                          password: pasword,
                                          fullname: fullName,
                                          username: userName,
                                          profileImage: profileImage)
        
        AuthService.register(withCredential: credantials)
        
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

// MARK: - UIImagePickerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.profileImage = selectedImage
        self.dismiss(animated: true)
    }
}
// MARK: - UI Functions
extension RegistrationController{
    func setupPulshPhotoButton() {
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               paddingTop: 32)
    }
    
    func setupTextFieldAndStackView() {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,
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
