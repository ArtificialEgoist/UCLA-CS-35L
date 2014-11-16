#include <stdio.h>

int main()
{
    int ch; //hold a single character
    for(;;) //loop until break
    {
        ch=getchar(); //fetch next character
        if(ch!=EOF) //if the character exists, put it into output stream
            putchar(ch);
        else //if end of file is reached, break!
            break;
    }
}
