import UIKit


FileManager.documentDirectoryURL

let ReminderDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentDirectoryURL)

var stringURL = FileManager.documentDirectoryURL
    .appendingPathComponent("String")
    .appendingPathExtension("txt")


// Save and load data

let favoriteText: [UInt8] = [22, 44]
let favoriteByteData = Data(favoriteText)

let favoriteByteURL = URL(fileURLWithPath: "Favorite Text", relativeTo: FileManager.documentDirectoryURL)

try favoriteByteData.write(to: favoriteByteURL)







