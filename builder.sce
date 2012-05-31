// ====================================================================
// Yann COLLETTE
// Copyright 2009
// This file is released into the public domain
// ====================================================================

// Copyright (C) 2008 - INRIA
// Copyright (C) 2009-2011 - DIGITEO

// This file is released under the 3-cluase BSD licence. See COPYING-BSD

mode(-1);
lines(0);

function main_builder()

  TOOLBOX_NAME = "Scidoe";
  TOOLBOX_TITLE = "Scidoe";
  toolbox_dir = get_absolute_file_path("builder.sce");

// Check Scilab's version
// ============================================================================

  try
     v = getversion("scilab");
  catch
     error(gettext("Scilab 5.4 or more required."));
  end

  if v(2) < 4 then
     //new API in Scilab 5.4
     error(gettext('Scilab 5.4 or more is required.'));
  end
clear v;

//Check modules_manager module availability
//=============================================================================

if ~isdef('tbx_build_loader') then
  error(msprintf(gettext('%s module not installed."), 'modules_manager'));
end

//Action
//=============================================================================

tbx_builder_macros(toolbox_dir);
tbx_builder_src(toolbox_dir);
tbx_builder_gateway(toolbox_dir);
tbx_builder_help(toolbox_dir);
tbx_builder_loader(TOOLBOX_NAME,toolbox_dir);
tbx_builder_cleaner(TOOLBOX_NAME, toolbox_dir);

end function
//=============================================================================
main_builder();
clear main_builder; // remove main_builder on stack
//=============================================================================
