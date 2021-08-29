import SwiftPznn1Core

func main() {
    var puzzle = Puzzle(size: 4)
    puzzle.shuffle(by: 80)
    var steps = 0

    repeat {
        print(puzzle)
        let commandChar = readLine()
        switch commandChar {
        case "w":
            puzzle.move(to: .up)
            steps += 1
        case "d":
            puzzle.move(to: .right)
            steps += 1
        case "s":
            puzzle.move(to: .down)
            steps += 1
        case "a":
            puzzle.move(to: .left)
            steps += 1
        case "q":
            print("Aborted!")
            return
        default:
            break
        }
    } while !puzzle.completed()

    print("Conguraturation!(\(steps)steps)")
}

main()
