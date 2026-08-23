//
//  AuthViewModelProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

protocol AuthViewModelProtocol {

    var state: ViewState { get set }
    var onRoute: ((Screen) -> Void)? { get set }

    func didTapGetCodeButton()
    func didTapSwitchAuthButton()
}
