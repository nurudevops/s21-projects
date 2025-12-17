#include <fcgiapp.h>
#include <stdio.h>

int main() {
    FCGX_Request req;

    FCGX_Init();
    FCGX_InitRequest(&req, 0, 0);

    while (FCGX_Accept_r(&req) >= 0) {
        FCGX_FPrintF(req.out, "Content-Type: text/html\r\n\r\n");
        FCGX_FPrintF(req.out, "<html><body><h1>Hello, world!</h1></body></html>\n");
        FCGX_Finish_r(&req);
    }

    return 0;
}
