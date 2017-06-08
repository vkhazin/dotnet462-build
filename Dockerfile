# Adopted from http://blog.alexellis.io/3-steps-to-msbuild-with-docker/
FROM microsoft/dotnet-framework:4.6.2
SHELL ["powershell"]

# Works, but am I allowed to re-dist MSBuild.exe?
# COPY ./MSBuild ./MSBuild
# RUN setx PATH '%PATH%;C:\\MSbuild;'

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install dotnet 4.6.2
RUN choco install netfx-4.6.2-devpack -y

# Install MSBuild 15.0
RUN choco install microsoft-build-tools -y

# Install Docker
RUN choco install nuget.commandline
# RUN Install-Module -Name DockerMsftProvider -Force
# RUN Install-Package -Name docker -ProviderName DockerMsftProvider -Force

CMD ["powershell"]

# RUN Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" \
#	-UseBasicParsing \
#	-OutFile ./nuget.exe
# RUN & ./nuget.exe Install

# COPY ./vs_buildtools.exe ./
# RUN ./vs_buildtools.exe --add Microsoft.VisualStudio.Workload.WebBuildTools --quiet --wait
# RUN setx PATH '%PATH%;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSbuild\\15.0\\Bin;'