language: python

cache: pip

python:
  - "2.7"
  - "3.4"
  - "3.5"

#  - "3.6"

dist: trusty
sudo: required

before_install:
  - sudo apt-get update
  - sudo apt-get install -y wget git swig portaudio19-dev libpulse-dev vlc-nox shellcheck

install:
  - pip install -r src/requirements.txt
  - pip install -r src/dev-requirements.txt
  - yes | pip install git+https://github.com/duxingkei33/orangepi_PC_gpio_pyH3.git -v

script:
  - pylint --rcfile=pylintrc --ignore=tunein.py src/auth_web.py src/main.py src/alexapi
  - python -c "import yaml; yaml.load(open('src/config.template.yaml'))"
  - cd src/scripts && shellcheck -e 2164 ./inc/*.sh ./inc/os/*.sh ./inc/device/*.sh ./*.sh




