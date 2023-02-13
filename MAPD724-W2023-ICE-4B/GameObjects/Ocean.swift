import SpriteKit
import GameplayKit

class Ocean : GameObject {
    // constructor or initializer
    init () {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder: ) has not been initialized")
    }
    
    override func Start() {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if (position.y <= -2253) {
            Reset()
        }
    }
    
    override func Reset() {
        position.y = 2253
    }
    
    func Move () {
        position.y -= verticalSpeed!
    }
}
