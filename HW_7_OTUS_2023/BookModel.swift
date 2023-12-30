//
//  BookModel.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import Foundation

struct BookModel: Identifiable, Codable {
    var id: UUID
    var title: String
    var author: String
    var rating: Int
    var genre: String
    var review: String
}
