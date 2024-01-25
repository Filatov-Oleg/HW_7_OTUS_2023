//
//  BookViewModel.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import Foundation
import NewsapiNetworking

class ViewModel: ObservableObject {
    
    private var currentPage: Int = 1
    
    @Published var articles: [Article] = .init()
    @Published var theme: String = ""
    
    @Published private(set) var historyArticles: [Article]

    let savePath = FileManager.documentsDirectory.appendingPathComponent("Articles")

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            historyArticles = try JSONDecoder().decode([Article].self, from: data)
        } catch {
            historyArticles = []
        }
    }

    func add(_ article: Article) {
        historyArticles.insert(article, at: 0)
        save()
    }
    
    func deleteArticle(with index: IndexSet) {
        historyArticles.remove(atOffsets: index)
        save()
    }

    func nextPage(with theme: String) {
        ArticlesAPI.everythingGet(q: theme,
                                  from: "2024-20-01",
                                  sortBy: "publichedAt",
                                  language: "en",
                                  apiKey: "cc668a0525bf44c480d5b5b5f76c13d0",
        page: currentPage) { data, error in
            if error != nil {
                print("Error ===> \(String(describing: error?.localizedDescription))")
                return
            }
            self.currentPage += 1
            self.articles.append(contentsOf: data?.articles ?? [])
        }
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(historyArticles)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

