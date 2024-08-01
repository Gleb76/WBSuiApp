import SwiftUI
import UISystem

struct ListView: View {
    @ObservedObject var listViewModel = ListViewModel()
    @State private var searchText = ""

    var filteredItems: [ItemModel] {
        if searchText.isEmpty {
            return listViewModel.items
        } else {
            return listViewModel.items.filter { $0.title.contains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding(.top, 10)

                List {
                    ForEach(filteredItems) { item in
                        HStack {
                            Text(item.title)
                            Spacer()
                            if item.isCompleted {
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            listViewModel.updateItemCompletion(id: item.id)
                        }
                    }
                    .onDelete(perform: listViewModel.removeItem)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ToDoList")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView(listViewModel: listViewModel))
            )
            .onAppear(perform: bindViewModel)
        }
    }

    func bindViewModel() {
        listViewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                print(statusText)
            }
        }
    }
}

#Preview {
    ListView()
}
