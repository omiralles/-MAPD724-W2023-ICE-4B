import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol {
    //Public instance members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidht: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //Constructor / Inicializer
    init (imageString: String, initialScale: CGFloat) {
        //Inicialitze the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        //Configuration
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().width * scale!
        halfWidht = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    required init? (coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented ")
    }
    
    //LifeCycle functions
    func Start() {
        
    }
    
    func Update() {
        
    }
    
    func CheckBounds() {
        
    }
    
    func Reset() {
        
    }
}
