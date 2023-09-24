{ lib
, buildPythonPackage
, fetchFromGitHub
, cython
, numpy
, setuptools
, setuptools-scm
, wheel
, cloudpickle
, dask
, gatspy
, joblib
, pandas
, scikit-learn
, scipy
, toolz
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "cesium";
  version = "0.12.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "cesium-ml";
    repo = "cesium";
    rev = "v${version}";
    hash = "sha256-KWRsKBtqsYHV/mEevN07wVRDarNwG9bKhRpD9/D7nJQ=";
  };

  nativeBuildInputs = [
    cython
    numpy
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    cloudpickle
    dask
    gatspy
    joblib
    numpy
    pandas
    scikit-learn
    scipy
    setuptools-scm
    toolz
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "cesium" ];

  meta = with lib; {
    description = "Machine Learning Time-Series Platform";
    homepage = "https://github.com/cesium-ml/cesium";
    changelog = "https://github.com/cesium-ml/cesium/releases/tag/${src.rev}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
