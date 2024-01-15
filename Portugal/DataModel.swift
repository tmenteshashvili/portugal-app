

import SwiftUI


class DataModel: ObservableObject {
    @Published var isLoading = true
    @Published var categories = [Category]()
    @Published var searchText = ""
    
    init() {
        
        Task { @MainActor in
            try await Task.sleep(for: .seconds(1))
            categories = Bundle.main.decode("content.json", as: [Category].self)
            isLoading = false
        }
    }
    func count(for item: Item) -> String {
        String(UserDefaults.standard.integer(forKey: item.id))
    }

    func add(to item: Item) {
        objectWillChange.send()
        let currentCount = UserDefaults.standard.integer(forKey: item.id)
        UserDefaults.standard.set(currentCount + 1, forKey: item.id)
    }

    func reset() {
        objectWillChange.send()
        
        for category in categories {
            for item in category.items {
                UserDefaults.standard.removeObject(forKey: item.id)
            }
        }
    }

    func title(for category: Category) -> LocalizedStringKey {
        let items = matchingItems(for: category)
        return "^[\(items.count) \(category.id)](inflect: true)"
    }

    func matchingItems(for category: Category) -> [Item] {
        if searchText.isEmpty {
            category.items
        } else {
            category.items.filter { $0.id.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
