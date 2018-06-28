//
//  File.swift
//  MemoReminder
//
//  Created by home on 2018/06/28.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import Foundation
import UIKit

if NSClassFromString("XCTestCase") != nil {
    UIApplicationMain(
        Process.argc,
        Process.unsafeArgv,
        NSStringFromClass(UIApplication),
        NSStringFromClass(TestingAppDelegate)
    )
} else {
    UIApplicationMain(
        Process.argc,
        Process.unsafeArgv,
        NSStringFromClass(UIApplication),
        NSStringFromClass(AppDelegate)
    )
}
