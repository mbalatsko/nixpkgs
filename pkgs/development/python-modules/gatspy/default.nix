{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
}:

buildPythonPackage rec {
  pname = "gatspy";
  version = "0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astroML";
    repo = "gatspy";
    rev = "v${version}";
    hash = "sha256-rigPv62Hqxen7XqqeyxqDX8QILhWwXBTQSwNFW/ZQKM=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [ "gatspy" ];

  meta = with lib; {
    description = "General tools for Astronomical Time Series in Python";
    homepage = "https://github.com/astroML/gatspy";
    changelog = "https://github.com/astroML/gatspy/blob/${src.rev}/CHANGES.md";
    license = licenses.bsd2;
    maintainers = with maintainers; [ ];
  };
}
