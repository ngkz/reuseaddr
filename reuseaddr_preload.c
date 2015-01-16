#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/socket.h>
#include <dlfcn.h>

int  (*orig_bind)(int sockfd, const struct sockaddr *addr, socklen_t addrlen);

int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
    int yes = 1;
    if (!orig_bind) {
        orig_bind = dlsym(RTLD_NEXT, "bind");
    }
    setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));
    return orig_bind(sockfd, addr, addrlen);
}
