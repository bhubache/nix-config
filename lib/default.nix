{ lib, ... }:
{
  # Function that prepends the path to the root of the project to its argument.
  # Enables you to avoid long ../ prefixes when referencing paths
  relativeToRoot = lib.path.append ../.;

  # Function that returns a list of ...
  # This can be used with ``imports`` in ``default.nix`` to automatically
  # import all files in the current directory. The benefit is two-fold:
  #   1. Reduces the amount of code
  #   2. Future files that need to be imported by ``default.nix`` will
  #      be done so automatically
  scanPaths = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
      (lib.attrsets.filterAttrs
        (
	  path: type_:
	    (type_ == "directory")  # include directories
	    || (
	      (path != "default.nix")  # ignore default.nix
	      && (lib.strings.hasSuffix ".nix" path)  # include .nix files
	    )
	)
	(builtins.readDir path)
      )
    );
}
