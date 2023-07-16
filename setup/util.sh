
isMac() {
    test "$(uname)" = "Darwin"
    return $?
}

isLinux() {
   test "$(expr substr $(uname -s) 1 5)" = "Linux"
   return $?
}
