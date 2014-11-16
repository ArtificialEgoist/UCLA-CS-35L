#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <limits.h>

int N; //parameter input specifying N-byte size
int cSize=0; //current size of array
struct stat* storage; //temporary storage
char* tempIn; //temporary holder for the array
char* array; //array of all inputs
int c; //temporary holder for each input
int numRec=0; //number of total records
int numPartial=0; //number of final trailing nulls needed
int numCompare=0; //number of comparisons done in total
int ind=0; //index for storing/accessing inputs

int k=0; //loop counter
int j=0; //loop counter

int repeat=0; //used to determine if duplicate exists

int compare(const void* x, const void* y);

void werr(char* buf) //write error based on parameters
{
    int i=0;
    while(buf[i]!='\0') //keep incrementing i until zero-byte
        i++;
    write(2,buf,i); //write out to stderr from buf, for i-bytes
    exit(1); //throw an exit
}

int main(int argc, char** argv)
{
    if(argc!=2)
        werr("Wrong number of arguments!\n");

    N = (int)(strtoul(argv[1], NULL, 0)); //fetch N value from parameter

    if(N<1)
        werr("N value cannot be negative.\n");

    if(errno==ERANGE)
        werr("N value is out of range.\n");

    storage = (struct stat*) malloc(sizeof(stat)); //allocate storage
    //array = (char*) malloc(N); //allocate memory to array

    if(errno==ENOMEM)
        werr("Out of memory!\n");

    if(fstat(0, storage)!=0) //use the fstat system call to take in input from stdin to the parameter stat
        werr("The storage stat is unavailable!\n");

    cSize = N; //initialize the value of the array's size (an arbitrary multiple of N)

    if(S_ISREG(storage->st_mode)) //check if storage's input is a regular file
    {
        cSize=(int)(storage->st_size); //deduce number of input
        cSize += (cSize%N); //set cSize to a multiple of N
    }

    array = (char*) malloc(cSize); //initialize the array based on input size

    if(errno==ENOMEM)
        werr("Out of memory!\n");

    //tempIn = (char*) malloc(1); //initialize a single byte for the temporary holder
    tempIn = (char*) malloc(N); //initialize a single byte for the temporary holder

    if(errno==ENOMEM)
        werr("Out of memory!\n");

    errno=0; //reset errno for input error checking

    while(read(0, tempIn, 1)>0) //as long as something is read from tempIn, execute
    {
        if(ind==cSize) //index has exceeded malloc space
        {
            cSize+=N; //if array size is less than input number, add to size
            array = (char*) realloc(array, cSize); //reallocate memory based on new size

            if(errno==ENOMEM)
                werr("Out of memory!\n");
        }
        array[ind]=tempIn[0]; //add the input to actual array
        ind++;
    }

/*
    c=getchar();
    while(c!=EOF)
    {
        if(ind==cSize) //index has exceeded malloc space
        {
            array = (char*) realloc(array, cSize+N); //reallocate space to aray if necessary
            if(errno==ENOMEM)
                werr("Out of memory!\n"); //check for memory issues again
            cSize+=N; //update size of array
        }

        array[ind]=c; //put that char into the array
        ind++; //update index
        c=getchar(); //get next input char
    }
*/

    if(errno!=0)
        werr("Input error!\n");

    numRec=ind/N; //number of N-byte chunks we have to deal with

    numPartial=N-(ind%N); //determine how many trailing null bytes are needed
    if(0 < numPartial && numPartial < N)
    {
        numRec++; //account the for actual number of records

        for(k=0; k<numPartial; k++)
        {
            array[ind]='\0'; //fill in the rest with trailing zero bytes
            ind++;
        } 
    }

    qsort(array, numRec, N, compare); //sort array

    errno=0; //reset errno for output error checking

/*
    for(j=0; j!=ind; j++)
    {
        if(write(1, array+j; 1)<=0) //if nothing was written or error, break
            break;
    }
*/

    k=0;
    while(k<ind-N+1) //for every element in the array (skipping N bytes each time)
    {
        if(memcmp(array+k, array+k+N, N)==0) //if there is a repeat
            k=k+N; //skip that entire record        
        else //if that record is unique
        {
            for(j=0; j<N; j++)
            {
               if(write(1, array+k+j, 1)<1) //output via system call
                   break;
                //putchar(array[k+j]); //output all the bytes of it
            }
            k=k+N; //update k's index counter
        }
    }

    fprintf(stderr,"Number of comparisons: %d\n", numCompare);
 
    if(errno!=0)
        werr("Output error!\n");

    free(tempIn);
    free(array); //free up array's memory

    exit(0); //succeeded!

}

compare(const void* x, const void* y)
{
    numCompare++;
    return memcmp(x, y, N);
}
