import Foundation

// 문제 --------------------------------------------

public class Model {
    public var date = "" // yyyyMMdd
    public var title = "" // 제목
}

var dataList: [Model] = []

for i in 0...30 {
    
    var month = "\(Int.random(in: 1...12))"
    month = month.count == 1 ? "0\(month)" : month
    
    var day = "\(Int.random(in: 1...28))"
    day = day.count == 1 ? "0\(day)" : day
    
    let data = Model()
    data.date = "2023\(month)\(day)"
    data.title = "제목\(i)"
    
    dataList.append(data)
}

var newList: [[Model]] = []



// 풀이 --------------------------------------------

var dicList: [String: [Model]] = [:]

for data in dataList {
    let sliceMonth = "\(data.date.suffix(4).prefix(2))"
    
    if dicList["\(sliceMonth)"] == nil {
        dicList["\(sliceMonth)"] = []
    }
    
    dicList["\(sliceMonth)"]?.append(data)
}

newList = dicList.map {
    $0.value.sorted(by: { $0.date > $1.date })}
    .sorted { $0.first?.date ?? "" > $1.first?.date ?? "" }



// 출력 --------------------------------------------
for new in newList {
    print("---\(new[0].date.suffix(4).prefix(2))월---")
    
    for n in new {
        print("""
        \(n.title)
        \(n.date)
        """)
    }
}
