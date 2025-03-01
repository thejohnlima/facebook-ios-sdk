/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

import FBSDKLoginKit

@objcMembers
class TestLoginCompleterFactory: NSObject, LoginCompleterFactoryProtocol {

  let stubbedLoginCompleter: TestLoginCompleter
  var capturedURLParameters = [String: Any]()
  var capturedAppID: String?
  var capturedGraphRequestConnectionFactory: GraphRequestConnectionFactoryProtocol?
  var capturedAuthenticationTokenCreator: AuthenticationTokenCreating?
  var capturedGraphRequestFactory: GraphRequestFactoryProtocol?
  var capturedInternalUtility: URLHosting?

  init(stubbedLoginCompleter: TestLoginCompleter = TestLoginCompleter()) {
    self.stubbedLoginCompleter = stubbedLoginCompleter
  }

  func createLoginCompleter(
    urlParameters parameters: [String: Any],
    appID: String,
    graphRequestConnectionFactory: GraphRequestConnectionFactoryProtocol,
    authenticationTokenCreator: AuthenticationTokenCreating,
    graphRequestFactory: GraphRequestFactoryProtocol,
    internalUtility: URLHosting
  ) -> LoginCompleting {
    capturedURLParameters = parameters
    capturedAppID = appID
    capturedGraphRequestConnectionFactory = graphRequestConnectionFactory
    capturedAuthenticationTokenCreator = authenticationTokenCreator
    capturedGraphRequestFactory = graphRequestFactory
    capturedInternalUtility = internalUtility

    return stubbedLoginCompleter
  }
}
