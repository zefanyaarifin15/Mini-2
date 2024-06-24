//
//  ConfirmationReportPage.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 19/06/24.
//

//import SwiftUI
//
//struct ConfirmationReportPage: View {
//    @State private var showCallNotification = false
//    @State private var showGameOverText = false
//
//    var body: some View {
//        ZStack {
//            Color.brownReport
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                if showCallNotification {
//                    CallNotification(showGameOverText: $showGameOverText)
//                        .transition(.move(edge: .top))
//                        .animation(.easeInOut)
//                }
//
//                Spacer()
//
//                VStack(alignment: .leading) {
//                    Text("Status : ")
//                        .fontWeight(.bold)
//                    Text("The police have investigated your report but found no evidence against X")
//                        .foregroundColor(.black)
//                }
//                .frame(width: 250, height: 550)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(15)
//                .shadow(radius: 5)
//
//                if showGameOverText {
//                    Text("The stalker has found Jasmine. Game Over")
//                        .foregroundColor(.red)
//                        .fontWeight(.bold)
//                        .padding(.top, 20)
//                }
//
//                Spacer()
//            }
//            .onAppear {
//                // Simulate a delay before showing the CallNotification
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    withAnimation {
//                        showCallNotification = true
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ConfirmationReportPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmationReportPage()
//    }
//}
