#include <stdio.h>

int g_arr_32[ ]={-30, 20, -20, -10};
long g_arr_64[ ]={ -100000000, -200000000, 200000000,100000000};
long g_arr_positive[]={0,0,0,0};
long g_arr_negative[]={0,0,0,0};

short g_greeting_code[] = {0x6c65,0x6c48,0x6f21};
char g_greeting_text[] = {0,0,0,0,0,0};

char g_greeting_input[] = {'d', 'a', 'z', 'N', 'a', 'r'};

int g_index_a=0;
int g_index_b=3;

void separate();
void swap();
void decode();
void swap_index();
void code();




int main(int argc, char const *argv[])
{
    //separate
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

    //swap
    swap();
    printf("\n\nSwap:\n\tPositive: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_positive[i]);
    }
    
    printf("\n\tNegative: ");
    for (int i = 0; i < 4; i++)
    {
        printf("\t%ld", g_arr_negative[i]);
    }

    //decode
    code();

    printf("\n\nkód:\n\t");
    for (int i = 0; i < 3; i++)
    {
        printf("%x, ", g_greeting_code[i]);
    }
    

    decode();
    printf("\n\nDecode:\n\t");
    for (int i = 0; i < 6; i++)
    {
        printf("%c", g_greeting_text[i]);
    }

    //swap
    swap_index();
    printf("\n\nSwap_index:\n\t");
    for (int i = 0; i < 6; i++)
    {
        printf("%c", g_greeting_text[i]);
    }
    printf("\n\n");

    return 0;
}
