#ifndef __SCIDOEGATEWAY_GW_HXX__
#define __SCIDOEGATEWAY_GW_HXX__

#ifdef _MSC_VER
#ifdef SCIDOEGATEWAY_GW_EXPORTS
#define SCIDOEGATEWAY_GW_IMPEXP __declspec(dllexport)
#else
#define SCIDOEGATEWAY_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define SCIDOEGATEWAY_GW_IMPEXP
#endif

extern "C" SCIDOEGATEWAY_GW_IMPEXP int scidoegateway(wchar_t* _pwstFuncName);



#endif /* __SCIDOEGATEWAY_GW_HXX__ */
