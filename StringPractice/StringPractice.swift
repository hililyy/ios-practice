import Foundation

// 문제 --------------------------------------------

public class Model {
    public var date = "" // yyyyMMdd
    public var title = "" // 제목
}

var dataList: [Model] = []

for i in 0...30 {
    let data = Model()
    data.date = "20230\(Int.random(in: 1...9))0\(Int.random(in: 1...9))"
    data.title = "제목\(i)"
    
    dataList.append(data)
}

var newList: [[Model]] = []


// 풀이 --------------------------------------------

var dicList: [String: [Model]] = [:]

for data in dataList {
    let arr = Array(data.date)
    let sliceMonth = String(arr.suffix(4).prefix(2))
    
    if dicList["\(sliceMonth)"] == nil {
        dicList["\(sliceMonth)"] = []
    }
    
    dicList["\(sliceMonth)"]?.append(data)
}

newList = dicList.map {
    $0.value.sorted(by: { $0.date > $1.date })}
    .sorted { $0[0].date < $1[0].date
}

print(newList)
