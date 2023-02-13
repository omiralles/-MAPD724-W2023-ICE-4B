protocol GameProtocol {
    //inicialization
    func Start ()
    
    //Update every frame
    func Update ()
    
    //Check position is outside the bounds of screen
    func CheckBounds ()
    
    //A method to reset position
    func Reset ()
}
