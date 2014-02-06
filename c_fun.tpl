int main_() {
    int result = EXIT_SUCCESS;

    goto ok;
err:
    result = EXIT_FAILURE;
ok:
    return result;
}
