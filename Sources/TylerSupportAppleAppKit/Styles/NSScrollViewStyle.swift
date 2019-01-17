
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum NSScrollViewStyle: Style {

    case contentInsets(Variable<EdgeInsets>)
    case autohidesScrollers(Variable<Bool>)
    case scrollerInsets(Variable<EdgeInsets>)
    case scrollerStyle(Variable<ScrollerStyle>)
    case hasVerticalScroller(Variable<Bool>)
    case hasHorizontalScroller(Variable<Bool>)
    case hasVerticalRuler(Variable<Bool>)
    case hasHorizontalRuler(Variable<Bool>)
    case scrollerKnobStyle(Variable<ScrollerKnobStyle>)
    case rulersVisible(Variable<Bool>)
    case scrollsDynamically(Variable<Bool>)
}

extension NSScrollViewStyle {

    public static var alias: Alias = "NSScrollViewStyle"
}

extension NSScrollViewStyle: Codable {

    private enum CodingKeys: StringLiteralType, CodingKey {

        case contentInsets
        case autohidesScrollers
        case scrollerInsets
        case scrollerStyle
        case hasVerticalScroller
        case hasHorizontalScroller
        case hasVerticalRuler
        case hasHorizontalRuler
        case scrollerKnobStyle
        case rulersVisible
        case scrollsDynamically
    }

    public enum NSScrollViewStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? container.decode(Variable<EdgeInsets>.self, forKey: .contentInsets) {
            self = .contentInsets(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .autohidesScrollers) {
            self = .autohidesScrollers(value)
        } else if let value = try? container.decode(Variable<EdgeInsets>.self, forKey: .scrollerInsets) {
            self = .scrollerInsets(value)
        } else if let value = try? container.decode(Variable<ScrollerStyle>.self, forKey: .scrollerStyle) {
            self = .scrollerStyle(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .hasVerticalScroller) {
            self = .hasVerticalScroller(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .hasHorizontalScroller) {
            self = .hasHorizontalScroller(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .hasVerticalRuler) {
            self = .hasVerticalRuler(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .hasHorizontalRuler) {
            self = .hasHorizontalRuler(value)
        } else if let value = try? container.decode(Variable<ScrollerKnobStyle>.self, forKey: .scrollerKnobStyle) {
            self = .scrollerKnobStyle(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .rulersVisible) {
            self = .rulersVisible(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .scrollsDynamically) {
            self = .scrollsDynamically(value)
        } else {
            throw NSScrollViewStyleCodingError.decoding("\(dump(container))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .contentInsets(let value): try container.encode(value, forKey: .contentInsets)
        case .autohidesScrollers(let value): try container.encode(value, forKey: .autohidesScrollers)
        case .scrollerInsets(let value): try container.encode(value, forKey: .scrollerInsets)
        case .scrollerStyle(let value): try container.encode(value, forKey: .scrollerStyle)
        case .hasVerticalScroller(let value): try container.encode(value, forKey: .hasVerticalScroller)
        case .hasHorizontalScroller(let value): try container.encode(value, forKey: .hasHorizontalScroller)
        case .hasVerticalRuler(let value): try container.encode(value, forKey: .hasVerticalRuler)
        case .hasHorizontalRuler(let value): try container.encode(value, forKey: .hasHorizontalRuler)
        case .scrollerKnobStyle(let value): try container.encode(value, forKey: .scrollerKnobStyle)
        case .rulersVisible(let value): try container.encode(value, forKey: .rulersVisible)
        case .scrollsDynamically(let value): try container.encode(value, forKey: .scrollsDynamically)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: NSScrollViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
