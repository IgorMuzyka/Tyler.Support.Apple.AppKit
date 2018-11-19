


import variable
import substitutes
import style
import tag

public enum NSControlStyle: Style {

    case isEnabled(Variable<Bool>)
    case isHighlighted(Variable<Bool>)
    case tag(Variable<Int>)
}

extension NSControlStyle: Codable {

    private enum CodingKeys: StringLiteralType, CodingKey {

        case isEnabled
        case isHighlighted
        case tag
    }

    public enum NSControlStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try? container.decode(Variable<Bool>.self, forKey: .isEnabled) {
            self = .isEnabled(value)
        } else if let value = try? container.decode(Variable<Bool>.self, forKey: .isHighlighted) {
            self = .isHighlighted(value)
        } else if let value = try? container.decode(Variable<Int>.self, forKey: .tag) {
            self = .tag(value)
        } else {
            throw NSControlStyleCodingError.decoding("\(dump(container))")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .isEnabled(let value): try container.encode(value, forKey: .isEnabled)
        case .isHighlighted(let value): try container.encode(value, forKey: .isHighlighted)
        case .tag(let value): try container.encode(value, forKey: .tag)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: NSControlStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
