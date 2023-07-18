DIRS := cryptographic_fields testapp

.PHONY: all
all:

.PHONY: dev-deps
dev-deps:
	pip install black==23.7.0 isort==5.12.0 flake8 django_coverage

.PHONY: format
format: black isort

.PHONY: isort
isort:
	isort --force-sort-within-sections --profile=black $(DIRS)

.PHONY: black
black:
	black --line-length 100 $(DIRS)

.PHONY: lint
lint: check-black check-isort flake8

.PHONY: check-black
check-black:
	black --check --diff --line-length 100 $(DIRS)

.PHONY: check-isort
check-isort:
	isort --force-sort-within-sections --profile=black --check $(DIRS)

.PHONY: flake8
flake8:
	flake8 $(DIRS)

.PHONY: test
test:
	python manage.py migrate
	python manage.py test
