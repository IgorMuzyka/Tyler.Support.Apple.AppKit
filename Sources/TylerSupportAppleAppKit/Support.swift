
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
        register(type: CALayerStyle.self)
        register(alias: CALayerStyle.alias, for: CALayerStyle.self)
        register(type: NSViewStyle.self)
        register(alias: NSViewStyle.alias, for: NSViewStyle.self)
        register(type: NSControlStyle.self)
        register(alias: NSControlStyle.alias, for: NSControlStyle.self)
        register(type: NSTextViewStyle.self)
        register(alias: NSTextViewStyle.alias, for: NSTextViewStyle.self)
        register(type: NSButtonStyle.self)
        register(alias: NSButtonStyle.alias, for: NSButtonStyle.self)
        register(type: NSScrollViewStyle.self)
        register(alias: NSScrollViewStyle.alias, for: NSControlStyle.self)
    }
}
