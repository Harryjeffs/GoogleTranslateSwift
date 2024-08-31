//
//  GoogleTranslateApiRoute.swift
//  GoogleTranslateSwift
//
//  Created by Daniel Saidi on 2021-11-15.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftKit

public enum GoogleTranslateApiRoute: ApiRoute {
    
	case detectLanguage(
		in: String,
		apiKey: String
	)
	case languages(
		apiKey: String
	)
	case translate(
		String,
		from: Locale,
		to: Locale,
		textType: TextType,
		apiKey: String
	)
    
    public var path: String {
        switch self {
        case .detectLanguage: return "detect"
        case .languages: return "languages"
        case .translate: return ""
        }
    }

    public var postData: Data? { nil }
    
    public var postParams: [String : String] { [:] }
    
    public var queryParams: [String : String] {
        switch self {
        case .detectLanguage(let text, let key):
            var params = ["key": key]
            params["q"] = text
            return params
        case .languages(let key):
            return ["key": key]
		case .translate(let text, let from, let to, let textType, let key):
            var params = ["key": key]
            params["q"] = text
			params["format"] = textType.rawValue
            params["source"] = from.languageCode ?? ""
            params["target"] = to.languageCode ?? ""
            return params
        }
    }
	
	// The format of the source text, in either HTML (default) or plain-text. A value of html indicates HTML and a value of text indicates plain-text.
	public enum TextType: String {
		/// Default for the `translate` endpoint `format` parameter
		case html
		/// `text` option which maintains line breaks in translation input & output
		case text
	}
}
