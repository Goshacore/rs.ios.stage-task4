import Foundation

public extension Int {
    
    var roman: String? {
        
        
        
        let  a: Int = self
        
        if (!(1  <= a  && a <= 3999)) {
            
            return nil
            
        }
        
        
        let m = ["", "M", "MM", "MMM"]
        let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let x = ["", "X", "XX", "XXX", "XL", "L","LX", "LXX", "LXXX", "XC"]
        let i  = ["", "I", "II", "III", "IV", "V",  "VI", "VII", "VIII", "IX"]
        
        
       
        var resultArray: [String] = []
        
        let b1 =  a % 1000
        resultArray.append(m [a / 1000])
        let b2 = b1 % 100
        resultArray.append(c [b1 / 100])
        let b3 = b2 % 10
        resultArray.append(x [b2 / 10])
        resultArray.append(i [b3])
        
        let string = resultArray.joined(separator: "")
        
        
        
        return string
    }
}
