
import variable
import substitutes
import style
import tag

public enum NSViewStyle: Style {

	case wantsLayer(Variable<Bool>)
	case translatesAutoresizingMaskIntoConstraints(Variable<Bool>)
	case alphaValue(Variable<Number>)
	case isHidden(Variable<Bool>)
}

extension NSViewStyle: Codable {

	private enum CodingKeys: StringLiteralType, CodingKey {

		case wantsLayer
		case translatesAutoresizingMaskIntoConstraints
		case alphaValue
		case isHidden
	}

	public enum NSViewStyleCodingError: Error {
		case decoding(String)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		if let value = try? container.decode(Variable<Bool>.self, forKey: .wantsLayer) {
			self = .wantsLayer(value)
		} else if let value = try? container.decode(Variable<Bool>.self, forKey: .translatesAutoresizingMaskIntoConstraints) {
			self = .translatesAutoresizingMaskIntoConstraints(value)
		} else if let value = try? container.decode(Variable<Number>.self, forKey: .alphaValue) {
			self = .alphaValue(value)
		} else if let value = try? container.decode(Variable<Bool>.self, forKey: .isHidden) {
			self = .isHidden(value)
		} else {
			throw NSViewStyleCodingError.decoding("\(dump(container))")
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		case .wantsLayer(let value): try container.encode(value, forKey: .wantsLayer)
		case .translatesAutoresizingMaskIntoConstraints(let value): try container.encode(value, forKey: .translatesAutoresizingMaskIntoConstraints)
		case .alphaValue(let value): try container.encode(value, forKey: .alphaValue)
		case .isHidden(let value): try container.encode(value, forKey: .isHidden)

		}
	}
}

extension Stylable {

	@discardableResult
	public func style(_ style: NSViewStyle, tags: [Tag] = []) -> Self {
		return self.style(style: style, tags: tags)
	}
}
