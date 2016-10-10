//
//  ConsoleIO.swift
//  PTAM
//
//  Created by Jake Bush on 9/28/16.
//  Copyright © 2016 PorkChopExpress. All rights reserved.
//

import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case unknown
    case quit = "q"
    
    init(value: String) {
        switch value {
            case "a": self = .anagram
            case "p": self = .palindrome
            case "h": self = .help
            case "q": self = .quit
        default: self = .unknown
        }
    }
}

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    class func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
        
    }
    
    func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        
        let inputData = keyboard.availableData
        
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
