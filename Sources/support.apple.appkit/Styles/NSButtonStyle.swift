
import variable
import substitutes
import style
import tag

public enum NSButtonStyle: Style {

    case title(Variable<String>)
    case shadow(Variable<AttributedString.Shadow>)
    case attributedTitle(Variable<AttributedString>)
    case alternateTitle(Variable<String>)
    case attributedAlternateTitle(Variable<AttributedString>)
    case buttonType(Variable<AppKitButtonType>)
    case image(Variable<Image>)
    case imageScaling(Variable<ImageScaling>)
    case imagePosition(Variable<ImagePosition>)
    case imageHugsTitle(Variable<Bool>)
    case bezelColor(Variable<Color>)
    case bezelStyle(Variable<AppKitBezelStyle>)
}

extension NSButtonStyle: Codable {

    private enum CodingKeys: StringLiteralType, CodingKey {

        case title
        case shadow
        case attributedTitle
        case alternateTitle
        case attributedAlternateTitle
        case buttonType
        case image
        case imageScaling
        case imagePosition
        case imageHugsTitle
        case bezelColor
        case bezelStyle
    }

    public enum NSButtonStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? container.decode(Variable<String>.self, forKey: .title) {
            self = .title(value)
        } else if let value = try? container.decode(Variable<AttributedString.Shadow>.self, forKey: .shadow) {
            self = .shadow(value)
        } else if let value = try? container.decode(Variable<AttributedString>.self, forKey: .attributedTitle) {
            self = .attributedTitle(value)
        } else if let value = try? container.decode(Variable<String>.self, forKey: .alternateTitle) {
            self = .alternateTitle(value)
        } else if let value = try? container.decode(Variable<AttributedString>.self, forKey: .attributedAlternateTitle) {
            self = .attributedAlternateTitle(value)
        } else if let value = try? container.decode(Variable<AppKitButtonType>.self, forKey: .buttonType) {
            self = .buttonType(value)
        } else if let value = try? container.decode(Variable<Image>.self, forKey: .image) {
            self = .image(value)
        } else if let value = try? container.decode(Variable<ImageScaling>.self, forKey: .imageScaling) {
            self = .imageScaling(value)
        } else if let value = try? container.decode(Variable<ImagePosition>.self, forKey: .imagePosition) {
            self = .imagePosition(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .imageHugsTitle) {
            self = .imageHugsTitle(value)
        } else if let value = try? container.decode(Variable<Color>.self, forKey: .bezelColor) {
            self = .bezelColor(value)
        } else if let value = try? container.decode(Variable<AppKitBezelStyle>.self, forKey: .bezelStyle) {
            self = .bezelStyle(value)
        } else {
            throw NSButtonStyleCodingError.decoding("\(dump(container))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .title(let value): try container.encode(value, forKey: .title)
        case .shadow(let value): try container.encode(value, forKey: .shadow)
        case .attributedTitle(let value): try container.encode(value, forKey: .attributedTitle)
        case .alternateTitle(let value): try container.encode(value, forKey: .alternateTitle)
        case .attributedAlternateTitle(let value): try container.encode(value, forKey: .attributedAlternateTitle)
        case .buttonType(let value): try container.encode(value, forKey: .buttonType)
        case .image(let value): try container.encode(value, forKey: .image)
        case .imageScaling(let value): try container.encode(value, forKey: .imageScaling)
        case .imagePosition(let value): try container.encode(value, forKey: .imagePosition)
        case .imageHugsTitle(let value): try container.encode(value, forKey: .imageHugsTitle)
        case .bezelColor(let value): try container.encode(value, forKey: .bezelColor)
        case .bezelStyle(let value): try container.encode(value, forKey: .bezelStyle)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: NSButtonStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
