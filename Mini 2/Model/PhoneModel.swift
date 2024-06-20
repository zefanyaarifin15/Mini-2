import Foundation
import SwiftUI

struct AppIconViewModel<Destination: View> {
    let imageName: String
    let labelText: String
    let destination: Destination
}
