//
//  File.swift
//  
//
//  Created by Sparkcode on 5/10/21.
//

import SwiftUI

/**
 Provides SwiftUI preview functionality for UIViews
 */
@available(iOS 13.0, *)
public struct UIViewPreview<T: UIView>: UIViewRepresentable {
    
    let view: T
    
    /**
        Initializer that takes an instantiated UIView.
     
        - Parameters:
            - view: UIView instance that will be used in the preview.
            - onLoad: A closure to be used for additional view configuration. This can be used to set dependencies.
     */
    public init(
        view: T,
        onLoad: ((T) -> Void)?
    ) {
        self.view = view
        onLoad?(view)
    }
    
    /**
        Initializer for view controllers loaded from storyboard.
     
        - Parameters:
            - bundle: Bundle to load view controller from.
            - nibName: The name of the of nib to load.
            - onLoad: A closure to be used for additional view configuration. This can be used to set dependencies.
     */
    public init(
        bundle: Bundle,
        nibName: String,
        onLoad: ((T) -> Void)?
    ) {
        let nib = UINib(nibName: nibName, bundle: bundle)
        let viewStack = nib.instantiate(withOwner: nil, options: nil)
        guard let view = viewStack.first as? T else {
            fatalError("Unable to load nib named: \(nibName)")
        }
        self.init(view: view, onLoad: onLoad)
    }
    
    @available(iOS 13.0.0, *)
    public func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        // no op
    }
}
