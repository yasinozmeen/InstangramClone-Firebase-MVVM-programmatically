//
//  FeedCell.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 21.06.2023.
//

import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: - UI Elements
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsernameButton), for: .touchUpInside)
        
        return button
    }()
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "like_unselected")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "comment")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var sharedButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "send2")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some test caption for now.."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func configureUI() {
        backgroundColor = .white
        setupProfileImageView()
        setupUsernameButton()
        setupPostImageView()
        setupActionButtons()
        setupLikesLabel()
        setupCaptionLabel()
        setupPostTimeLabel()
    }
    // MARK: - Actions
    @objc func didTapUsernameButton() {
        print("did tap username")
    }
    
}
// MARK: - UI Configure Functions
extension FeedCell {
    func setupProfileImageView() {
        addSubview(profileImageView)
        
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
    }
    func setupUsernameButton() {
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
    }
    func setupPostImageView() {
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
    func setupActionButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sharedButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor,
                         width: 120,
                         height: 50)
    }
    func setupLikesLabel() {
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor,
                          left: leftAnchor,
                          paddingTop: -4,
                          paddingLeft: 8)
        
    }
    func setupCaptionLabel() {
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor,
                            left: leftAnchor,
                            paddingTop: 8,
                            paddingLeft: 8)
    }
    func setupPostTimeLabel() {
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,
                             left: leftAnchor,
                             paddingTop: 8,
                             paddingLeft: 8)
    }
    
}
