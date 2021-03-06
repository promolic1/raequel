
LIBS_DIR='libs/'
THIRD_PARTY='third_party/'

deps:
	pip install --ignore-installed --no-dependencies --target=${LIBS_DIR} --use-mirrors rae

develop_deps: deps
	pip install --target=${THIRD_PARTY} --use-mirrors lxml mockcache

deploy: deps clean
	-rm -fr ${THIRD_PARTY}/*     # Don't push third party libs to server
	appcfg.py update .

test:
	py.test test_raequel.py

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +

clean: clean-pyc
	-rm -fr __pycache__

.PHONY: libs deploy clean clean-pyc
