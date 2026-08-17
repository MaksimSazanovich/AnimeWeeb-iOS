//
//  AuthViewModelProtocol.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

protocol AuthViewModelProtocol {

    var onRoute: (() -> Void)? { get set }

    func didTapGetCodeButton()
    func didTapSwitchAuthButton()
}
