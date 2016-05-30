#!/usr/bin/python
# -*- coding: utf-8 -*-

import json


def update_identity():
    identity_id = ""

    with open('/root/.config/camlistore/client-config.json', 'r') as settingsData:
        settings = json.load(settingsData)
        identity_id = settings['identity']

    with open('/opt/camlistore/config/server-config.json', 'r+') as settingsData:
        settings = json.load(settingsData)
        settings['identity'] = identity_id

        settingsData.seek(0)
        settingsData.write(
            json.dumps(
                settings,
                indent=2,
                sort_keys=True
            )
        )
        settingsData.truncate()

if __name__ == "__main__":
    update_identity()
