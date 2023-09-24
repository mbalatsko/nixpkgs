{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, poetry-core
, dataprep-ml
, numpy
, pandas
, scikit-learn
, type-infer
, nltk-data
, symlinkJoin
}:
let
  testNltkData = symlinkJoin {
    name = "nltk-test-data";
    paths = [ nltk-data.punkt nltk-data.stopwords ];
  };
in
buildPythonPackage rec {
  pname = "mindsdb-evaluator";
  version = "0.0.11";
  format = "pyproject";
  disable = pythonOlder "3.8";

  # using PyPI as github repo does not contain teags or release branches
  src = fetchPypi {
    pname = "mindsdb_evaluator";
    inherit version;
    hash = "sha256-pEfY+ocLEE8qcDjf6AzJxtXo1cqD2LhcBmlLjN0llTA=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    dataprep-ml
    numpy
    pandas
    scikit-learn
    type-infer
  ];

  # PyPI tarball has no tests
  doCheck = false;

  # Package import requires NLTK data to be downloaded
  # It is the only way to set NLTK_DATA environment variable,
  # so that it is available in pythonImportsCheck
  env.NLTK_DATA = testNltkData;
  pythonImportsCheck = [ "mindsdb_evaluator" ];

  meta = with lib; {
    description = "Model evaluation for Machine Learning pipelines";
    homepage = "https://pypi.org/project/mindsdb-evaluator/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
