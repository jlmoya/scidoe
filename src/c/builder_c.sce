// Copyright (C) 2013 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function distfun_builderCdflib()
    src_dir = get_absolute_file_path("builder_c.sce");


    src_path = "c";
    linknames = ["scidoelib"];
    files = [
    "pdist.c"
    ];
    ldflags = "";

    if ( getos() == "Windows" ) then
        cflags = "-DWIN32 -DLIBSCIDOE_C_EXPORTS";
    else
        include1 = src_dir;
        cflags = "-I"""+include1+"""";
    end

    libs = [
    ];
    tbx_build_src(linknames, files, src_path, src_dir, libs, ldflags, cflags);

endfunction 
distfun_builderCdflib();
clear distfun_builderCdflib;
