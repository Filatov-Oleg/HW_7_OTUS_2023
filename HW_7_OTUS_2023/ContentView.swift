//
//  ContentView.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ViewModel()
    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    let isLast = viewModel.articles.isLastElement(article)
                    NavigationLink(destination: DetailScreen(article: article)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.title ?? "")
                            }
                        }
                    }
                    .onAppear {
                        if isLast {
                            viewModel.nextPage(with: "Cat")
                        }
                    }
                }
            }
            .navigationTitle("Новости")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Text("История")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                HistoryScreen()
            }
            .onAppear {
                viewModel.nextPage(with: "Cat")
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
