import SwiftUI

struct PictureEditView: View {
    @State private var exposureValue: Double = 0.0
    
    var body: some View {
        VStack {
            Image("PictureEdit")
                .resizable()
                .frame(maxWidth: 500, maxHeight: 500)
                .brightness(exposureValue)
            
            Slider(value: $exposureValue, in: -1.0...1.0, step: 0.01)
                .padding(.horizontal)
        }
        .padding()
    }
}

struct PictureEditView_Previews: PreviewProvider {
    static var previews: some View {
        PictureEditView()
    }
}


