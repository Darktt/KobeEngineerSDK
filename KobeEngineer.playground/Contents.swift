//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

let message: String = ""

func completionKoboHandler(URL: NSURL?, error: NSError?)
{
    if let error = error {
        print("Got error: \(error.localizedDescription)")
    }
    
    if let URL = URL {
        print("Post success\nURL: \(URL)")
    }
}

let kobe = KobeEngineer(message: message, imageStyle: true)
kobe.sendKobeMessage(completionKoboHandler)
