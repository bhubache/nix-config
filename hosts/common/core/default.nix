{
  inputs,
  configLib,
  ...
}:
{
  imports = (configLib.scanPaths ./.);
}
