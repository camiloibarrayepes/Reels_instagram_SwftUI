//
//  MediaFile.swift
//  Reels_Instagram
//
//  Created by Camilo Ibarra yepes on 9/10/22.
//

import SwiftUI

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}

var MediaFileJSON = [
    MediaFile(url: "Reel2", title: "Reel 1 description"),
    MediaFile(url: "Reel1", title: "Reel 2 description"),
    MediaFile(url: "Reel3", title: "Reel 3 description"),
    MediaFile(url: "Reel4", title: "Reel 4 description")
]

