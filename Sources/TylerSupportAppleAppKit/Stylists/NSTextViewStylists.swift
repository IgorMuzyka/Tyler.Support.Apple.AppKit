
import Style
import Tag
import Variable

#if os(macOS)
import AppKit

open class NSTextViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public func style(stylable textView: NSTextView, style: NSTextViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .text(let value): textView.string = try value.resolve(pair)
        case .font(let value): textView.font = try value.resolve(pair).native
        case .textColor(let value): textView.textColor = try value.resolve(pair).native
        case .alignment(let value): textView.alignment = try value.resolve(pair).native!
        case .isEditable(let value): textView.isEditable = try value.resolve(pair)
        case .isSelectable(let value): textView.isSelectable = try value.resolve(pair)
        case .textContainerInset(let value): textView.textContainerInset = try value.resolve(pair).native
        case .shadow(let value): textView.shadow = try value.resolve(pair).native
        case .defaultParagraphStyle(let value): textView.defaultParagraphStyle = try value.resolve(pair).native
        case .backgroundColor(let value): textView.backgroundColor = try value.resolve(pair).native
        }
    }
}
#endif
