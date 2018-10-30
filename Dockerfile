FROM fedora

ENV DOTNET_SDK_VERSION 2.1-2.1.402-1
ENV ASPNETCORE_PKG_VERSION 2.1.1
ENV IMAGE_DATE 2018-10-30
ENV IMAGE_NUM 001

RUN export DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    && dnf update -y \
    && dnf install -y https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm \
    && dnf install -y https://packages.microsoft.com/rhel/7/prod/dotnet-host-2.1.0-x64.rpm \
    && dnf install dotnet-sdk-2.1 wget libunwind nano mc compat-openssl10 icu iputils xz gssntlmssp -y \
    && dnf clean all \
    && mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch
