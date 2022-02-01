# PVC Notifier

Simple `cronJob` deployment that executes a `df -h` against the $JENKINS_HOME directory to keep track of usage of the `pvc` volume.

> `Note:` For help with cron job intervals, [Cron Tab Guru](https://crontab.guru) is a great resource.

## Chart Values

```yaml
# This should be the part of the openshift url which defines a specific cluster
# ex: https://console-openshift-console.apps.devops-1-nonprod.openshift.cignacloud.com/
cluster: devops-1-nonprod

# Cron Job Config
cronJob:
  interval: "0 */2 * * *" # https://crontab.guru/#0_*/2_*_*_*
  successHistory: 3 # How many completed pods should be kept around for reference, the oldest will be cleaned up
  failHistory: 2 # Same as success except for error states

# Threshold percentage to trigger notification
threshold: 90

# Optional mattermost webhook url
mattermostWebhookUrl: https://mm.sys.cigna.com/hooks/dur8gt6cybdmtqjuc8jfy4utde

# Create role and rolebinding to attach to specified service account
createRBAC: true

# Service account to use
serviceAccount:
  create: true
  name: pvc-notifier
```