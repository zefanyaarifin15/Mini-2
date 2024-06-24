import SwiftUI

struct AnalysisButton: View {
    var title: String
    var isLocked: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if !isLocked {
                action()
            }
        }) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isLocked ? .secondary : .primary)
                    .padding(.leading)
                Spacer()
                if isLocked {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.secondary)
                        .padding(.trailing)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .disabled(isLocked)
    }
}
