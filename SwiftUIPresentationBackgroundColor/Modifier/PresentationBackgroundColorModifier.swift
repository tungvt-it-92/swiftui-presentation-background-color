//
//  TransparentBackgroundFullScreenCover.swift
//  SwiftUICustomPresentationBackgroundColor
//

import SwiftUI

struct PresentationBackgroundColorModifier: ViewModifier {
    var backgroundColor: Color = .clear
    
    func body(content: Content) -> some View {
        if #available(iOS 16.4, *) {
            content
                .presentationBackground(backgroundColor)
        } else {
            ZStack {
                UIKitIntrospectionView { hostingController in
                    hostingController.view.backgroundColor = UIColor(backgroundColor)
                }
                content
            }
        }
    }
}

extension View {    
    func presentationWithBackgroundColor(color: Color) -> some View {
        return modifier(PresentationBackgroundColorModifier(backgroundColor: color))
    }
}

private struct UIKitIntrospectionView: UIViewControllerRepresentable {
    let onResolve: (UIViewController) -> Void

    func makeUIViewController(context: Context) -> IntrospectionViewController {
        let controller = IntrospectionViewController()
        controller.onResolve = onResolve
        return controller
    }

    func updateUIViewController(_ uiViewController: IntrospectionViewController, context: Context) {}
}

private final class IntrospectionViewController: UIViewController {
    var onResolve: ((UIViewController) -> Void)?

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if let parent = parent {
            onResolve?(parent)
        }
    }
}
