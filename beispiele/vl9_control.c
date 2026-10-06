int choose(int a, int b) {
    if (a == b) {
        return 1;
    } else {
        return 2;
    }
}

int constant_sum(void) {
    int a = 5;
    int b = 10;
    return a + b;
}

int count_to_ten(int i) {
    while (i < 10) {
        i++;
    }
    return i;
}

int sum_array(const int *p, unsigned int n) {
    int sum = 0;
    unsigned int i;
    for (i = 0; i < n; i++) {
        sum += p[i];
    }
    return sum;
}
