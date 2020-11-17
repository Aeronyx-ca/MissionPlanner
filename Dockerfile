#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/framework/runtime:4.8-windowsservercore-ltsc2019
ARG source
WORKDIR /app
COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["C:\\app\\MissionPlanner.exe"]

#FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-ltsc2019
#ARG source
#WORKDIR /app
##WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/publish} .
#ENTRYPOINT ["C:\\app\\MissionPlanner.exe"]

#SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#RUN $newCert=New-SelfSignedCertificate -DnsName 'localhost' -CertStoreLocation cert:\LocalMachine\My; \
#  New-WebBinding -Name 'Default Web Site' -Protocol 'https'; \
#  $binding=Get-WebBinding -Name 'Default Web Site' -Protocol 'https'; \
#  $binding.AddSslCertificate($newCert.GetCertHashString(),'my')