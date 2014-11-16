The task was to break up the SRT code into various pieces to be run at the 
same time by multiple different threads. First, we make sure to add in the 
pthread.h header file, as well as the lpthread library under the CFLAGS of 
the Makefile. The next logical step is to look at how the code functions.

In main.c's main function, I realized that there was a group of four (that's
 right...four) embedded for-loops. It was pretty clear that this part of the
 convoluted code also probably took up most of the time. I decided to break 
the picture into columns, each column (based on width) corresponding to a 
certain thread. This would become a struct, which I named block; it has the 
width indices for the front and back of its column.

I then created two dynamic arrays to hold each thread and its column. Using
a for-loop, I initialized each thread via pthread_create, calling a function
 (PixelMethod) which was originally held within the four embedded for-loops.
 I basically copied the code over, only changing the initial for-loop to 
match the number of columns/threads. The most difficult part was deciding 
where to put all the constants. I ended up recalculating them each time in 
the thread method, PixelMethod. (In the future, by removing them and making 
them global constants, our program may run faster.)

After testing all the 'make clean check' and './srt 1' commands, I saw that 
the parallelized version of the code ran a lot faster and also correctly 
(except for using 8 threads, which sometimes screws up apparently because of
a new line bug). However, the program works as intended when 'make clean 
check' is outputted to a make-log file. As expected, running SRT with all 
eight threads is a VAST improvement in the (real) speed. (Since user and sys
 times include the time elapsed over all threads, we won't be looking at 
those as critically. It makes sense that the same functions still take the 
same total amount of time to run, but we don't notice since many threads run
 at the same time.)

All in all, the program works great with multithreading, and the time that 
each instance takes falls drastically with more threads utilized. Below are 
the time details for using 1, 2, 4, and 8 threads, respectively.

real    1m26.589s
user    1m26.572s
sys     0m0.001s

real    0m44.210s
user    1m26.607s
sys     0m0.001s

real    0m29.187s
user    1m26.972s
sys     0m0.001s

real    0m18.855s
user    1m30.145s
sys     0m0.004s
