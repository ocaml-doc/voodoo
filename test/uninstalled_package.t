Call voodoo-do on an uninstalled package

  $ voodoo-prep
  Warning: No universes have been specified: will generate dummy universes
  Ignoring jsoo option passed: -linkall

  $ voodoo-do -p doesnt-exist -b
  Failed to find package doesnt-exist
  [1]
