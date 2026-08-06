//
//  AppURLOpener.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import UIKit

class AppURLOpener {
    func open(_ url: URL?) {
        guard let url else { fatalError("Invalid URL") }
        UIApplication.shared.open(url)
    }
}
