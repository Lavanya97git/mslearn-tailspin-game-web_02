FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Tailspin.SpaceGame.Web.dll"]

# # Use the .NET 8 SDK to build the app
# FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
# WORKDIR /app

# # Copy the build files
# COPY ./bin/Release/net8.0/publish/ .

# # Start the app
# ENTRYPOINT ["dotnet", "AppieName.dll"]