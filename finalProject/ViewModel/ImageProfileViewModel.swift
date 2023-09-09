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
    
    func UploadImage(){
        let storage = Storage.storage().reference()
        
        let ImageData = selectedImage?.jpegData(compressionQuality: 0.9)
        
        let islandRef = storage.child("imageuser1/\(String(describing: selectedImage)).jpg")
        
        guard ImageData != nil else {
            return print("the image not nil")
        }
        
        islandRef.putData(ImageData!){error , strageData in
            if error == nil && strageData != nil{
                
            }
        }
        
        
    }
}
