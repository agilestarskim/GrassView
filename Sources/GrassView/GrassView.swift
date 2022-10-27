import SwiftUI

public struct GrassView: View {
    
    private let data: [String: Int]
    //appearance
    private let blockColor: Color
    private let row: Int
    private let col: Int
    
    private let formatString: String
    private let today = Date()
    private let calendar = Calendar.current
    private let formatter = DateFormatter()
    
    @State private var text: String = ""
    
    
    public init(
        data:[String: Int] = [:],
        blockColor: Color = .green,
        row: Int = 5, col: Int = 10,
        formatString: String = "yyyy-MM-dd", locale:Locale? = nil, timeZone:TimeZone? = nil
    ) {
        self.data = data
        self.blockColor = blockColor
        self.row = row
        self.col = col
        self.formatString = formatString
        self.formatter.dateFormat = formatString
        self.formatter.timeZone = timeZone
        self.formatter.locale = locale
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            Text("time:" + text )
            
            ForEach(0..<row, id: \.self){ row in
                HStack{
                    ForEach(0..<col, id: \.self){ col in
                        GrassViewCell(
                            date: getDate(rowcol: [row, col], today: today),
                            color: blockColor,
                            inputLevel: getLevel(rowcol: [row, col])
                        ){ date in
                            text = date
                            
                        }
                        
                    }
                }
            }
            
        }
        .padding()
        
    }
    
    func getDate(rowcol:[Int], today: Date) -> String {
        let diff = -1 * (rowcol[0] * col + rowcol[1])
        let date = calendar.date(byAdding: .day, value: diff, to: today) ?? today
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    func getLevel(rowcol: [Int]) -> Int {
        return self.data[getDate(rowcol: rowcol, today: today)] ?? 0
    }
    

}

struct GrassView_Previews: PreviewProvider {
    static var previews: some View {
        GrassView(data: [:])
          
  }
}

