//
//  ImageUploader.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 27.06.2023.
//

import FirebaseStorage
import UIKit.UIImage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String)->Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
