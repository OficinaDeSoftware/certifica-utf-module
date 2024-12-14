@echo off

if "%~1"=="" (
    echo Por favor, forneça o GIT_FORK_HOST como parametro.
    echo Exemplo: init-submodules.bat meu-usuario-do-github
    exit /b 1
)

set GIT_FORK_HOST=%~1

set UPSTREAM_HOST=github.com/OficinaDeSoftware

cd services

echo Configurando repositórios com o fork: %GIT_FORK_HOST%
echo Configurando a upstream: %UPSTREAM_HOST%

echo Configurando submódulo email-sender...
git submodule add https://github.com/%GIT_FORK_HOST%/email-sender.git email-sender
cd email-sender
git remote add upstream https://%UPSTREAM_HOST%/email-sender.git
git remote set-url --push upstream no_push
cd ..

echo Configurando submódulo certifica-utf-auth...
git submodule add https://github.com/%GIT_FORK_HOST%/certifica-utf-auth.git certifica-utf-auth
cd certifica-utf-auth
git remote add upstream https://%UPSTREAM_HOST%/certifica-utf-auth.git
git remote set-url --push upstream no_push
cd ..

echo Configurando submódulo uploader...
git submodule add https://github.com/%GIT_FORK_HOST%/uploader.git uploader
cd uploader
git remote add upstream https://%UPSTREAM_HOST%/uploader.git
git remote set-url --push upstream no_push
cd ..

echo Configurando submódulo certifica-utf-gateway...
git submodule add https://github.com/%GIT_FORK_HOST%/certifica-utf-gateway.git certifica-utf-gateway
cd certifica-utf-gateway
git remote add upstream https://%UPSTREAM_HOST%/certifica-utf-gateway.git
git remote set-url --push upstream no_push
cd ..

echo Configurando submódulo certifica-utf-back-end...
git submodule add https://github.com/%GIT_FORK_HOST%/certifica-utf-back-end.git certifica-utf-back-end
cd certifica-utf-back-end
git remote add upstream https://%UPSTREAM_HOST%/certifica-utf-back-end.git
git remote set-url --push upstream no_push
cd ..

echo Configurando submódulo certifica-utf-service-registry...
git submodule add https://github.com/%GIT_FORK_HOST%/certifica-utf-service-registry.git certifica-utf-service-registry
cd certifica-utf-service-registry
git remote add upstream https://%UPSTREAM_HOST%/certifica-utf-service-registry.git
git remote set-url --push upstream no_push
cd ..

echo Inicializando submódulos e atualizando de maneira recursiva...
git submodule update --init --recursive

echo Todos os submódulos foram configurados com upstream e push desabilitado!
pause