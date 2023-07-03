//
//  AuthService.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 27.06.2023.

import UIKit.UIImage
import Firebase

struct AuthCredentials {
    var email: String
    var password: String
    var fullname: String
    var username: String
    var profileImage: UIImage
}

struct AuthService {
    static func register(withCredential credantial:AuthCredentials, completition: @escaping (Error?)->()) {
        ImageUploader.uploadImage(image: credantial.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credantial.email, password: credantial.password) {
                (result, error) in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String:Any] = ["email": credantial.email,
                                          "fullname": credantial.fullname,
                                          "profileImageUrl":imageUrl,
                                          "uid": uid,
                                          "username": credantial.username]
                Firestore.firestore().collection("users").document(uid).setData(data) { error in
                    if let error = error {
                        print("DEBUG: Failed to register user \(error.localizedDescription)")
                        return
                    }
                    print("DEBUG: Successfully registered user with firestore..")
                }
            }
        }
    }
}
