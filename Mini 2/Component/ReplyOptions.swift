import SwiftUI

struct ReplyOptions<Content: View, Content2: View>: View {
    @State private var isTapped: Bool = false
    @State private var numOptions: Int = 3
    let content: Content
    let content2: Content2

    init(numOptions: Int = 3, @ViewBuilder content: () -> Content, @ViewBuilder content2: () -> Content2) {
        self.content = content()
        self.content2 = content2()
        self.numOptions = numOptions
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                content
                    .padding(.top) // Add top padding as needed
                    .padding(.horizontal) // Add horizontal padding as needed
            }
            .defaultScrollAnchor(.bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)

            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.grayInstaQ)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 21)
                        .fill(.grayInstaQ)
                        .stroke(.whiteInstaQ, lineWidth: 1)
                        .frame(maxWidth: 361, maxHeight: 36)
                        .padding(.top, 20)
                        .overlay {
                            HStack {
                                Text("Pick a reply...")
                                    .foregroundColor(.white)
                                    .padding(.top, 18)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                        .onTapGesture {
                            isTapped.toggle()
                        }
                    
                    content2
                        .padding(.top, 5)
                        
                    
                    Spacer()
                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .animation(.easeInOut, value: isTapped)
    }
}

struct ReplyOptions_Previews: PreviewProvider {
    static var previews: some View {
        ReplyOptions {
            Text("Main Content").foregroundColor(.red)
        } content2: {
            Text("Additional Content").foregroundColor(.red)
        }
    }
}
