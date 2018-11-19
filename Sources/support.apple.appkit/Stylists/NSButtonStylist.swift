
import style
import tag
import variable

#if os(macOS)
import AppKit

open class NSButtonStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public func style(stylable button: NSButton, style: NSButtonStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .title(let value): button.title = try value.resolve(pair)
        case .shadow(let value): button.shadow = try value.resolve(pair).native
        case .attributedTitle(let value): button.attributedTitle = try value.resolve(pair).native
        case .alternateTitle(let value): button.alternateTitle = try value.resolve(pair)
        case .attributedAlternateTitle(let value): button.attributedAlternateTitle = try value.resolve(pair).native
        case .buttonType(let value): button.setButtonType(try value.resolve(pair).native!)
        case .image(let value): button.image = try value.resolve(pair).native
        case .imageScaling(let value): button.imageScaling = try value.resolve(pair).native!
        case .imagePosition(let value): button.imagePosition = try value.resolve(pair).native!
        case .imageHugsTitle(let value): button.imageHugsTitle = try value.resolve(pair)
        case .bezelColor(let value): button.bezelColor = try value.resolve(pair).native
        case .bezelStyle(let value): button.bezelStyle = try value.resolve(pair).native!
        }
    }
}

#endif
