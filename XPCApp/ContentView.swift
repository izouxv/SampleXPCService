/*

  Created by Jeff Spooner

*/

import SwiftUI


struct ContentView: View {

  // The connection manager object is passed to the Content View as an Environment Object
  @EnvironmentObject var connectionManager: ConnectionManager


  var body: some View {
    Text(String(connectionManager.count)).padding()
      Button("Start Timer", action: startTimer).padding()
      Button("Add 100", action: add100).padding()
    Button("Cancel Timer", action: cancelTimer).padding()
    Button("Invalidate Connection", action: invalidateConnection).padding()
  }


  func startTimer() -> Void
    {
      // Message the XPC Service to begin the timer
      connectionManager.xpcService().startTimer()
    }

    func add100() -> Void
    {
        connectionManager.xpcService().rpc(100) { ret in
            NSLog("xpc server ret: %d", ret)
        }
    }


  func cancelTimer() -> Void
    {
      // Message the XPC service to cancel the timer
      connectionManager.xpcService().cancelTimer()
    }


  func invalidateConnection() -> Void
    {
      // Invalidate the connection manager's connection to demonstrate connection invalidation error handling
      connectionManager.invalidateConnection()
    }

}
