

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        if dataModel.isLoading {
            LoadingView()
        } else {
            ListingView()
        }
    }
}

#Preview {
    ContentView()
}
