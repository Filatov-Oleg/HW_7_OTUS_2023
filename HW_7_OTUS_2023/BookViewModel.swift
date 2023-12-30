//
//  BookViewModel.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import Foundation

class BookViewModel: ObservableObject {
    
    @Published private(set) var books: [BookModel]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedBooks")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            books = try JSONDecoder().decode([BookModel].self, from: data)
        } catch {
            books = []
        }
    }

    func add(_ book: BookModel) {
        books.append(book)
        save()
    }
    
    func deleteBook(with index: IndexSet) {
        books.remove(atOffsets: index)
        save()
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(books)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

