import SwiftUI

public struct GrassView: View {
    //on user's data
    private let data: [String: Int]
    //on view appearance
    private let blockColor: Color
    private let row: Int
    private let col: Int
    //on date format (data's key and this formatString have to be same if it's not it can't read data)
    private let formatString: String
    private let formatter = DateFormatter()
    
    //on localConstant
    private let today = Date()
    private let calendar = Calendar.current
    
    @ObservedObject private var viewModel: GrassViewModel
    
    
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
        
        self._viewModel = ObservedObject(initialValue: GrassViewModel(formatter: self.formatter))
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            Text(viewModel.selectedDate)
            ForEach(0..<row, id: \.self){ row in
                HStack{
                    ForEach(0..<col, id: \.self){ col in
                        GrassViewCell(
                            date: getDate(rowcol: [row, col], today: today),
                            color: blockColor,
                            workLevel: getLevel(rowcol: [row, col]),
                            viewModel: viewModel
                        )
                    }
                }
            }
        }
        .coordinateSpace(name: "container")
        .padding()
        .gesture(
            DragGesture(coordinateSpace: .named("container"))
            .onChanged{ touched in
                viewModel.startDrag()
                viewModel.moveLocation(touched.location)
            }
            .onEnded{ _ in
                viewModel.endDrag()
            }
        )
        .onTapGesture(count:2) {
            viewModel.tapTwice()
        }
        
        
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

