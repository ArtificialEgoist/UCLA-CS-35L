#include <unistd.h>

int main()
{
    char* b[1]; //create a single character buffer, required by read/write
    while(read(0,b,1)>0) //while read intakes something from stdin
        write(1,b,1); //write that character to stdout
}
