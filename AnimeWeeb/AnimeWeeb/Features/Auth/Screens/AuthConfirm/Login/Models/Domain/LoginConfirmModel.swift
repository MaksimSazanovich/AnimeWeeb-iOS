//
//  LoginConfirmModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

struct LoginConfirmModel {
    let email: String
    var code: String = ""
    let codeLength: Int = 6

    var isCodeComplete: Bool {
        code.count == codeLength
    }
}
