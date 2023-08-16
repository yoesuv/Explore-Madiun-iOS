//
//  LoadingOverlay.swift
//  Explore Madiun iOS
//
//  Created by Yusuf Saifudin on 15/08/23.
//

import Foundation
import UIKit

public class LoadingOverlay {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    private var textLabel = UILabel()
    
    private let sizeView: CGFloat = 130
    private let sizeFrame: CGFloat = 65
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView!, text: String) {
        let rect = CGRect(x: view.frame.midX-sizeFrame, y: view.frame.midY-sizeFrame, width: sizeView, height: sizeView)
        overlayView = UIView(frame: rect)
        overlayView.layer.cornerRadius = 26
        
        textLabel = UILabel(frame: CGRect(x: 15, y: 72, width: 100, height: 50))
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor(named: "Primary")
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.text = text
        overlayView.addSubview(textLabel)
        
        overlayView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(named: "Primary")
        activityIndicator.center = overlayView.center
        activityIndicator.frame = CGRect(x: 39, y: 26, width: 52, height: 52)
        overlayView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        view.addSubview(overlayView)
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
