#include <wchar.h>
#include "scidoegateway.hxx"
extern "C"
{
#include "scidoegateway.h"
#include "addfunction.h"
}

#define MODULE_NAME L"scidoegateway"

int scidoegateway(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"scidoe_pdist") == 0){ addCFunction(L"scidoe_pdist", &sci_scidoe_pdist, MODULE_NAME); }

    return 1;
}
