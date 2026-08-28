//
//  Endpoint.swift
//  AnimeWeeb
//
//  Created by Maksim Sazanovich
//

import Foundation

public protocol Endpoint {
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: RequestBody { get }
}

extension Endpoint {

    public var baseURL: URL {
        return URL(string: "https://weebstudios-002-site1.ktempurl.com/api")!
    }

   func makeURLRequest() throws -> URLRequest {

        let url = baseURL.appending(path: path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems

        guard let fullURL = components?.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

       switch body {
       case .json(let encodable):
           request.httpBody = try JSONEncoder().encode(encodable)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
       case .multipart(let items):
           let boundary = "Boundary-\(UUID().uuidString)"
           request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
           request.httpBody = makeMultipartBody(items: items, boundary: boundary)
           
       case .plain:
           break
       }

        return request
    }
    
    private func makeMultipartBody(items: [MultipartItem], boundary: String) -> Data {
            var bodyData = Data()

            for item in items {
                bodyData.append("--\(boundary)\r\n")
                if let fileName = item.fileName, let mimeType = item.mimeType {
                    bodyData.append("Content-Disposition: form-data; name=\"\(item.name)\"; filename=\"\(fileName)\"\r\n")
                    bodyData.append("Content-Type: \(mimeType)\r\n\r\n")
                } else {
                    bodyData.append("Content-Disposition: form-data; name=\"\(item.name)\"\r\n\r\n")
                }
                bodyData.append(item.data)
                bodyData.append("\r\n")
            }

            bodyData.append("--\(boundary)--\r\n")
            return bodyData
        }
}

private extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
