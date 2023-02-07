
isMac() {
    return "$(uname)" == "Darwin"
}

isLinux() {
   return "$(expr substr $(uname -s) 1 5)" == "Linux"
}
