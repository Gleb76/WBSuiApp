MODULE="Modules/AnimeAPI/Sources/AnimeAPI"

openapi-generator generate -i "anime.yaml" -g swift5 -o "anime"
rm -rf "$MODULE"*
cp -R "anime/OpenAPIClient/Classes/OpenAPIs/" "$MODULE"
rm -rf "anime"
