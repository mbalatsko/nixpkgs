{ lib
, buildPythonPackage
, fetchFromGitHub
, build
, setuptools
, toml
, wheel
, numpy
, packaging
, pandas
, scikit-base
, scikit-learn
, scipy
, attrs
, cloudpickle
, dash
, dask
, dtw-python
, esig
, filterpy
, gluonts
, h5py
, hmmlearn
, holidays
, keras-self-attention
, kotsu
, matplotlib
, mne
, numba
, pmdarima
, prophet
, pycatch22
, pykalman
, pyod
, scikit-optimize
, scikit-posthocs
, seaborn
, seasonal
, statsforecast
, statsmodels
, stumpy
, tbats
, tensorflow
, tsfresh
, tslearn
, xarray
, jupyter
, mrsqm
, backoff
, httpx
, pre-commit
, pytest
, pytest-cov
, pytest-randomly
, pytest-timeout
, pytest-xdist
, myst-parser
, nbsphinx
, numpydoc
, pydata-sphinx-theme
, sphinx
, sphinx-copybutton
, sphinx-design
, sphinx-gallery
, sphinx-issues
, sphinx-version-warning
, tabulate
, mlflow
, boto3
, botocore
, moto
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "sktime";
  version = "0.22.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "sktime";
    repo = "sktime";
    rev = "v${version}";
    hash = "sha256-dPxyRSxMQ5hKAK5+8fDpIVW+8KHsH406AaqbtLbLL28=";
  };

  nativeBuildInputs = [
    build
    setuptools
    toml
    wheel
  ];

  propagatedBuildInputs = [
    numpy
    packaging
    pandas
    scikit-base
    scikit-learn
    scipy
    attrs
    cloudpickle
    dash
    dask
    dtw-python
    esig
    filterpy
    gluonts
    h5py
    hmmlearn
    holidays
    keras-self-attention
    kotsu
    matplotlib
    mne
    numba
    pmdarima
    prophet
    pycatch22
    pykalman
    pyod
    scikit-posthocs
    seaborn
    seasonal
    statsforecast
    statsmodels
    stumpy
    tbats
    tensorflow
    tsfresh
    tslearn
    xarray
    jupyter
    mrsqm
    tensorflow
    mlflow
  ];

  nativeCheckInputs = [
    pytestCheckHook
    boto3
    botocore
    mlflow
    moto
  ];
  pythonImportsCheck = [ "sktime" ];

  meta = with lib; {
    description = "A unified framework for machine learning with time series";
    homepage = "https://github.com/sktime/sktime";
    changelog = "https://github.com/sktime/sktime/blob/${src.rev}/CHANGELOG.md";
    license = licenses.bsd3;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
