import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        
     
        
       

        
   
        if (image.count == 0 || row >= image.count  || column >= image[0].count  || row < 0 || column < 0 || newColor >= 65536 || newColor < 0 || image[0].count > 50 || image.count > 50 ) {
            
            return image
        }
        
        
        
        var l:Int = image[0].count
        for uu  in image {
            if (l != uu.count) {
                return image
                
            }
            l = uu.count
     print(uu)
            print(uu.count)
            for nn in uu {
                
                if ( nn >= 65536  || nn < 0 ) {
                    return image
                    
                }
            }
         }
        
        
        
        
        
        
                
                var m = image.count
                
     //   let row: Int = 1
    //    let column: Int = 2

        // let row: Int = array[0][0]
        // let row: Int = array[0][1]
        
        var image1 = image

        var array = [Array<Int>]()
        var arrayResult = [Array<Int>]()
        array.append([row,column])
      //  arrayResult.append([row,column])
        
        
        
        
        
    let aaa  = image[row][column]
        
    var iteration = 0
//====== WHILE
        while array.count > 0 {
            iteration += 1
            print(array)
            
            let row: Int = array[0][0]
             let column: Int = array[0][1]
            
            
  // =======FUNC
            
            func check(row: Int, column: Int ) -> Bool {
            
                var bool: Bool = true
                
            for it in arrayResult {
                if (row == it[0] && column == it[1]) {
                    bool = false
                    break
                } else { bool = true }
            }
                
            return bool
                
            }
            
        //-------------------------------------
        if (column  < image[row].count - 1 && check(row: row, column: column + 1)) {
            
            if (image[row][column + 1] == image[row][column]) {
                
                array.append([row, column + 1])
                arrayResult.append([row, column + 1])
                
                
                print(array)
            }
            
        }


        //---------------------------image[row][column + 1]
        if (column - 1 >= 0 && check(row: row, column: column - 1)) {
            
            if (image[row][column - 1] == image[row][column]) {
                
                array.append([row, column - 1])
                arrayResult.append([row, column - 1])
                
                print(array)
                
            }
        }



        //------------------------------//image[row + 1][column]

        if (row + 1 < image.count && check(row: row + 1, column: column)) {
            
            if ( image[row + 1][column] == image[row][column]) {
                
                array.append([row + 1, column])
                arrayResult.append([row + 1, column])
                
                print(array)
            }
        }
        //--------------------------------------------------------
        if (row - 1 >= 0 && check(row: row - 1, column: column)) {
            
            if  (image[row - 1][column] == image[row][column]) {
                
                
                array.append([row - 1, column])
                arrayResult.append([row - 1, column])
                
                
                print(array)
            }
        }
            
            if (iteration == 1) {
                
              //  arrayResult.append([row, column])
                
                arrayResult.insert([row, column], at: 0)
             }
           

            
            array.removeFirst()
            
            

        }
        // image[row][column + 1]
        //image[row][column - 1]
        //image[row + 1][column]
        // (image[row - 1][column]

        print(arrayResult)
        
        
        for i in arrayResult {
           
            
            
            image1[i[0]][i[1]] = newColor
        }
        
  
        print(image1)
        
       
        
        
    //    image1[0][0] = newColor
     
        
        
       return image1
    }
}
