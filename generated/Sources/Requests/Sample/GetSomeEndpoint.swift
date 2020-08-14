//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Sample {

    /**
    test summary

    test description
    */
    public enum GetSomeEndpoint {

        public static let service = APIService<Response>(id: "get_some_endpoint", tag: "sample", method: "GET", path: "/sample/{userId}", hasBody: false, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** sample parameter */
                public var userId: String

                public init(userId: String) {
                    self.userId = userId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetSomeEndpoint.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(userId: String) {
                let options = Options(userId: userId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "userId" + "}", with: "\(self.options.userId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** セットアップに使用する一時的なキーです。 */
            public class Status200: APIModel {

                public var sample: String?

                public init(sample: String? = nil) {
                    self.sample = sample
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    sample = try container.decodeIfPresent("sample")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(sample, forKey: "sample")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.sample == object.sample else { return false }
                  return true
                }

                public static func == (lhs: Status200, rhs: Status200) -> Bool {
                    return lhs.isEqual(to: rhs)
                }
            }
            public typealias SuccessType = Status200

            /** Success */
            case status200(Status200)

            public var success: Status200? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Status200.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
