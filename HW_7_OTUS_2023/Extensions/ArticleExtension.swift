//
//  ArticleExtension.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 24.01.2024.
//

import Foundation
import NewsapiNetworking

extension Article: Identifiable {
    public var id: String { url } // потому что url единственный неопциональный параметр
}
