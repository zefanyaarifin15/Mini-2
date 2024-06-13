import SwiftUI

struct Profile: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let description: String
}

struct ProfileAnalysisView: View {
    let profiles: [Profile] = [
        Profile(image: "stephanie", name: "stephaniejenn", description: "Stephanie Jen is a 20 year old influencer who rose to fame as a beauty vlogger on social media. She is a friend of yours, having met at a makeup event a year ago. You still keep in touch with her occasionally."),
        Profile(image: "natalia", name: "nataliaibert", description: "Natalie Bertman is a 23-year-old influencer who initially gained attention through her fashion and lifestyle content on social media. She is a close friend of yours, and you two have shared many memorable moments together."),
        Profile(image: "James", name: "James", description: "James is an ex-boyfriend, and the two of you have a complicated history. Despite your breakup, he still reaches out to you from time to time."),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Profile Analysis")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(profiles) { profile in
                    VStack {
                        Image(profile.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.top)
                        
                        Text(profile.name)
                            .font(.headline)
                            .padding(.top, 5)
                        
                        Text(profile.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center) 
                            .padding([.leading, .trailing])
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAnalysisView()
    }
}
// Ages banyak mau sekali. Fany lucu sekali. Venus cantik sekali. Venus baik sekali. Venus suka menabung. uueek
