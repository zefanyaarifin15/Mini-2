//
//  ReportCardDetail.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 21/06/24.
//

import SwiftUI

struct ReportCardDetail: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Rectangle()
                    .frame(width: 240, height: 200)
                    .padding(.leading, 7)
                    .padding(.bottom, 50)
                
                Text("Unknown @stalker")
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 5)
                
                Text("Clues")
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 5)
                
                Text("might be a woman with long hair working at beauty industry is at the car when the call happen")
                    .padding(.leading, 5)
            }
            .frame(width: 254, height: 550)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding(.bottom, 70)
        }
    }
}

#Preview {
    ReportCardDetail()
}
