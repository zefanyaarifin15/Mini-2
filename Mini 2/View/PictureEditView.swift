import SwiftUI

struct PictureEditView: View {
    @State private var exposureValue: Double = 0.0
    @Binding var isPictureClicked: Bool
    var body: some View {
        ZStack {
            VStack {
                Image("PictureEdit")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(maxWidth: 400, maxHeight: 300)
                    .brightness(exposureValue)
                    
                Slider(value: $exposureValue, in: -1.0...1.0, step: 0.01)
                    .accentColor(.greenInstaQ)
                    //.background(.black)
                    .padding(.horizontal)
                    
            
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            isPictureClicked = false
        }
    }
}

struct PictureBubble: View{
    @State private var isPictureClicked = false
    var body: some View{
        ZStack {
            Image("PictureEdit")
                .resizable()
                .frame(maxWidth: 250, maxHeight: 150, alignment: .leading)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    isPictureClicked = true
            }
            
            if isPictureClicked {
                Color.grayInstaQ
                    .blur(radius: 200)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        PictureEditView(isPictureClicked: $isPictureClicked)
                            
                    )
            }
        }
    }
}

struct PictureEditView_Previews: PreviewProvider {
    static var previews: some View {
        PictureBubble()
    }
}
