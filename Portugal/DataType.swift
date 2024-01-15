
import Foundation


struct Category: Decodable, Identifiable {
    var id: String
    var icon: String
    var items: [Item]
}

struct Item: Decodable, Identifiable {
    var id: String
    var description: String
}
