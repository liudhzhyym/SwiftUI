//
//  ContentView.swift
//  SwiftUI_PhotoPicker
//
//  Created by bakhaan on 2021/02/09.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var isPresentPicker = false
    
    @State private var images = [UIImage]()
    
    var body: some View {
        VStack {
            Button("Select Image") {
                isPresentPicker = true
            }
            
            List() {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)) // ---> List 왼쪽 여백 제거
                        .cornerRadius(10)
//                        .clipShape(Capsule())
                }
            }
        }
        
        .sheet(isPresented: $isPresentPicker, content: {
            // Picker
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        })
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(picker: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        
        // @Binding var isPresent: Bool 를 바로 가져 올 수 없어서 init으로 받아옴
        var picker: ImagePicker
        
        init(picker: ImagePicker) {
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.picker.isPresent = false
            
            for img in results {
                // UIImage로 이미지 불러올 수 있는지 확인
                guard img.itemProvider.canLoadObject(ofClass: UIImage.self) else { return }
                
                img.itemProvider.loadObject(ofClass: UIImage.self) { (loadedImage, error) in
                    
                    guard let hasImage = loadedImage else { return }
                    
                    self.picker.images.append(hasImage as! UIImage)
                }
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
