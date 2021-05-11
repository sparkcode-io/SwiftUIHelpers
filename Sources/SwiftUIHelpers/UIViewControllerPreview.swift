//
//  File.swift
//  
//
//  Created by Sparkcode on 5/10/21.
//

import SwiftUI

/**
 Provides SwiftUI preview functionality for UIViewControllers
 */
@available(iOS 13.0, *)
public struct UIViewControllerPreview<T: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: T
    
    /**
        Initializer that takes an instantiated UIViewController
     
        - Parameters:
            - viewController: UIViewController instance that will be used in the preview.
            - onLoad: A closure to be used for additional view controller configuration. This can be used to set dependencies.
     */
    public init(
        viewController: T,
        onLoad: ((T) -> Void)?
    ) {
        self.viewController = viewController
        onLoad?(viewController)
    }
    
    /**
        Initializer for view controllers loaded from storyboard.
     
        - Parameters:
            - storyboard: UIStoryboard to load view controller from.
            - vcId: The storyboard identifier for the view controller.
            - onLoad: A closure to be used for additional view controller configuration. This can be used to set dependencies.
     */
    public init(
        storyboard: UIStoryboard,
        vcId: String,
        onLoad: ((T) -> Void)?
    ) {
        guard let vc = storyboard.instantiateViewController(withIdentifier: vcId) as? T else {
            fatalError("Unable to load view controller for id: \(vcId)")
        }
        vc.loadViewIfNeeded()
        self.init(viewController: vc, onLoad: onLoad)
    }
    
    @available(iOS 13.0.0, *)
    public func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // no-op
    }
}
