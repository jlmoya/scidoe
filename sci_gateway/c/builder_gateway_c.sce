// ====================================================================
// Copyright (C) 2013 - Michael Baudin
// This file is released into the public domain
// ====================================================================

function distfun_builderGatewayC()
    gateway_path = get_absolute_file_path("builder_gateway_c.sce");

    libname = "scidoegateway";
    namelist = [
    "scidoe_pdist"  "sci_scidoe_pdist"
    ];
    files = [
    "sci_scidoe_pdist.c"
    ];

    ldflags = ""

    if ( getos() == "Windows" ) then
        include1 = "..\..\src\c";
        cflags = "-DWIN32 "+..
		" -I"""+include1+"""";
    else
        include1 = gateway_path;
        include2 = gateway_path+"../../src/c";
        cflags = "-I"""+include1+"""";
    end
    // Caution : the order matters !
    libs = [
    "../../src/c/libscidoelib"
    ];

    tbx_build_gateway(libname, namelist, files, gateway_path, libs, ldflags, cflags);

endfunction
distfun_builderGatewayC();
clear distfun_builderGatewayC;
