//
//  URLSessionStub.swift
//  TDDLearningDemo
//
//  Created by 沈海超 on 2021/6/19.
//

import Foundation

typealias DataTaskCompletionHandler = (Data?, URLResponse?, Error?) -> Void
protocol URLSessionProtocol {
  func myDataTask(
    with url: URL,
    completionHandler: @escaping DataTaskCompletionHandler
  ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    func myDataTask(
      with url: URL,
      completionHandler: @escaping DataTaskCompletionHandler
    ) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: completionHandler)
    }
}

class URLSessionStub: URLSessionProtocol {
  private let stubbedData: Data?
  private let stubbedResponse: URLResponse?
  private let stubbedError: Error?

  public init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
    self.stubbedData = data
    self.stubbedResponse = response
    self.stubbedError = error
  }

  func myDataTask(
    with url: URL,
    completionHandler: @escaping DataTaskCompletionHandler
  ) -> URLSessionDataTask {
    URLSessionDataTaskStub(
      stubbedData: stubbedData,
      stubbedResponse: stubbedResponse,
      stubbedError: stubbedError,
      completionHandler: completionHandler
    )
  }
}

class URLSessionDataTaskStub: URLSessionDataTask {
  private let stubbedData: Data?
  private let stubbedResponse: URLResponse?
  private let stubbedError: Error?
  private let completionHandler: DataTaskCompletionHandler?

  init(
    stubbedData: Data? = nil,
    stubbedResponse: URLResponse? = nil,
    stubbedError: Error? = nil,
    completionHandler: DataTaskCompletionHandler? = nil
  ) {
    self.stubbedData = stubbedData
    self.stubbedResponse = stubbedResponse
    self.stubbedError = stubbedError
    self.completionHandler = completionHandler
  }

  override func resume() {
    completionHandler?(stubbedData, stubbedResponse, stubbedError)
  }
}
