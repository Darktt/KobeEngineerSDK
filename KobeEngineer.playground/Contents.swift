//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

let currentPage = XCPlaygroundPage.currentPage
currentPage.needsIndefiniteExecution = true

let message: String = "靠北 SDK Swift version\nOpen surece: https://github.com/Darktt/KobeEngineerSDK/tree/Swift\n                                                            Send by Xcode!"

func completionKoboHandler(URL: NSURL?, error: NSError?)
{
    if let URL = URL {
        print("\(URL)")
    }
    
    currentPage.finishExecution()
}

let kobe = KobeEngineer(message: message, imageStyle: true)
kobe.sendKobeMessage(completionKoboHandler)
