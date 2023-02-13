import GameplayKit
import SpriteKit

class Player : GameObject {
    //Initializer
    init () {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder: ) has not been initialized")
    }
    
    //LifeCycle Functions
    override func Start() {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update() {
        CheckBounds()
    }
    
    override func CheckBounds() {
        //constrain the player on the left boundery
        if (position.x <= -320) {
            position.x = -320
        }
        //constrain the player on the right boundery
        if (position.x >= 320) {
            position.x = 320
        }
    }
    
    override func Reset() {
        position.y = -640
    }
    
    func TouchMove (newPos: CGPoint) {
        position = newPos
    }
}
