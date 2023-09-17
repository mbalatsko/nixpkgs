{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, wheel
, numpy
, tensorflow
, pythonOlder
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "keras-self-attention";
  version = "0.51.0";
  format = "setuptools";

  disable = pythonOlder "3.11";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-d/znKxLSNXIsu899pbNgm4nuIS9fBzUpRcwIjoUJAOk=";
  };

  propagatedBuildInputs = [
    numpy
    tensorflow
  ];

  nativeCheckInputs = [ pytestCheckHook ];
  pythonImportsCheck = [ "keras_self_attention" ];

  meta = with lib; {
    description = "Attention mechanism for processing sequential data that considers the context for each timestamp";
    homepage = "https://pypi.org/project/keras-self-attention";
    license = licenses.mit;
    maintainers = with maintainers; [ mbalatsko ];
  };
}
