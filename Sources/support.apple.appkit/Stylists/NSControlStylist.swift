
import style
import tag
import variable

#if os(macOS)
import AppKit

open class NSControlStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public func style(stylable control: NSControl, style: NSControlStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .isEnabled(let value): control.isEnabled = try value.resolve(pair)
        case .isHighlighted(let value): control.isHighlighted = try value.resolve(pair)
        case .tag(let value): control.tag = try value.resolve(pair)
        }
    }
}

#endif
