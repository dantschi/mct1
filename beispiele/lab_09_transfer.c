/* ILP32-Zielmodell; gueltiges Array, n <= 6, darstellbare signed Summen. */
int lower_to_zero(int x) {
    while (x > 0) {
        x -= 3;
    }
    return x;
}

int sum_even_positions(const int *p, unsigned n) {
    int sum = 0;
    for (unsigned i = 0; i < n; i += 2) {
        sum += p[i];
    }
    return sum;
}
