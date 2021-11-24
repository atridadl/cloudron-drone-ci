Config Documentation Link: https://docs.drone.io/server/provider/gitea/

Please go to the .env file and edit the following environment variables as per the guide above

`DRONE_GITEA_CLIENT_ID=123
DRONE_GITEA_CLIENT_SECRET=456
DRONE_GITEA_SERVER=git.coolsite.com
DRONE_GITEA_RPC_SECRET=

DRONE_GITEA_SKIP_VERIFY=true`

** PLEASE REMEMBER TO CHANGE DRONE_GITEA_SKIP_VERIFY to false before using. This setting is only set to true to allow the first boot to be successful.
