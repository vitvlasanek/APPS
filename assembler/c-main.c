#include <stdio.h>

int g_arr_32[ ]={10, 20, -20, -10};
long g_arr_64[ ]={ -100000000, -200000000, 200000000,100000000};
long g_arr_positive[]={0,0,0,0};
long g_arr_negative[]={0,0,0,0};


void separate();
void swap();



int main(int argc, char const *argv[])
{
    
    separate();

    printf("\nSeparate:\n\tPositive: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_positive[i]);
    }
    
    printf("\n\tNegative: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_negative[i]);
    }

    printf("\n\n");

    swap();
    printf("\nSwap:\n\tPositive: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_positive[i]);
    }
    
    printf("\n\tNegative: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_negative[i]);
    }

    return 0;
}


short g_greeting_code[] = {0x6c65,0x6c48,0x6f21};
char g_greeting_text[] = {0,0,0,0,0,0,0};