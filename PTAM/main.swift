//
//  main.swift
//  PTAM
//
//  Created by Jake Bush on 9/28/16.
//  Copyright © 2016 PorkChopExpress. All rights reserved.
//

import Foundation

let panagram = Panagram()

if CommandLine.argc < 2 {
    panagram.interactiveMode()

} else {
    panagram.staticMode()
}

