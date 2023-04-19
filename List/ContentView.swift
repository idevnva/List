//
//  ContentView.swift
//  List
//
//  Created by Владислав Новошинский on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var items: [ListItem] =
    [
        ListItem(name: "Random item №"),
        ListItem(name: "Random item №"),
        ListItem(name: "Random item №")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text("\(item.name)\(item.randomNumber)")
                        .foregroundColor(.white)
                        .listRowBackground(Color("blue"))
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
            }
            .scrollContentBackground(.hidden)
            .background(Color("lightBlue"))
            .navigationBarTitle("List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
            .toolbarBackground(Color("blue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    private func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    private func addItem() {
        let newItem = ListItem(name: "Random item №")
        items.append(newItem)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
