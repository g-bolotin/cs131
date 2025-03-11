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

Either specify the script's absolute or relative path when running, or add the script to a folder defined in $PATH, such as your bin folder. Ensure it has execution privileges.

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

### Example Runs  
$ timeme start  
Starting stopwatch!  
$ timeme stop  
Stopwatch stopped! Elapsed time: 0h 0m 3s  
  
  
$ timeme 2s  
Starting countdown for 2s... (CTRL+C to cancel)  
Time's up!  
  
  
$ timeme 1h 5m 3s  
Starting countdown for 1h 5m 3s... (CTRL+C to cancel)  
^C  
  
  
$ timeme run "ls -a"  
.  ..  README.md  timeme  
Command run 1 times. Elapsed time: 0h 0m 0s 5419243ns  
  
  
$ timeme run -b5 "ls -a"  
.  ..  README.md  timeme  
.  ..  README.md  timeme  
.  ..  README.md  timeme  
.  ..  README.md  timeme  
.  ..  README.md  timeme  
Command run 5 times. Elapsed time: 0h 0m 0s 28886660ns  
Average runtime: 0h 0m 0s 5777332ns  
  
  
$ timeme run --benchmark=3 "sleep 2"  
Command run 3 times. Elapsed time: 0h 0m 6s 17226265ns  
Average runtime: 0h 0m 2s 5742088ns  
  
### Future Improvements
- Redirect multiple run outputs so the terminal isn't cluttered (perhaps a log file for outputs).
- Investigate if there are any ways to reduce the small amount of overhead time for best accuracy.
