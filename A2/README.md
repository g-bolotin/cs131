## timeme - a simple timer tool

### What Does It Do?

This timer tool has 3 functionalities:

1. **Stopwatch** - start and stop the stopwatch to time something.
2. **Countdown** - start a countdown for a specified amount of time.
3. **Command Timer** - time how long a command takes, or get the average over multiple runs.

### Why Is It Useful?

- Lightweight and simple - no unnecessary features & low overhead.
- Great for time management! :)
- Useful for checking command/script performance with human-readable results.
(to a certain degree of error; it's not perfect (yet))

### How Can I Use It?

##### 1. Stopwatch
- Start the stopwatch: **timeme start**
- Stop the stopwatch: **timeme stop**
- You can only have one timer going (start will override a previous start time).

##### 2. Countdown
- Acceptable formats include:
	- timeme Xh Xm Xs
	- timeme Xm Xs
	- timeme Xs

- The order of h, m, and s doesn't matter. You could do something like: "timeme 5m 3h" and it will still work.

- You can put multiple of the same time unit. They will be summed together.
For example: "timeme 5s 3s" will work the same as "timeme 8s".

- There is no limit on number of arguments for this reason, but 3 is the most efficient.

- The countdown can be cancelled by pressing **CTRL+C**

##### 3. Command Timer
- Acceptable formats:
	- timeme run "command"
	- timeme run -bX "command"
	- timeme run --benchmark=X "command"

- If a benchmark number is specified, the command will run X amount of times and display the average runtime afterwards (except when X=1). 

- X must be greater than 0. Can't time what doesn't run!

- If no benchmark option is specified, the command will be run 1 time by default.

- The elapsed time is displayed in the following format: h m s ns
