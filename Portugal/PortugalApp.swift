
import SwiftUI

@main
struct PortugalApp: App {
    @StateObject private var dataModel = DataModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)

        }
    }
}
