enum Direction: String {
    case Left = "Left"
    case Right = "Right"
}

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Double)
    case Stop
    case Turn(direction: Direction)
}

var action: Action = Action.Run(meters: 20, speed: 15.0)
action = .Stop
action = .Walk(meters: 200)
action = .Run(meters: 10, speed: 20)
action = .Turn(direction: .Right)

switch action {
    case .Stop: print("Stop")
    case .Walk(let meters) where meters > 100:
        print("long walk \(meters) meters")
    case .Walk(let meters):
        print("short walk \(meters) meters")
    case .Run(let m, let s):
        print("run \(m) meters, speed \(s) km/h")
    case .Turn(direction: .Left):
        print("turn left")

    default: "turn right"
}

print(Direction.Left.rawValue)

enum Color {
    case White
    case Black
}



enum ChessPieces {
    case Queen(color: Color, row: Int, column: String)
    case King(color: Color, row: Int, column: String)
    case Knight(color: Color, row: Int, column: String)
    case Rook(color: Color, row: Int, column: String)
    case Pawn(color: Color, row: Int, column: String)
    case Bishop(color: Color, row: Int, column: String)
}

ChessPieces.King(color: .Black, row: 8, column: "g")
ChessPieces.Pawn(color: .Black, row: 7, column: "g")
ChessPieces.Pawn(color: .Black, row: 7, column: "h")
ChessPieces.Pawn(color: .Black, row: 7, column: "f")
ChessPieces.Rook(color: .White, row: 8, column: "d")






