{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
, scikit-learn
, numpy
, scipy
, matplotlib
, astropy
, pytestCheckHook
, pytest-astropy
, pytest-doctestplus
, pytest-astropy-header
, pytest-remotedata
}:

buildPythonPackage rec {
  pname = "astroML";
  version = "1.0.2";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "astroML";
    repo = "astroML";
    rev = "v${version}";
    hash = "sha256-RaF//Oww8/njc40PIisFBciSbCffTJ9yHqcseqT8CqU=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    scikit-learn
    numpy
    scipy
    matplotlib
    astropy
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-astropy
    pytest-doctestplus
  ];

  preCheck = ''
    cd $out
  '';
  pythonImportsCheck = [ "astroML" ];

  meta = with lib; {
    description = "Machine learning, statistics, and data mining for astronomy and astrophysics";
    homepage = "https://github.com/astroML/astroML";
    changelog = "https://github.com/astroML/astroML/blob/${src.rev}/CHANGES.rst";
    license = licenses.bsd2;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
