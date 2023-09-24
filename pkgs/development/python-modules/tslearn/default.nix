{ lib
, buildPythonPackage
, fetchFromGitHub
, numpy
, setuptools
, wheel
, cesium
, h5py
, joblib
, numba
, pandas
, scikit-learn
, scipy
, tensorflow
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "tslearn";
  version = "0.6.2";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "tslearn-team";
    repo = "tslearn";
    rev = "v${version}";
    hash = "sha256-TJGXspS5mz3lEsK5Ut4+qSDAp86oe+6aVLCi42UQNFE=";
  };

  nativeBuildInputs = [
    numpy
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    cesium
    h5py
    joblib
    numba
    numpy
    pandas
    scikit-learn
    scipy
    tensorflow
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "tslearn" ];

  meta = with lib; {
    description = "A machine learning toolkit dedicated to time-series data";
    homepage = "https://github.com/tslearn-team/tslearn";
    changelog = "https://github.com/tslearn-team/tslearn/blob/${src.rev}/CHANGELOG.md";
    license = licenses.bsd2;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
