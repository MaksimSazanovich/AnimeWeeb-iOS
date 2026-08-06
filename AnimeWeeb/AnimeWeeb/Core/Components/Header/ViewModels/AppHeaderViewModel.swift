//
//  AppHeaderViewModel.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import Observation

@Observable
public class AppHeaderViewModel {
    
    private let urlOpener: AppURLOpener
    
    var isMenuOpen = false
    var isLoggedIn = false
    
    //TODO: User Service
    var user: User?
    
    init(urlOpener: AppURLOpener, isLoggedIn: Bool = false, user: User? = nil) {
        self.urlOpener = urlOpener
        self.isLoggedIn = isLoggedIn
        self.user = user
    }
    
    func onMenuButtonTapped() {
        isMenuOpen.toggle()
    }
    
    func didTapSocial(socialMedia: SocialMedia) {
        urlOpener.open(socialMedia.url)
    }
}
