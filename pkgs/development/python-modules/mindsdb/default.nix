{ lib
, buildPythonPackage
, fetchFromGitHub
, werkzeug
, lightwood
, pandas
, markupsafe
, flask-restx
, flask
, itsdangerous
, jinja2
, python-multipart
, pyparsing
, cryptography
, psycopg2-binary
, python-tds
, waitress
, pymongo
, setuptools
, psutil
, sqlalchemy
, alembic
, sentry-sdk
, redis
, walrus
, flask-compress
, appdirs
, mindsdb-sql
, mindsdb-evaluator
, checksumdir
, duckdb
, requests
, mysql-connector-python
, charset-normalizer
, pyOpenSSL
, pydateinfer
, pyarrow
, dataprep-ml
, python-magic
, openpyxl
, dill
, slack-sdk
}:

buildPythonPackage rec {
  pname = "mindsdb";
  version = "23.9.2.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "mindsdb";
    repo = "mindsdb";
    rev = "v${version}";
    hash = "sha256-NyzQgh9eTXqhT3+gCzTJ33rxL3PjkPivHXkXxr27LRs=";
  };

  propagatedBuildInputs = [
    werkzeug
    lightwood
    pandas
    markupsafe
    flask-restx
    flask
    itsdangerous
    jinja2
    python-multipart
    pyparsing
    cryptography
    psycopg2-binary
    python-tds
    waitress
    pymongo
    setuptools
    psutil
    sqlalchemy
    alembic
    sentry-sdk
    redis
    walrus
    flask-compress
    appdirs
    mindsdb-sql
    mindsdb-evaluator
    checksumdir
    duckdb
    requests
    mysql-connector-python
    charset-normalizer
    pyOpenSSL
    pydateinfer
    pyarrow
    dataprep-ml
    python-magic
    openpyxl
    dill
    slack-sdk 
  ];

  pythonImportsCheck = [ "mindsdb" ];

  meta = with lib; {
    description = "MindsDB connects AI models to databases";
    homepage = "https://github.com/mindsdb/mindsdb";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
  };
}
