#!/bin/sh
if [ $(id -u) -ne 0 ]; then
  echo "E: Please run as root"
  exit 1
fi

if [ -r .env ]; then
  set -a
  . ./.env
  set +a
else
  echo "E: '.env' file not readible or missing"
  exit 1
fi

if [ -d ext ]; then
  for f in ext/*.sh; do
    sh "$f" || break
  done
else
  echo "E: Project directory structure incorrect (missing ext/)"
  exit 1
fi

if [ -d $PROJECT_PATH ]; then
  cp .env $PROJECT_PATH/opt/.env
  echo "#!/bin/sh
if [ -r .env ]; then
  set -a
  . ./.env
  set +a
else
  echo \"'.env' file not readible or missing\"
  exit 1
fi

for f in /opt/nos-init/*.sh; do
  sh \"\$f\" || break
done" > $PROJECT_PATH/opt/nos-init.sh
  chmod +x $PROJECT_PATH/opt/nos-init.sh

  if [ -d int ]; then
    mkdir -p $PROJECT_PATH/opt/nos-init
    rm -r $PROJECT_PATH/opt/nos-init/* >/dev/null
    cp int/*.sh $PROJECT_PATH/opt/nos-init/
    schroot -c mlnx -u root --directory /opt/ -- /opt/nos-init.sh
    rm -r $PROJECT_PATH/opt/nos-init* $PROJECT_PATH/opt/.env
  else
    echo "E: Project directory structure incorrect (missing int/)"
    exit 1
  fi
else
  echo "E: There is no $PROJECT_PATH"
  exit 1
fi
