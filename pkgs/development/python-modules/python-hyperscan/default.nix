{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, pdm-backend
, setuptools
, wheel
, hyperscan
, pcre
, pkg-config
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "python-hyperscan";
  version = "0.6.0";
  format = "pyproject";
  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "darvid";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-6PoV9rY9CkXkAMWN2QCnfU4S0OJD/6bzkqFgvEVqNjo=";
  };

  nativeBuildInputs = [
    pdm-backend
    setuptools
    wheel
    pkg-config
  ];

  buildInputs = [
    (hyperscan.override { withStatic = true; })
    pcre
  ];

  doCheck = true;
  checkInputs = [ pytestCheckHook ];
  pythonImportsCheck = [ "hyperscan" ];
  
  meta = with lib; {
    description = "A CPython extension for the Hyperscan regular expression matching library";
    homepage = "https://github.com/darvid/python-hyperscan";
    changelog = "https://github.com/darvid/python-hyperscan/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "python-hyperscan";
  };
}
