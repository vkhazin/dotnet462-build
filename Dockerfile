# Adopted from http://blog.alexellis.io/3-steps-to-msbuild-with-docker/
FROM microsoft/dotnet-framework:4.6.2
SHELL ["powershell"]

# Install MSBuild
# RUN Invoke-WebRequest "https://download.microsoft.com/download/9/B/B/9BB1309E-1A8F-4A47-A6C5-ECF76672A3B3/BuildTools_Full.exe" \
#	-UseBasicParsing \
#	-OutFile ./BuildTools_Full.exe

#RUN ./BuildTools_Full.exe

COPY ./MSBuild ./MSBuild

RUN Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" \
	-UseBasicParsing \
	-OutFile ./nuget.exe
RUN & ./nuget.exe Install
RUN setx PATH '%PATH%;C:\\MSBuild\\12.0\\Bin\\'  
CMD ["powershell"]