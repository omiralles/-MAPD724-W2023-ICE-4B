import GameplayKit
import SpriteKit

class Cloud: GameObject {
    //Inicializer/Constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder: ) has not been initialized")
    }
    
    //LifeCycle Funtions
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 //50% Transparent
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    
    override func Reset() {
        //randomize the vertical speed 5 to 10 units
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        //randomize horazontal speed -2 to 2
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        //get a pseudo random number X position -262 to 262
        let randomX: Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        //get a pseudo random number Y position 902 to 902
        let randomY: Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    //Public method
    func Move() {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
    
}
