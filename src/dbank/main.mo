import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startedTime = Time.now();
  startedTime := Time.now();
  Debug.print(debug_show(startedTime));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less then zero.")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  

  public func compound() {
    let currentTimeS = (Time.now() - startedTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(currentTimeS));
    startedTime := currentTimeS; 
  };

  //topUp();
}
