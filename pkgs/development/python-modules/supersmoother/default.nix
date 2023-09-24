{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
, numpy
, pytestCheckHook
, scipy
}:

buildPythonPackage rec {
  pname = "supersmoother";
  version = "0.3.2";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "jakevdp";
    repo = "supersmoother";
    rev = "v${version}";
    hash = "sha256-wkV/PFfqV7oOsIHBh5GJKwZuF9BnZYu0P+TY1FDr3wU=";
  };

  propagatedBuildInputs = [
    numpy
  ];

  nativeCheckInputs = [
    pytestCheckHook
    scipy
  ];

  disabledTests = [
    # ValueError: Integers to negative integer powers are not allowed.
    "test_perfect_sine"
    "test_equal_spaced_linear_data"
  ];

  pythonImportsCheck = [ "supersmoother" ];

  meta = with lib; {
    description = "Efficient pure Python implementation of Friedman's Supersmoother";
    homepage = "https://github.com/jakevdp/supersmoother";
    changelog = "https://github.com/jakevdp/supersmoother/blob/${src.rev}/CHANGES.md";
    license = licenses.bsd2;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
