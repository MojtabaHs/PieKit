# PieKit

A simple Pie view that can show all slices of a Pie  😊. Also,

# It can be animated!

<p align="center">
<img src="./Resources/TimedPieDemo.gif" alt="CI" />
</p>

## Install
You can use the Swift package manager to install `PieKit`.
```
.package(url: "https://github.com/MojtabaHs/PieKit", .upToNextMajor(from: "0.2.0"))
```


## Usage
<b>`PieKit`is FREE and open-source for individuals, and will remain that way forever.</b>

Just set the duration and it will animate the progress down to 0.

```
timedPieView.duration = 3
```

### Delegate

You can use the delegate method to access the  progress changes when it is animating.

```
extension ViewController: TimedPieViewDelegate {

    func timedPie(_ pie: PieView, didChangeRemainingTime remainingTime: TimeInterval) {
        print(remainingTime)
    }
}
```

### Note:
This method can cause a huge impact on performance. The called is responsible for preventing it from executing heavy instructions.
