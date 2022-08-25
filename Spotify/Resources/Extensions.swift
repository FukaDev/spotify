//
//  Extensions.swift
//  Spotify
//
//  Created by Thais Morimoto on 31/05/1401 AP.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
        
    }
    var height: CGFloat {
        return frame.size.height
        
    }
    var left: CGFloat {
        return frame.origin.x
        
    }
    var right: CGFloat {
        return left + width
        
    }
    var top: CGFloat {
        return frame.origin.y
    }
    var button: CGFloat {
        return top + height
        
    }
}

