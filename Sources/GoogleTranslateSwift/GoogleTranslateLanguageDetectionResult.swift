//
//  GoogleTranslateLanguageDetectionResult.swift
//  GoogleTranslateSwift
//
//  Created by Daniel Saidi on 2021-11-15.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public struct GoogleTranslateLanguageDetectionResult: Codable {
    
    public let detections: [GoogleTranslateLanguageDetection]
}
