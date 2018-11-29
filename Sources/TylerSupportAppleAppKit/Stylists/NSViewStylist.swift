
import Style
import Tag
import Variable

#if os(macOS)
import AppKit

open class NSViewStylist: GenericStylist {

	public static var keyPath: AnyKeyPath?

    public required init() {}

	public func style(stylable view: NSView, style: NSViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
		switch style {
		case .wantsLayer(let value): view.wantsLayer = try value.resolve(pair)
		case .translatesAutoresizingMaskIntoConstraints(let value): view.translatesAutoresizingMaskIntoConstraints = try value.resolve(pair)
		case .alphaValue(let value): view.alphaValue = try value.resolve(pair).native
		case .isHidden(let value): view.isHidden = try value.resolve(pair)
		}
	}
}

#endif
