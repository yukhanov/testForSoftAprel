func findSubstringInRange(string: String, position: Int) -> Range<String.Index>? {
    let startIndex = string.index(string.startIndex, offsetBy: position)
    let endIndex = string.index(string.startIndex, offsetBy: position + 1)
    
 
    var startRange: Range<String.Index>? = nil
    var index = startIndex
    while index > string.startIndex {
        let previousIndex = string.index(before: index)
        if string[previousIndex] == "\n" {
            startRange = string.index(after: previousIndex)..<index
            break
        }
        index = previousIndex
    }

    if startRange == nil {
        startRange = string.startIndex..<startIndex
    }
    

    var endRange: Range<String.Index>? = nil
    index = endIndex
    while index < string.endIndex {
        let nextIndex = string.index(after: index)
        if string[index] == "\n" {
            endRange = index..<nextIndex
            break
        }
        index = nextIndex
    }
    
    if endRange == nil {
        endRange = endIndex..<string.endIndex
    }

    if startRange!.upperBound > endRange!.lowerBound {
        return nil
    }
    
    return startRange!.lowerBound..<endRange!.upperBound
}

let string = "Привет\nЭто я\nПочтальон печкин"
let position = 13

if let range = findSubstringInRange(string: string, position: position) {
    let substring = string[range]
    print(substring)
} else {
    print("Подстрока не найдена")
}




