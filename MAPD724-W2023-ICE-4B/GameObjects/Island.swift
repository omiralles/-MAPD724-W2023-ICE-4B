import GameplayKit
import SpriteKit

class Island: GameObject {
    //Inicializer/Constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder: ) has not been initialized")
    }
    
    //LifeCycle Funtions
    override func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.y <= -876)
        {
            Reset()
        }
    }
    
    override func Reset() {
        position.y = 876
        //get a pseudo random number
        let randomX: Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    //Public method
    func Move() {
        position.y -= verticalSpeed!
    }
    
}
