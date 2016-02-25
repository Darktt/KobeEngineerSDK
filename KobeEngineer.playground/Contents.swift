//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

let message: String = ""

func completionKoboHandler(URL: NSURL?, error: NSError?)
{
    
}

let kobe = KobeEngineer(message: message, imageStyle: true)
kobe.sendKobeMessage(completionKoboHandler)