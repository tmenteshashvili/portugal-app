
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "antenna.radiowaves.left.and.right")
                .font(.system(size: 72))
                .symbolEffect(.variableColor.iterative)
            Text("Loading")
                .font(.title)
        }
    }
}

#Preview {
    LoadingView()
}
