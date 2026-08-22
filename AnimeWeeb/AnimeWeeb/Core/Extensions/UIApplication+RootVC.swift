//
//  UIApplication+RootVC.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import UIKit

extension UIApplication {
    @MainActor
    var rootViewController: UIViewController? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}
