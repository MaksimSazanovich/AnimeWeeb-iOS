//
//  RegisterConfirmModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct RegisterConfirmModel {
    let email: String
    var code: String = ""
    let codeLength: Int = 6

    var nickname: String = ""
    var avatar: Data?

    var isFormComplete: Bool {
        code.count == codeLength && !nickname.isEmpty && avatar != nil
    }
}
