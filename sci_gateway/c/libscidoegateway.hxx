#ifndef __LIBSCIDOEGATEWAY_GW_HXX__
#define __LIBSCIDOEGATEWAY_GW_HXX__

#ifdef _MSC_VER
#ifdef LIBSCIDOEGATEWAY_GW_EXPORTS
#define LIBSCIDOEGATEWAY_GW_IMPEXP __declspec(dllexport)
#else
#define LIBSCIDOEGATEWAY_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define LIBSCIDOEGATEWAY_GW_IMPEXP
#endif

extern "C" LIBSCIDOEGATEWAY_GW_IMPEXP int libscidoegateway(wchar_t* _pwstFuncName);



#endif /* __LIBSCIDOEGATEWAY_GW_HXX__ */
