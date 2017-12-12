//
// Created by Maurizio Pietrantuono on 05/12/2017.
// Copyright (c) 2017 Maurizio Pietrantuono. All rights reserved.
//

import Foundation

protocol PlayerView {

    func showRestart()

    func showPlay()

    func onTimeUpdate(progress: ProgressInfo)

    func hidePleaseWait(hide: Bool)
}
