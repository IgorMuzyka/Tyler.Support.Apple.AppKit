
import Tyler
import Style
import TylerSupportAppleCommon

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

extension StylesSerializersStore {

    public static var defaultAppKit: StylesSerializersStore {
        return StylesSerializersStore(decoder: JSONDecoder())
            .register(NSViewStyle.self)
            .register(NSControlStyle.self)
            .register(CALayerStyle.self)
            .register(NSTextViewStyle.self)
            .register(NSButtonStyle.self)
            .register(NSScrollViewStyle.self)
    }
}

#endif
