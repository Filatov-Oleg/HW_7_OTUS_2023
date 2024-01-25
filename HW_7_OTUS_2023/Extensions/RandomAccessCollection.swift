//
//  RandomAccessCollection.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 24.01.2024.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastElement<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(
            where: { AnyHashable($0.id) == AnyHashable(item.id) }
        ) else { return false }
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
