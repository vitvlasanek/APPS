void bubble_swap(int &a, int &b) {
    int fst_to_snd;
    fst_to_snd = a;
    a = b;
    b = fst_to_snd;
}

void bubble_sort(int * arr, int n){
    for(int i = 0; i<n; i++) {
        int swaps = 0;
        for(int j = 0; j<n-i-1; j++) {
        if(arr[j] > arr[j+1]) {
            bubble_swap(arr[j], arr[j+1]);
            swaps = 1;
        }
    }
    if(!swaps)
    break;
    }
}