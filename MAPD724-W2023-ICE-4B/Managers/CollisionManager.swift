import GameplayKit
import SpriteKit

class CollisionManager {
    //get a reference to the GameViewController
    public static var gameViewController : GameViewController?
    
    //Utillity Functions
    public static func SquareDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquareRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) {
        let p1 = object1.position
        let p2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        // the collision check - overlaping circles
        if (SquareDistance(point1: p1, point2: p2) < Radii * Radii) {
            
            // we have a collision
            if (!object2.isColliding!) {
                //if object2 is not already colliding
                switch(object2.name) {
                case "island":
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    if(ScoreManager.Score % 2000 == 0) {
                        ScoreManager.Lives += 1
                        gameViewController?.updateLivesLabel()
                    }
                    break
                case "cloud":
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    if(ScoreManager.Lives < 1) {
                        gameViewController?.presentEndScene()
                    }
                    break
                default:
                    break
                }
                
                object2.isColliding = true
            }
        }
    }
}
