
import Style
import Tag
import Variable

#if os(macOS)
import AppKit

open class NSScrollViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable scrollView: NSScrollView, style: NSScrollViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .contentInsets(let value): scrollView.contentInsets = try value.resolve(pair).native
        case .autohidesScrollers(let value): scrollView.autohidesScrollers = try value.resolve(pair)
        case .scrollerInsets(let value): scrollView.scrollerInsets = try value.resolve(pair).native
        case .scrollerStyle(let value): scrollView.scrollerStyle = try value.resolve(pair).native!
        case .hasVerticalScroller(let value): scrollView.hasVerticalScroller = try value.resolve(pair)
        case .hasHorizontalScroller(let value): scrollView.hasHorizontalScroller = try value.resolve(pair)
        case .hasVerticalRuler(let value): scrollView.hasVerticalRuler = try value.resolve(pair)
        case .hasHorizontalRuler(let value): scrollView.hasHorizontalRuler = try value.resolve(pair)
        case .scrollerKnobStyle(let value): scrollView.scrollerKnobStyle = try value.resolve(pair).native!
        case .rulersVisible(let value): scrollView.rulersVisible = try value.resolve(pair)
        case .scrollsDynamically(let value): scrollView.scrollsDynamically = try value.resolve(pair)
        }
    }
}

#endif
