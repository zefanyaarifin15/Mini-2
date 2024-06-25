//
//  NotificationViewModel.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 25/06/24.
//

import Foundation
import SwiftUI

class NotificationViewModel: ObservableObject {
    @Published var showNotification = false
    var currentEpisode: Int
    
    init(currentEpisode: Int) {
        self.currentEpisode = currentEpisode
        if currentEpisode == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.showNotification = true
            }
        }
    }
}
