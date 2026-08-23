//
//  AuthViewModelProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

protocol AuthViewModelProtocol {

    var onRoute: ((Screen) -> Void)? { get set }

    func didTapGetCodeButton()
    func didTapSwitchAuthButton()
}
