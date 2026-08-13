//
//  AppURLOpener.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import UIKit

class AppURLOpener {
    func open(_ url: URL?) {
        guard let url, UIApplication.shared.canOpenURL(url) else {
            print("⚠️ [AppURLOpener] Не удалось открыть URL: \(String(describing: url))")
            return
        }
        UIApplication.shared.open(url)
    }
}
