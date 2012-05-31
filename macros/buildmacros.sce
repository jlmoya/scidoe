// ====================================================================
// Yann COLLETTE
// Copytight 2009
// This file is released into the public domain
// Scidoe Toolbox
// ====================================================================

function buildmacros()
  macros_path = get_absolute_file_path("buildmacros.sce");
  tbx_build_macros(TOOLBOX_NAME, macros_path);
endfunction

buildmacros();
clear buildmacros; // remove buildmacros on stack

