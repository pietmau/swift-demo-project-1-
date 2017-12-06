//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

protocol Player {
    var isPlaying: Bool { get }

    func play()

    func pause()

    func stop()

    func seekTo(_ value: Float)
}
