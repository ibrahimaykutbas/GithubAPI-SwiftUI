import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case httpError(statusCode: Int)
    case unexpectedError
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .httpError(let statusCode):
            return "HTTP Error: \(statusCode)"
        case .unexpectedError:
            return "Unexpected Error"
        }
    }
}
