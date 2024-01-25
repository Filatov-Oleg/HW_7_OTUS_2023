//
//  AddBookView.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import SwiftUI

struct HistoryScreen: View {
    
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.historyArticles) { article in
                    Text(article.title ?? "")
                }
                .onDelete { indexSet in
                    viewModel.deleteArticle(with: indexSet)
                }
            }
            .navigationTitle("История")
        }

    }
}


