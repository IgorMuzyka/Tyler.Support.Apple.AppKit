
import Tyler
import Style
import TylerSupportAppleCommon
import TypePreservingCodingAdapter

#if os(macOS)
import AppKit

extension Factory {

    public static var defaultAppKit: Factory {
        return Factory()
            .add(NSView.init)
            .add(NSTextView.init)
            .add(NSButton.init)
            .add(NSScrollView.init)
    }
}
extension StylistsStore {

    public static var defaultAppKit: StylistsStore {
        return StylistsStore()
            .add(stylist: NSViewStylist(), for: NSViewStyle.self)
            .add(stylist: NSControlStylist(), for: NSControlStyle.self)
            .add(stylist: CALayerStylist(), for: CALayerStyle.self)
            .add(stylist: NSTextViewStylist(), for: NSTextViewStyle.self)
            .add(stylist: NSButtonStylist(), for: NSButtonStyle.self)
            .add(stylist: NSScrollViewStylist(), for: NSScrollViewStyle.self)
    }
}

#endif

extension TypePreservingCodingAdapter {

    public func registerAppKitSupportStyles() {
        register(style: CALayerStyle.self)
        register(style: NSViewStyle.self)
        register(style: NSControlStyle.self)
        register(style: NSTextViewStyle.self)
        register(style: NSButtonStyle.self)
        register(style: NSScrollViewStyle.self)
    }
}
