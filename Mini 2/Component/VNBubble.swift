import SwiftUI

struct VNBubble: View {
    @ObservedObject var viewModel: SoundViewModel
    let sound: Sound
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        viewModel.playSound(named: sound.filename)
                    }) {
                        Image(systemName: "play.fill")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                    .frame(width: 40, height: 50)
                    
                    Image("SoundWave")
                        .resizable()
                        .frame(width: 200, height: 150)
                        .padding(.trailing, 1)
                }
                .padding(.leading, 5)
            }
            .frame(width: 250, height: 30)
            .padding()
            .background(.gray2InstaQ)
            .cornerRadius(20)
            .shadow(radius: 2)
            
            Spacer()
        }
        //.padding()
    }
}

#Preview {
    let viewModel = SoundViewModel()
    let sampleSound = Sound(id: "0", title: "Sound1", filename: "Sound1")
    return VNBubble(viewModel: viewModel, sound: sampleSound)
}


