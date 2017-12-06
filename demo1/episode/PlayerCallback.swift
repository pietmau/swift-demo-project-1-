//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

protocol PlayerCallback {

    func onTimeUpdate(duration: TimeLabel, position: TimeLabel, progress: Double)
    func onPlaybackEnded()
}
