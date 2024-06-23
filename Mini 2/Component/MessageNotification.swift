//
//  MessageNotification.swift
//  Mini 2
//
//  Created by Natasha Radika on 23/06/24.
//

import SwiftUI

struct MessageNotification: View {
    var body: some View {
        HStack {
            Image("icon").resizable().frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text("Test")
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                    Text("19.20")
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 94/255, green: 89/255, blue: 88/255))
                }
                Text("Desciption")
                    .font(.system(size: 15))
            }
            
        }
        .padding()
        .frame(width: 370)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 168/255, green: 165/255, blue: 164/255))
                .opacity(0.6)
                .shadow(radius: 5)
        )
        .padding()
    }
}

#Preview {
    MessageNotification()
}
