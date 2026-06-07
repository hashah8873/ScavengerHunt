import SwiftUI

// MARK: - Hunt Item Model

struct HuntItem: Identifiable {
    let id = UUID()
    let name: String
    let clue: String
    var found: Bool
}

// MARK: - Main View

struct ContentView: View {

    // List of scavenger hunt items
    @State private var huntItems: [HuntItem] = [

        HuntItem(name: "Coffee Cup",
                 clue: "Found where fresh coffee is served.",
                 found: false),

        HuntItem(name: "Movie Ticket",
                 clue: "Found where movies are shown.",
                 found: false),

        HuntItem(name: "Book",
                 clue: "Found where stories live.",
                 found: false),

        HuntItem(name: "Pizza Slice",
                 clue: "Found where hot food is served.",
                 found: false),

        HuntItem(name: "Burger",
                 clue: "Found at a fast food location.",
                 found: false),

        HuntItem(name: "Popcorn",
                 clue: "Popular at movie theatres.",
                 found: false),

        HuntItem(name: "Ice Cream",
                 clue: "Cold and sweet treat.",
                 found: false),

        HuntItem(name: "Gift Card",
                 clue: "Can be used for shopping.",
                 found: false),

        HuntItem(name: "Newspaper",
                 clue: "Contains local news.",
                 found: false),

        HuntItem(name: "Toy",
                 clue: "A fun item for children.",
                 found: false)
    ]

    // Count found items
    var foundCount: Int {
        huntItems.filter { $0.found }.count
    }

    // Reward message
    var rewardMessage: String {

        if foundCount == 10 {
            return "Congratulations! You qualify for the $5000 Grand Prize Draw!"
        }

        if foundCount >= 7 {
            return "You earned a 20% Discount Code!"
        }

        if foundCount >= 5 {
            return "You earned a 10% Discount Code!"
        }

        return "Keep searching for more items!"
    }

    var body: some View {

        NavigationStack {

            VStack {
                Text("Local Business Hunt")
                    .font(.largeTitle)
                    .bold()

                Text("Items Found: \(foundCount) / 10")
                    .font(.headline)
                    .padding(.bottom)

                ProgressView(value: Double(foundCount), total: 10)
                    .padding(.horizontal)

                List {

                    ForEach($huntItems) { $item in

                        VStack(alignment: .leading) {

                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.orange)

                                Text(item.name)
                                    .font(.headline)
                            }
                                .font(.headline)

                            Text(item.clue)
                                .font(.caption)
                                .foregroundColor(.secondary)

                            Toggle("Found Item", isOn: $item.found)
                        }
                        .padding(.vertical, 5)
                    }
                }

                Text(rewardMessage)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
            }
            .navigationTitle("Local Business Hunt")
        }
    }
}

#Preview {
    ContentView()
}
