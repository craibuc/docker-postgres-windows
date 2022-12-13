FROM mcr.microsoft.com/windows/servercore:20H2-amd64

ARG INSTALLER_URI=https://sbp.enterprisedb.com/getfile.jsp?fileid=1258247

WORKDIR /temp

RUN curl -L -o postgresql-windows-x64.exe %INSTALLER_URI%

# run in silent mode
# https://silentinstallhq.com/postgresql-12-silent-install-how-to-guide/
RUN postgresql-windows-x64.exe --mode unattended --unattendedmodeui none
