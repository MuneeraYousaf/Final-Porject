//
//  ImageProfileView.swift
//  finalProject
//
//  Created by Afrah Faisal on 23/02/1445 AH.
//

import SwiftUI

struct ImageProfileView: View {
    @State private var showImagePicker: Bool = false
    @ObservedObject var vm = ImageProfileViewModel()
    //        @State private var isButtonVisible = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            //يعرض الالبوم الصور للمتسخدم لاختيار صوره
            Button{
                showImagePicker = true
            }
        label: {
            VStack{
                if let image = vm.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 250 , height: 250)
                } else {
                    Image(systemName: "person.fill")
                        .font(.system(size: 64))
                        .padding()
                        .foregroundColor(Color(.label))
                }
                //
                //                    }
                //                }
                //                if isButtonVisible {
                //يحفظ الصوره في firebase
                Button("Save Image") {
                    vm.UploadImage(forUserId: "")
                    
                    if vm.showNextPage{
                        dismiss()
                    }
                    
                    
                }
                Button(action: {
                    
                    dismiss()
                }, label: {
                    Text("Cancel")
                })
                //            label: {
                //
                //                    Image(systemName: "camera")
                //                        .font(.system(size: 20))
                //                        .padding()
                //                        .foregroundColor(Color(.label))
                //
                //                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $vm.selectedImage, showImagePicker: $showImagePicker)
        }
        .padding(.horizontal)
        }
    }
}

struct ImageProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProfileView()
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var showImagePicker: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
        
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            
            parent.showImagePicker = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showImagePicker = false
        }
    }
}
