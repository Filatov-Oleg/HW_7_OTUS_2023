//
//  FileManager-DocumentsDirectory.swift
//  HW_7_OTUS_2023
//
//  Created by Филатов Олег Олегович on 30.12.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
