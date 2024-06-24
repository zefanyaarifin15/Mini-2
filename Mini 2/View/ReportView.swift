import SwiftUI

struct ReportView: View {
    var photo: Photo
    @State private var motives: String = ""
    @State private var opportunity: String = ""
    
    var body: some View {
        VStack {
            VStack {
                photo.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.top,85)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(photo.name)
                    .font(.headline)
                    .padding(.top, 20)
                Text("24 y.o, beauty influencer, Jasmine's friend")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Motives *")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Why this suspect might stalk Jasmine?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextEditor(text: $motives)
                    .frame(height: 120)
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.bottom, 5)
                    .disableAutocorrection(true)
                    .font(.system(size: 14))

                
                Text("Opportunity *")
                    .font(.headline)
                
                Text("What makes this suspect capable of stalking Jasmine?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextEditor(text: $opportunity)
                    .frame(height: 120)
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.bottom, 20)
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
 
            }) {
                Text("Report")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 120)
            .padding(.bottom, 40)
            .padding(.top, -7)
        }
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(photo: Photo(name: "Stephanie", image: Image("post6"), position: CGPoint(x: 70, y: 500)))
    }
}
