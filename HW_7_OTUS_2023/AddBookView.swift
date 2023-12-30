//
//  AddBookView.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import SwiftUI

struct AddBookView: View {
    
    @ObservedObject var viewModel: BookViewModel

    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Название", text: $title)
                    TextField("Автор", text: $author)
                    
                    Picker("Жанр", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: rating)
                } header: {
                    Text("Отзыв")
                }
                
                Section {
                    Button("Сохранить") {
                        let newBook = BookModel(id: UUID(),
                                                title: title,
                                                author: author,
                                                rating: rating,
                                                genre: genre,
                                                review: review)
                        viewModel.add(newBook)
                        dismiss()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Label("", systemImage: "multiply")
                        }
                    }
                }
            }
            .navigationTitle("Добавить книгу")
        }
    }
}


