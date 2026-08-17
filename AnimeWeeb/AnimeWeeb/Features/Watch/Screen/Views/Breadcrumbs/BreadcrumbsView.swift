//
//  BreadcrumbsView.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import SwiftUI

struct BreadcrumbsView: View {

    let items: [BreadcrumbItem]
    var onItemTap: (BreadcrumbItem) -> Void

    private let separator: String = " / "
    @State private var tappedItemID: String?

    var body: some View {
        Text(formattedBreadcrumbs)
            .environment(\.openURL, OpenURLAction { url in
                if url.scheme == "breadcrumb", let id = url.host {
                    if let tappedItem = items.first(where: { $0.id == id }) {

                        tappedItemID = id

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                tappedItemID = nil
                                onItemTap(tappedItem)
                            }
                        }
                    }
                    return .handled
                }
                return .systemAction
            })
    }

    private var formattedBreadcrumbs: AttributedString {
        var result = AttributedString()

        for (index, item) in items.enumerated() {
            let isLast = index == items.count - 1
            var itemString = AttributedString(item.title)

            if isLast {
                itemString.font = .body
                itemString.foregroundColor = .primary
            } else {
                itemString.font = .body

                let isTapped = item.id == tappedItemID
                itemString.foregroundColor = isTapped ? .primary : .secondary

                if let url = URL(string: "breadcrumb://\(item.id)") {
                    itemString.link = url
                }
            }

            result.append(itemString)

            if !isLast {
                var separatorString = AttributedString(separator)
                separatorString.font = .body
                separatorString.foregroundColor = .genreText
                result.append(separatorString)
            }
        }

        return result
    }
}
