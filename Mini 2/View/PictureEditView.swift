import SwiftUI

struct PictureEditView: View {
    @State private var exposureValue: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.gray
                .blur(radius: 100) 
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("PictureEdit")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                    .brightness(exposureValue)
                    .cornerRadius(20)
                
                Slider(value: $exposureValue, in: -1.0...1.0, step: 0.01)
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct PictureEditView_Previews: PreviewProvider {
    static var previews: some View {
        PictureEditView()
    }
}
