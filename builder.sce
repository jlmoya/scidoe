// ====================================================================
// Yann COLLETTE
// Copyright 2009
// This file is released into the public domain
// ====================================================================

mode(-1);
lines(0);

function builder_main()

    TOOLBOX_NAME = "Scidoe";
    TOOLBOX_TITLE = "Scidoe";
    toolbox_dir = get_absolute_file_path("builder.sce");

    // Check Scilab's version
    // ============================================================================

    try
        v = getversion("scilab");
    catch
        error(gettext("Scilab 5.3 or more required."));
    end

    // Check modules_manager module availability
    //=============================================================================

    if ~isdef("tbx_build_loader") then
        error(msprintf(gettext("%s module not installed."), "modules_manager"));
    end

    tbx_builder_macros(toolbox_dir);
    //tbx_builder_src(toolbox_dir);
    //tbx_builder_gateway(toolbox_dir);
    tbx_builder_help(toolbox_dir);
    tbx_build_loader(TOOLBOX_NAME,toolbox_dir);
    tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);

endfunction
//=============================================================================
builder_main()
clear builder_main;
//=============================================================================
