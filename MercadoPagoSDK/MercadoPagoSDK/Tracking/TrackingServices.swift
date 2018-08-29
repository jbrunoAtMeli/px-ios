//
//  TrackingServices.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 7/5/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

internal class TrackingServices: NSObject {

    static internal let STATUS_OK = 200

    static internal func request(url: String, params: String?, body: String? = nil, method: String, headers: [String: String]? = nil, success: @escaping (Any) -> Void,
                                 failure: ((NSError) -> Void)?) {
        var requesturl = url
        if !String.isNullOrEmpty(params) {
            requesturl += "?" + params!
        }
        let finalURL: NSURL = NSURL(string: requesturl)!

        #if DEBUG
        print("\n--REQUEST_URL: \(finalURL)")
        #endif

        let request: NSMutableURLRequest
        request = NSMutableURLRequest(url: finalURL as URL)
        request.url = finalURL as URL
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if headers !=  nil && headers!.count > 0 {
            for header in headers! {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        if let body = body {
            #if DEBUG
            print("--REQUEST_BODY: \(body as! NSString)")
            #endif
            request.httpBody = body.data(using: String.Encoding.utf8)
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if error == nil {
                do {
                    if let response = response as? HTTPURLResponse {
                        if response.statusCode == TrackingServices.STATUS_OK {
                            if let data = data {
                                let responseJson = try JSONSerialization.jsonObject(with: data,
                                                                                    options: JSONSerialization.ReadingOptions.allowFragments)
                                success(responseJson as Any)

                            } else {
                                success("")
                            }

                        } else {
                            let error: NSError = NSError(domain: "com.mercadopago.sdk", code: NSURLErrorCannotDecodeContentData, userInfo: nil)
                            failure?(error)
                        }
                    }
                } catch {
                    let error: NSError = NSError(domain: "com.mercadopago.sdk", code: NSURLErrorCannotDecodeContentData, userInfo: nil)
                    failure?(error)
                }
            } else {
                if failure != nil {
                    failure!(error! as NSError)
                }
            }})

        task.resume()
    }

}
