//
//  UIDevice+ID+Name.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation
import UIKit

extension UIDevice {
    static var deviceID: String {
        current.identifierForVendor?.uuidString ?? UUID().uuidString
    }

    static var deviceName: String {
        current.name
    }
}
