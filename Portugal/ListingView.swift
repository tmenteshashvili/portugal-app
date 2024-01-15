
import SwiftUI

struct ListingView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(dataModel.categories) {category in
                    Section {
                        let item = dataModel.matchingItems(for: category)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(item) { item in
                                    ItemView(item: item)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .contentMargins(20, for: .scrollContent)
                        .listRowInsets(EdgeInsets())
                        
                    } header: {
                        Text(dataModel.title(for: category))
                            .font(.title3.bold())
                            .textCase(.uppercase)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Portugal")
            .searchable(text: $dataModel.searchText)
            .toolbar {
                Button("Erase data", systemImage: "eraser" ,action: dataModel.reset)
            }
        }
    }
}

#Preview {
    ListingView()
}
