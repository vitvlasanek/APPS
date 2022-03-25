#include "vlakna.h"

void * pth_thread(void * ptr){
    Arr Pole = * (Arr *) ptr ;
    bubble_sort(Pole.arr, Pole.n);
    return nullptr;
}

void create_rand_arr(int n, int * arr, int lim){
    srand(time(NULL));
    for (int i = 0; i < n; i++)
    {
        arr[i] = rand() % lim;
    }
}

void print_arr(int * arr, int n){
    for (int i = 0; i < n; i++)
    {
        printf("%d ",arr[i]);
    }
    
}

int timeval_diff_to_ms( timeval *t_before, timeval *t_after )
{
    timeval l_res;
    timersub( t_after, t_before, &l_res );
    return 1000 * l_res.tv_sec + l_res.tv_usec / 1000;
}



int main(int argc, char *argv[]){

    Arr Pole;
    Pole.n = 20;
    int lim = 500;
    int th_n = 2;
    timeval l_time_before, l_time_after;

    if (argc > 2){
        int lim = atoi(argv[2]);
    }
    if (argc > 1){
        Pole.n = atoi(argv[1]);
    }


    Pole.arr = (int*) malloc (sizeof(int) * Pole.n);


    gettimeofday( &l_time_before, NULL );
    printf("Původní pole:\n");
    create_rand_arr(Pole.n, Pole.arr, lim);
    print_arr(Pole.arr, Pole.n);

    Arr Single_pole;
    Single_pole.n = Pole.n;
    Single_pole.arr = (int*) malloc (sizeof(int) * Single_pole.n);
    memcpy(Single_pole.arr, Pole.arr, sizeof(int)*Pole.n);
    printf("\n\nSetříděné pole:\n");


    bubble_sort (Single_pole.arr, Single_pole.n);
    print_arr(Single_pole.arr, Single_pole.n);
    
    gettimeofday( &l_time_after, NULL );
    printf( "Čas třídění jedním vláknem: %d [ms]\n", timeval_diff_to_ms( &l_time_before, &l_time_after ) );
    printf("\n");

    Arr * Th_pole = (Arr*)malloc(sizeof(Arr)*2);
    div_arr(&Pole, Th_pole, th_n);

    gettimeofday( &l_time_before, NULL );

    printf("\n\nPole pro 1. vlákno:\n");
    print_arr(Th_pole[0].arr, Th_pole[0].n);
    printf("\n\nPole pro 2. vlákno:\n");
    print_arr(Th_pole[1].arr, Th_pole[1].n);


    pthread_t l_pth1, l_pth2;
    pthread_create (&l_pth1, nullptr, pth_thread, &Th_pole[0]);
    pthread_create (&l_pth2, nullptr, pth_thread, &Th_pole[1]);

    pthread_join (l_pth1 ,nullptr);
    pthread_join (l_pth2 ,nullptr);


    printf("\n\nPole pro 1. vlákno:\n");
    print_arr(Th_pole[0].arr, Th_pole[0].n);

    printf("\n\nPole pro 2. vlákno:\n");
    print_arr(Th_pole[1].arr, Th_pole[1].n);

    merge_arr(Th_pole[0], Th_pole[1], Pole);

    printf("\n\nNové pole:\n");
    create_rand_arr(Pole.n, Pole.arr, lim);
    print_arr(Pole.arr, Pole.n);
    gettimeofday( &l_time_after, NULL );
    printf( "Čas třídění více vlákny: %d [ms]\n", timeval_diff_to_ms( &l_time_before, &l_time_after ) );


}