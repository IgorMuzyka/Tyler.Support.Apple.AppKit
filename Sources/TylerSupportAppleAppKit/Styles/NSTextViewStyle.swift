
import Variable
import Substitutes
import Style
import Tag
import TypePreservingCodingAdapter

public enum NSTextViewStyle: Style {

	case text(Variable<String>)
    case font(Variable<Font>)
    case textColor(Variable<Color>)
    case alignment(Variable<TextAlignment>)
    case isEditable(Variable<Bool>)
    case isSelectable(Variable<Bool>)
    case textContainerInset(Variable<Size>)
//    case linkTextAttributes
    case shadow(Variable<AttributedString.Shadow>)
    case defaultParagraphStyle(Variable<AttributedString.ParagraphStyle>)
    case backgroundColor(Variable<Color>)
//    case typingAttributes

}

extension NSTextViewStyle {

    public static var alias: Alias = "NSTextViewStyle"
}

extension NSTextViewStyle: Codable {

    private enum CodingKeys: StringLiteralType, CodingKey {

		case text
        case font
        case textColor
        case alignment
        case isEditable
        case isSelectable
        case textContainerInset
        case textContainerOrigin
        case baselineOffsetFromBottom
        case firstBaselineOffsetFromTop
        case lastBaselineOffsetFromBottom
        case shadow
        case defaultParagraphStyle
        case backgroundColor
    }

    public enum NSTextViewStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

		if let value = try? container.decode(Variable<String>.self, forKey: .text) {
			self = .text(value)
		} else if let value = try? container.decode(Variable<Font>.self, forKey: .font) {
            self = .font(value)
        } else if let value = try? container.decode(Variable<Color>.self, forKey: .textColor) {
            self = .textColor(value)
        } else if let value = try? container.decode(Variable<TextAlignment>.self, forKey: .alignment) {
            self = .alignment(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .isEditable) {
            self = .isEditable(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .isSelectable) {
            self = .isSelectable(value)
        } else if let value = try? container.decode(Variable<Size>.self, forKey: .textContainerInset) {
            self = .textContainerInset(value)
        } else if let value = try? container.decode(Variable<AttributedString.Shadow>.self, forKey: .shadow) {
            self = .shadow(value)
        } else if let value = try? container.decode(Variable<AttributedString.ParagraphStyle>.self, forKey: .defaultParagraphStyle) {
            self = .defaultParagraphStyle(value)
        } else if let value = try? container.decode(Variable<Color>.self, forKey: .backgroundColor) {
            self = .backgroundColor(value)
        } else {
            throw NSTextViewStyleCodingError.decoding("\(dump(container))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .text(let value): try? container.encode(value, forKey: .font)
        case .font(let value): try? container.encode(value, forKey: .font)
        case .textColor(let value): try? container.encode(value, forKey: .textColor)
        case .alignment(let value): try? container.encode(value, forKey: .alignment)
        case .isEditable(let value): try? container.encode(value, forKey: .isEditable)
        case .isSelectable(let value): try? container.encode(value, forKey: .isSelectable)
        case .textContainerInset(let value): try? container.encode(value, forKey: .textContainerInset)
        case .shadow(let value): try? container.encode(value, forKey: .shadow)
        case .defaultParagraphStyle(let value): try? container.encode(value, forKey: .defaultParagraphStyle)
        case .backgroundColor(let value): try? container.encode(value, forKey: .backgroundColor)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: NSTextViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
