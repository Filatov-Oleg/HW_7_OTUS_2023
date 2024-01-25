//
//  RatingView.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import SwiftUI
import NewsapiNetworking

struct DetailScreen: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(article.source?.name ?? "")
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        viewModel.add(article)
                    } label: {
                        Text("Добавить в историю")
                    }
                    .opacity(viewModel.historyArticles.contains(article) ? 0 : 1)
                    .padding(.horizontal)
                }
                AsyncImage(
                    url: URL(string: article.urlToImage ?? ""),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .transition(.scale(scale: 0.3, anchor: .center))
                    case .failure:
                        Image("news")
                            .resizable()
                            .foregroundStyle(Color.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                .scaledToFit()
                VStack(alignment: .leading) {
                    Text(article.title ?? "")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(article.description ?? "")
                    Text(article.publishedAt ?? "")
                        .foregroundColor(Color.secondary)
                        .font(.system(size: 12))
                        .padding(.top)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }

}
