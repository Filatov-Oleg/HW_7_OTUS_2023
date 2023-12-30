//
//  ContentView.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = BookViewModel()
    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.books) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title )
                                .font(.headline)
                            Text("Автор: " + book.author)
                                .foregroundColor(.secondary)
                            RatingView(rating: book.rating)
                            Text("Отзыв: " + book.review)
                                .font(.footnote)
                        }
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteBook(with: indexSet)
                }
            }
            .navigationTitle("Список книг")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView(viewModel: viewModel)
            }
        }

    }
}

#Preview {
    ContentView()
}
