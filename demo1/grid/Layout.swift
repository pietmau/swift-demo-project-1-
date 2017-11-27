//
//  Layout.swift
//  demo1
//
//  Created by Maurizio Pietrantuono on 27/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class Layout: NSObject, UICollectionViewDelegateFlowLayout {
    let SPACING = CGFloat(3)
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SPACING
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("sizeForItemAt")
        return calculateItemSize(collectionView)
    }
    
    private func calculateItemSize(_ collectionView: UICollectionView) -> CGSize {
        switch (UIDevice.current.orientation) {
        case .landscapeLeft,
             .landscapeRight:
            return getLandscapeSize(collectionView)
        case .portrait,
             .portraitUpsideDown:
            return getPortraitSize(collectionView)
        case .faceDown,
             .faceUp,
             .unknown:
            return getPortraitSize(collectionView)
        }
    }
    
    private func getPortraitSize(_ collectionView: UICollectionView) -> CGSize {
        let size: CGFloat = (collectionView.frame.width - 2.0 * SPACING) / 3.0
        print("portrait \(size)")
        return CGSize(width: size, height: size)
    }
    
    private func getLandscapeSize(_ collectionView: UICollectionView) -> CGSize {
        let size: CGFloat = (collectionView.frame.width - 4.0 * SPACING) / 5.0
        print("landscape \(size)")
        return CGSize(width: size, height: size)
    }
}
