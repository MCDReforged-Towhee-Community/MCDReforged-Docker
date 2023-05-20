import os
import json
import requests

PLUGINS = [
    {
        "name": "Quick Backup Multi",
        "url": "https://github.com/TISUnion/QuickBackupM/releases/download/v1.9.0/QuickBackupM-v1.9.0.mcdr",
        "dependencies": [
        ]
    },
    {
        "name": "Minecraft Data API",
        "url": "https://github.com/MCDReforged/MinecraftDataAPI/releases/download/v1.4.1/MinecraftDataAPI-v1.4.1.mcdr",
        "dependencies": [
            "hjson",
            "parse",
        ]
    },
    {
        "name": "AdvancedCalculator",
        "url": "https://github.com/AnzhiZhang/MCDReforgedPlugins/releases/download/advanced_calculator-v0.3.1/AdvancedCalculator-v0.3.1.mcdr",
        "dependencies": [
        ]
    },
    {
        "name": "Where Is",
        "url": "https://github.com/Lazy-Bing-Server/WhereIs-MCDR/releases/download/2.0.2/WhereIs-v2.0.2%2Bbuild.6.mcdr",
        "dependencies": [
        ]
    },
]

for plugin in PLUGINS:
    print(f'Installing "{plugin["name"]}"')
    url = plugin["url"]

    # download plugin
    with open(f"/mcdreforged/plugins/{url.split('/')[-1]}", "wb") as f:
        f.write(requests.get(url).content)

    # install dependencies
    for dependency in plugin["dependencies"]:
        print(f'Installing dependency "{dependency}"')
        os.system(f"pip install {dependency}")
