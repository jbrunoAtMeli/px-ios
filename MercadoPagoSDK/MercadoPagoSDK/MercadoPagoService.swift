//
//  MercadoPagoService.swift
//  MercadoPagoSDK
//
//  Created by Matias Gualino on 5/2/15.
//  Copyright (c) 2015 com.mercadopago. All rights reserved.
//

import Foundation
import UIKit

public class MercadoPagoService : NSObject {

    static let MP_BASE_URL = "https://api.mercadopago.com"
    
    var baseURL : String!
    init (baseURL : String) {
        super.init()
        self.baseURL = baseURL
    }
    
    public func request(uri: String, params: String?, body: AnyObject?, method: String, headers : NSDictionary? = nil, success: (jsonResult: AnyObject?) -> Void,
        failure: ((error: NSError) -> Void)?) {
        
        var url = baseURL + uri
        if params != nil {
            url += "?" + params!
        }
        
        let finalURL: NSURL = NSURL(string: url)!
        let request: NSMutableURLRequest = NSMutableURLRequest()
        request.URL = finalURL
        request.HTTPMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if headers !=  nil && headers!.count > 0 {
            for header in headers! {
                request.setValue(header.value as! String, forHTTPHeaderField: header.key as! String)
            }
        }
        
        if body != nil {
            request.HTTPBody = (body as! NSString).dataUsingEncoding(NSUTF8StringEncoding)
        }

		UIApplication.sharedApplication().networkActivityIndicatorVisible = true
		
		NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse?, data: NSData?, error: NSError?) in
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
				if error == nil {
					do
					{
						success(jsonResult: try NSJSONSerialization.JSONObjectWithData(data!,
							options:NSJSONReadingOptions.AllowFragments))
					} catch {
						let e : NSError = NSError(domain: "com.mercadopago.sdk", code: 1, userInfo: nil)
						failure!(error: e)
					}
                } else {
                    if failure != nil {
                        failure!(error: error!)
                    }
                }
        }
    }
}