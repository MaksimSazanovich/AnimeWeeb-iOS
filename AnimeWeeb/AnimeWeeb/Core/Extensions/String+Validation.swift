//
//  String+Validation.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

extension String {
    var emailValidationError: ValidationError? {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed.isEmpty {
            return .empty
        }
        
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if !predicate.evaluate(with: trimmed) {
            return .invalidFormat
        }
        
        return nil
    }
}

enum ValidationError: LocalizedError {
    case empty
    case invalidFormat
    case domainTooShort

    var errorDescription: String? {
        switch self {
        case .empty:
            return "Пожалуйста, введите email"
        case .invalidFormat:
            return "Некорректный формат email (пример: name@domain.com)"
        case .domainTooShort:
            return "Проверьте доменную часть почты"
        }
    }
}
