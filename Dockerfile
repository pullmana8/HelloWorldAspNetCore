FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /app
COPY *.csproj .
RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o out

ENV ASPNETCORE_URLS http://*:8080

CMD ["dotnet", "out/HelloWorldAspNetCore.dll"]