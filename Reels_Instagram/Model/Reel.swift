//
//  Reel.swift
//  Reels_Instagram
//
//  Created by Camilo Ibarra yepes on 9/10/22.
//

import SwiftUI
import AVKit

struct Reel: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
