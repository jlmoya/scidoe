#include <wchar.h>
#include "libscidoegateway.hxx"
extern "C"
{
#include "libscidoegateway.h"
#include "addfunction.h"
}

#define MODULE_NAME L"libscidoegateway"

int libscidoegateway(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"scidoe_pdist") == 0){ addCStackFunction(L"scidoe_pdist", &sci_scidoe_pdist, MODULE_NAME); }

    return 1;
}
