#include <stdio.h>
#include <time.h>

int main ()
{
   time_t now = time( NULL);

    struct tm now_tm = *localtime( &now);


    struct tm then_tm = now_tm;
    then_tm.tm_min += 40 ;   // add 50 seconds to the time

    mktime( &then_tm);      // normalize it

    printf( "%s\n", asctime( &now_tm));
    printf( "%s\n", asctime( &then_tm));

    return 0;
}

