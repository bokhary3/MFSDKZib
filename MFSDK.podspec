//
//  MFSDK.swift
//  MFSDKCocoapod
//
//  Created by Elsayed Hussein on 5/15/19.
//  Copyright © 2019 Elsayed Hussein. All rights reserved.
//

Pod::Spec.new do |s|
s.name              = 'MFSDK'
s.version           = '1.0'
s.summary           = 'The MFSDK makes it easy to add MyFatoorah payments to mobile apps.'
s.homepage          = 'https://dev.azure.com/myfatoorahsc/_git/MF-SDK-iOS-Demo'

s.author            = { 'Name' => 'ehussein@myfatoorah.com' }
s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

s.platform          = :ios
s.source            = { :http => 'http://example.com/sdk/1.0.0/MySDK.zip' }

s.ios.deployment_target = '8.0'
s.ios.vendored_frameworks = 'MySDK.framework'
end
