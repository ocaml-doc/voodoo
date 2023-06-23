let () =
  Alcotest.run "voodoo-serialize"
    [
      Test_string.suite;
      Test_fpath.suite;
      Test_package_info.Kind.suite;
      Test_package_info.Module.suite;
      Test_package_info.Library.suite;
      Test_package_info.suite;
      Test_status.Otherdocs.suite;
      Test_status.suite;
    ]
