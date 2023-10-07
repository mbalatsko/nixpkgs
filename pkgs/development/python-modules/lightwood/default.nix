{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
, black
, colorlog
, dataclasses-json
, dataprep-ml
, dill
, langid
, mindsdb-evaluator
, nltk
, numpy
, optuna
, pandas
, protobuf
, psutil
, pydateinfer
, python-dateutil
, regex
, requests
, schema
, scikit-learn
, scipy
, six
# , sktime
# , statsforecast
, statsmodels
, tab-transformer-pytorch
, torch
, torch-optimizer
, transformers
, type-infer
, typing-extensions
, typing-inspect
, xgboost
}:

buildPythonPackage rec {
  pname = "lightwood";
  version = "23.8.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mindsdb";
    repo = "lightwood";
    rev = "v${version}";
    hash = "sha256-RYOvPQClpJRQJJzjG4BreV9jNarfoBmjyASmoS0qA6E=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    black
    colorlog
    dataclasses-json
    dataprep-ml
    dill
    langid
    mindsdb-evaluator
    nltk
    numpy
    optuna
    pandas
    protobuf
    psutil
    pydateinfer
    python-dateutil
    regex
    requests
    schema
    scikit-learn
    scipy
    setuptools
    six
    # sktime
    # statsforecast
    statsmodels
    tab-transformer-pytorch
    torch
    torch-optimizer
    transformers
    type-infer
    typing-extensions
    typing-inspect
    wheel
    xgboost
  ];

  pythonImportsCheck = [ "lightwood" ];

  meta = with lib; {
    description = "Lightwood is Legos for Machine Learning";
    homepage = "https://github.com/mindsdb/lightwood";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
