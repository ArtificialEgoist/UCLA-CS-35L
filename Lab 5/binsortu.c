#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

int N; //parameter input specifying N-byte size
int cSize=0; //current size of array
char* array; //array of all inputs
int c; //temporary holder for each input
int numRec=0; //number of total records
int numPartial=0; //number of final trailing nulls needed
int ind=0; //index for storing/accessing inputs

int k=0; //loop counter
int j=0; //loop counter

int repeat=0; //used to determine if duplicate exists

int compare(const void* x, const void* y);

int main(int argc, char** argv)
{
    if(argc!=2)
    {
        fprintf(stderr, "Wrong number of arguments!\n");
        exit(1);
    }

    N = (int)(strtoul(argv[1], NULL, 0)); //fetch N value from parameter

    if(N<1)
    {
        fprintf(stderr, "N value cannot be negative.\n");
        exit(1);
    }

    if(errno==ERANGE)
    {
        fprintf(stderr, "N value is out of range.\n");
        exit(1);
    }

    array = (char*) malloc(N); //allocate memory to array

    if(errno==ENOMEM)
    {
        fprintf(stderr, "Out of memory!\n");
        exit(1);
    }

    cSize = N; //initialize the value of the array's size

    errno=0; //reset errno for input error checking

    c=getchar();
    while(c!=EOF)
    {
        if(ind==cSize) //index has exceeded malloc space
        {
            array = (char*) realloc(array, cSize+N); //reallocate space to aray if necessary
            if(errno==ENOMEM)
            {
                fprintf(stderr, "Out of memory!\n"); //check for memory issues again
                exit(1);
            }
            cSize+=N; //update size of array
        }

        array[ind]=c; //put that char into the array
        ind++; //update index
        c=getchar(); //get next input char
    }

    if(errno!=0)
    {
        fprintf(stderr, "Input error!\n");
        exit(1);
    }

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

    k=0;
    while(k<ind-N+1) //for every element in the array (skipping N bytes each time)
    {
        if(memcmp(array+k, array+k+N, N)==0) //if there is a repeat
        {
            k=k+N; //skip that entire record
        }
        else //if that record is unique
        {
            for(j=0; j<N; j++)
            {
                putchar(array[k+j]); //output all the bytes of it
            }
            k=k+N; //update k's index counter
        }
    }

/*
    for(k=0; k<ind; k++)
    {
        putchar(array[k]);
    }
*/

    if(errno!=0)
    {
        fprintf(stderr, "Output error!\n");
        exit(1);
    }

    free(array); //free up array's memory

    exit(0); //succeeded!

}

compare(const void* x, const void* y)
{
    return memcmp(x, y, N);
}
