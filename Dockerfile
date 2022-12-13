FROM mcr.microsoft.com/windows/servercore:20H2-amd64

ARG INSTALLER_URI=https://sbp.enterprisedb.com/getfile.jsp?fileid=1258247
ARG POSTGRES_VERSION=11
ARG POSTGRES_USER=postgres
ARG POSTGRES_PASSWORD=postgres

WORKDIR /temp

#
# get the installation package
#

RUN curl -L -o postgresql-windows-x64.exe %INSTALLER_URI%

#
# install PostgreSQL (silent mode)
# https://silentinstallhq.com/postgresql-12-silent-install-how-to-guide/
#

RUN .\postgresql-windows-x64.exe --mode unattended --unattendedmodeui none --superaccount %POSTGRES_USER% --superpassword %POSTGRES_PASSWORD%

#
# add postgreSQL's bin directory to the PATH environment variable
#

RUN setx path "%PATH%;C:\Program Files\PostgreSQL\%POSTGRES_VERSION%\bin"
