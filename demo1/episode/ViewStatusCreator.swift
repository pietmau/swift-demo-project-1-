import Foundation
import AVFoundation

class ProgressInfoCreator {
    func createProgressInfo(_ item: AVFoundation.AVPlayerItem) -> ProgressInfo {
        return ProgressInfo(item)
    }
}

class ProgressInfo {
    let durationLabel: TimeLabel
    let currrentTimeLabel: TimeLabel
    var currentTimeInPercent: Double = 0

    init(_ item: AVPlayerItem) {
        let duration = item.duration.seconds
        let currrentTime = item.currentTime().seconds
        durationLabel = TimeLabel(duration)
        currrentTimeLabel = TimeLabel(currrentTime)
        let currentTimeInPercent = calculatePercentage(duration, currrentTime)
    }

    private func calculatePercentage(_ duration: Double?, _ time: Double?) -> Double {
        if (duration?.isNaN != false || time?.isNaN != false) {
            return 50.0 / 100.0
        }
        return (time! / duration!) * 100
    }
}
