# SwiftUIHelpers

A collecition of helpful SwiftUI utilities. Previews can be used in UIKIt projects and projects that do no support SwiftUI as well, this is because the code is simply for previews and not for code that ships with the app. 

Example UIViewController preview created from a storyboard.
```swift
UIViewControllerPreview<ViewController>(
    storyboard: UIStoryboard(name: "Main", bundle: .main),
    vcId: "ViewController",
    onLoad: { (vc) in
        vc.loadViewIfNeeded()
        vc.profileImage.image = #imageLiteral(resourceName: "sparkcode_logo")
        vc.nameLabel.text = "Sparkcode"
        vc.bioLabel.text = "Some short bio that fits."
    }
)
```

Example UIViewController preview created programmatically.
```swift
UIViewControllerPreview(
    viewController: ViewController(),
    onLoad: { (vc) in
        vc.profileImage.image = #imageLiteral(resourceName: "sparkcode_logo")
        vc.nameLabel.text = "Sparkcode"
        vc.bioLabel.text = "Some short bio that fits."
    }
)
```

Example UIView preview created from a nib file.
```swift
UIViewPreview<NibView>(
    bundle: .main,
    nibName: "NibView",
    config: { (view) in
        view.titleLabel.text = "Sparkcode!"
        view.descriptionLabel.text = "How to use SwiftUI previews with a nib file!!!"
    }
)
```

Example UIView preview created programmatically.
```swift
UIViewPreview(
    view: ProgrammaticView(),
    config: { (view) in
        view.titleLabel.text = "Sparkcode!"
        view.descriptionLabel.text = "How to use SwiftUI previews with a view programmatically!!!"
    }
)
```
