

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var dataModel: DataModel
    var item: Item
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(item.id)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
            
            VStack (spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(height: 3)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(item.id)
                        
                        Text(item.description)
                            .lineLimit(2, reservesSpace: true)
                            .font(.body)
                    }
                    Spacer()
                    
                    Button(dataModel.count(for: item), systemImage: "hand.thumbsup") {
                        dataModel.add(to: item)
                    }
                    .buttonStyle(.plain)
                }
                .font(.title3.bold())
                .padding(10)
                .padding(.horizontal, 10)
                .background(.blue.gradient)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
            }
        }
        .clipShape(.rect(cornerRadius: 25))
        .shadow(color: .black.opacity(0.2), radius: 2)
        .padding(4)
        .containerRelativeFrame(.horizontal)
    }
}

#Preview {
    ItemView(item: Item(id: "azores", description: "The volcanic nature of the Azores is the architect of its appeal and manifests in the dark heart of the stone used in the old buildings and the black sand of the beaches."))
        .environmentObject(DataModel())
}
