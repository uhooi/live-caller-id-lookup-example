// Copyright 2024 Apple Inc. and the Swift Homomorphic Encryption project authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import HomomorphicEncryption
import Hummingbird
import PrivateInformationRetrieval

extension HomomorphicEncryption.HeError: @retroactive HTTPResponseError {
    public var status: HTTPResponse.Status {
        .badRequest
    }

    public func response(from _: Request, context: some RequestContext) throws -> Response {
        let body = context.allocator.buffer(string: localizedDescription)
        return Response(status: status, body: ResponseBody(byteBuffer: body))
    }
}

extension PrivateInformationRetrieval.PirError: @retroactive HTTPResponseError {
    public var status: HTTPResponse.Status {
        .badRequest
    }

    public func response(from _: Request, context: some RequestContext) throws -> Response {
        let body = context.allocator.buffer(string: localizedDescription)
        return Response(status: status, body: ResponseBody(byteBuffer: body))
    }
}