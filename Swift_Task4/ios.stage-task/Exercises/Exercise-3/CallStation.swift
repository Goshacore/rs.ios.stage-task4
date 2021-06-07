import Foundation

 

final class CallStation {
    var userArray = [User]()
    var callsArray = [Call]()
    
    var start = 0
    var answer = 0
    var end = 0
    
    
    
   
    
    let userBusy1 = CallEndReason.userBusy
    let cancel1 =  CallEndReason.cancel
    let end1 = CallEndReason.end
    let error1 = CallEndReason.error
    
    
    
    
}

extension CallStation: Station {
    func users() -> [User] {
        return userArray
    }
    
    func add(user: User) {
        if (userArray.count == 0 ) {
            userArray.append(user)
        } else {
            for i in userArray {
                if (i.id   == user.id ) {
                    break
                } else {   userArray.append(user)
                }
            }
        }
    }
    
    
    
    func remove(user: User) {
        var b = 0
        for i in callsArray {
            
            b += 1
            if (i.outgoingUser.id == user.id) {
                
                
               
               
                let call = Call(id: i.id, incomingUser: i.incomingUser, outgoingUser: i.outgoingUser, status: .ended(reason: .error))
                callsArray.insert(call, at: 0)
                callsArray.remove(at: b)
                
                
            }
        }
        
        
        

    }
    
    
    
    
    
    func execute(action: CallAction) -> CallID? {
        
        switch action {
        //------------------START
       
        case .start(let user1, let user2):
            start += 1
            let id = CallID()
            var b = 0
            
            
            
            if (userArray.count == 1) {
                
                let call = Call(id: id, incomingUser: user1, outgoingUser: user2, status: .ended(reason: .error))
                callsArray.insert(call, at: 0)
                
                
            } else   if (callsArray.count > 0) {
            for i in callsArray {
                
               b += 1
                
                if (i.incomingUser.id == user1.id || i.outgoingUser.id == user2.id || i.incomingUser.id == user2.id || i.outgoingUser.id == user1.id) {
                    
                    
                    
                    let call = Call(id: id, incomingUser: user1, outgoingUser: user2, status: .ended(reason: .userBusy))
                    callsArray.insert(call, at: 0)
                  
                }
                
            } } else  {
                
                
                var call = Call(id: id, incomingUser: user1, outgoingUser: user2, status: .calling)
         callsArray.insert(call, at: 0)
            
            }
            
         // ------------------anser
        case .answer(let user):
            answer += 1
            var b = 0
            for i in callsArray {
                
                b += 1
                if (i.outgoingUser.id == user.id && i.status != .ended(reason: .error)){
                   let id1 =  i.id
                   let incomingUser = i.incomingUser
                   let call = Call(id: id1, incomingUser: incomingUser, outgoingUser: user, status: .talk)
                   callsArray.insert(call, at: 0)
                    callsArray.remove(at: b)
                    
                    
                } else {  userArray.removeAll()   }
            }
            
        //-------------------end
        case .end(let user):
            end += 1
        var b = 0
            for i in callsArray {
                b += 1
                
                if  (i.incomingUser.id == user.id && i.status != .ended(reason: .userBusy) || i.outgoingUser.id == user.id && i.status != .ended(reason: .userBusy)) {
                    let id1 =  i.id
                    let incomingUser = i.incomingUser
                    let outgoingUser = i.outgoingUser
                    var reason: CallEndReason = .end
                    if ( start > 0 && answer > 0 && end > 0) {
                        
                        reason = CallEndReason.end
                        
                    } else if (start > 0 && answer == 0 && end > 0)
                    {
                        
                        reason = .cancel
                    }
                    //let reason: CallEndReason
                    
                    let call = Call(id: id1, incomingUser: incomingUser, outgoingUser: outgoingUser, status: .ended(reason: reason))
                    callsArray.insert(call, at: 0)
                    callsArray.remove(at: b)
                    
                    
                }
                
            }
            
            
            
        print("lll")
        
        }
        
        
        if (userArray.count == 0) {
            
            return nil
        }
        
        
        return callsArray.first?.id
    }
    
    func calls() -> [Call] {
        return callsArray
    }
    
    func calls(user: User) -> [Call] {
        
        var call22 = [Call]()
        
        for i in callsArray {
            
            
            
            if ( i.incomingUser.id == user.id || i.outgoingUser.id == user.id ) {
                
                call22.append(i)
                
            }
            
            
        }
        
        
        
     return call22
    }
    
    func call(id: CallID) -> Call? {
        
        var a: Call?
        var b = 0
        for i in callsArray {
            b += 1
            
            if (id == i.id) {
                
              //  let id2 = i.id
              //  let incomungUser = i.incomingUser
              //  let outgoingUser = i.outgoingUser
               
                
                
            //    let call = Call(id: id2, incomingUser: incomungUser, outgoingUser: outgoingUser, status: .ended(reason: .userBusy))
              //  callsArray.insert(call, at: 0)
              //  callsArray.remove(at: b)
                
                
               a = i
            }
        }
        return a
    }
    
    func currentCall(user: User) -> Call? {
        
        var call1: Call? = nil
        
        
        for i in callsArray {
            
            if (i.incomingUser.id == user.id   || i.outgoingUser.id == user.id ) {
                
                call1 = i
                
                if (i.status == .ended(reason: .end) || i.status == .ended(reason: .cancel)) {
                    
                    call1 = nil
                }
                
                if (i.status == .ended(reason: .userBusy) || i.status == .ended(reason: .userBusy)) {
                    
                    call1 = nil
                }
                
                if (i.status == .ended(reason: .error) || i.status == .ended(reason: .error)) {
                    
                    call1 = nil
                }
            }
        /*
            
            if (i.incomingUser.id == user.id && i.status != .ended(reason: .end) || i.outgoingUser.id == user.id && i.status != .ended(reason: .end)) {
                
                call1 = i
                 
            } */
        }
        
        
        return call1
     }
}
