//
//  IncomingCallView.swift
//  Mini 2
//
//  Created by Natasha Radika on 23/06/24.
//

import SwiftUI

struct IncomingCallView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.gray,
                    Color(red: 0.2, green: 0, blue: 0.4),
                    Color(red: 0, green: 0, blue: 0.4),
                    Color.black
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
                        
            VStack(spacing: 260) {
                

                VStack(spacing: 30) {
                   
                    
                    VStack(spacing: 10) {
                        Text("Incoming Call...")
                            .font(.system(size: 18))
                            .foregroundColor(Color(red: 0.94, green: 0.89, blue: 0.88))
                        Text("Stephanie")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)
                        
                        
                    }
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .clipped()
                    
                }
                
                HStack(spacing: 100) {
                    Button(action: {
                        
                        print("Call Rejected")
                    }) {
                        Image(systemName: "phone.down.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(25)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    
                    Button(action: {
                        // Action when accept button is tapped
                        print("Call Accepted")
                    }) {
                        Image(systemName: "phone.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color.green)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                
            }
        }
    }
}

#Preview {
    IncomingCallView()
}
