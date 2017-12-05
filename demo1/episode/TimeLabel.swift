//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

struct TimeLabel: CustomStringConvertible {
    public let hh: Int
    public let mm: Int
    public let ss: Int
    var description: String {
        get {
            return getDescription()
        }
    }

    init(hh: Int, mm: Int, ss: Int) {
        self.hh = hh
        self.mm = mm
        self.ss = ss
    }

    init(_ duration: Double?) {
        if (duration?.isNaN == false) {
            let durationInt = Int(duration!)
            ss = durationInt % 60
            mm = (durationInt / 60) % 60
            hh = (durationInt / 60) / 60 % 60
            return
        }
        ss = 0
        mm = 0
        hh = 0
    }


    public func getDescription() -> String {
        let seconds = getSeconds()
        let minutes = getMinutes()
        return minutes + ":" + seconds
    }

    private func getMinutes() -> String {
        return getStringRepresentation(mm)
    }

    private func getSeconds() -> String {
        return getStringRepresentation(ss)
    }

    private func getStringRepresentation(_ integer: Int) -> String {
        if (integer > 9) {
            return "\(integer)"
        }
        return "0\(integer)"
    }
}
