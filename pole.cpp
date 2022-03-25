#include "vlakna.h"


void div_arr(Arr * Pole, Arr * Th_pole, int thr_n){
    for (int i = 0; i < thr_n; i++)
    {
        Th_pole[i].n = Pole->n / thr_n;
        Th_pole[i].arr = (int*)malloc(sizeof(int) * Th_pole[i].n);
        memcpy(Th_pole[i].arr,Pole->arr + i*Th_pole[i].n,Th_pole[i].n * sizeof(int));  
    }
}

void merge_arr(Arr Pole1, Arr Pole2, Arr Pole0){
    int n = Pole1.n + Pole2.n;
    for (int i = 0; i < n; i++)
    {
        int a = 0;
        int b = 0;
        if (Pole1.arr[a] >= Pole2.arr[b]){
            Pole0.arr[i] = 0;
            a++;
        }
        else{
            Pole0.arr[i] = 0;
            b++;
        }
    }
}