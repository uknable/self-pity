extends Node

var wordDict = {}

func updateWordDict(lineNum, wordNum, side, newText):
    var newDict = []
    var buttonKeep = wordDict.get(lineNum)[wordNum][1]

    for wordBut in wordDict.get(lineNum):
        newDict.append(wordBut)
    
    newDict[0] = ["hello", buttonKeep]
    wordDict.get(lineNum)[wordNum] = ["what", buttonKeep]

    # newDict.remove(wordNum)

    # if (side < 0):
    #     newDict.remove(wordNum - 1)
    # else:
    #     newDict.remove(wordNum + 1)
    
    # wordDict.erase(lineNum)
    # wordDict