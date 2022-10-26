import SwiftUI

public struct GrassView: View {
    
    @State private var data: [String: Int]
    private let formatString: String
    
    private let now = Date()
    private var calendar = Calendar.current
    private var formatter = DateFormatter()
    @State private var text: String = ""
    
    
    public init(data:[String: Int] = [:], formatString: String = "yyyy-MM-dd", locale:Locale? = nil, timeZone:TimeZone? = nil) {
        self._data = State<[String: Int]>(initialValue: data)
        self.formatString = formatString
        self.formatter.dateFormat = formatString
        self.formatter.timeZone = timeZone
        self.formatter.locale = locale
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            Text("time:" + text )
            
            ForEach(0..<5){ row in
                HStack{
                    ForEach(0..<10){ col in
                        GrassViewCell(
                            date: getDate(
                                value: -1 * (row * 10 + col),
                                to: now
                            ),
                            inputLevel: data[getDate(value:  -1 * (row * 10 + col), to: now)] ?? 0
                        ){ date in
                            text = date
                            
                        }
                        
                    }
                }
            }
            
        }
        .padding()
        
    }
    
    func getDate(value:Int, to: Date)->String {
        let date = calendar.date(byAdding: .day, value: value, to: to) ?? Date()
        let dateString = formatter.string(from: date )
        return dateString
    }
}

struct GrassView_Previews: PreviewProvider {
    static var previews: some View {
        GrassView(data: [:])
          
  }
}

