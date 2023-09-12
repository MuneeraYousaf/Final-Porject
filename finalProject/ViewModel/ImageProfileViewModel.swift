//
//  ImageProfileViewModel.swift
//  finalProject
//
//  Created by Afrah Faisal on 23/02/1445 AH.
//

import Foundation
import Firebase
import FirebaseStorage

class ImageProfileViewModel : ObservableObject{
    
    @Published var selectedImage : UIImage? = nil
    @Published var showNextPage : Bool = false
    
    func UploadImage(forUserId: String){
        let storage = Storage.storage().reference()
        
        let ImageData = selectedImage?.jpegData(compressionQuality: 0.9)
        let profileImageName = "\(UUID().uuidString).jpg"
        
        let islandRef = storage.child("imageuser1/\(profileImageName)")
        
        guard ImageData != nil else {
            return print("the image not nil")
        }
        
        islandRef.putData(ImageData!) { strageData, error in
            if error == nil && strageData != nil {
                // updateUserDocument(withUserId: forUserId, profileImageName)
            }
        }
        
        
    }
}
