//
//  String+Char.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

extension String {
    subscript(safe index: Int) -> Character? {
        guard index >= 0 && index < count else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
}
