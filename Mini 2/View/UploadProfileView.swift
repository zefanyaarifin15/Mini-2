//
//  UploadProfileView.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 21/06/24.
//

import SwiftUI

struct UploadProfileView: View {
    @State private var image: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack {
            ZStack {
                // Background Circle
                Circle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                // Profile Image
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                } else {
                    // Default Profile Icon
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                }
                
                // Plus Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isImagePickerPresented.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                        }
                        .offset(x: -10, y: -10)
                    }
                }
                .frame(width: 150, height: 150)
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(sourceType: .photoLibrary, image: $image)
        }
    }
}

#Preview {
    UploadProfileView()
}
