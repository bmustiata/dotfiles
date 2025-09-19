#!/usr/bin/env python
import sys

import click
import yaml

ZDU_LABEL = """\
labels:
  features.aa-install-operator/upgrade-mode: "zdu"   # run a ZDU upgrade
"""

ZDU_TIMEOUTS = """\
# how long should the install operator wait for the system to enter the
# ZDU:BEGIN state
timeoutBeginSeconds: 30
# how long should the install operator wait for the dbload process to
# finish. this includes potentially downloading the dbload image.
timeoutDbLoadSeconds: 300
# how long should the install operator wait for the install customizations
# that happens pre-dbload to finish. this includes potentially downloading
# the customization image.
timeoutInstallCustomizationsSeconds: 60
# how long thould the install operator wait to enter the ZDU:CHECK_DB state
timeoutCheckDbSeconds: 30
# how long should the install operator wait for all the target mqset
# processes to come up (includes image pulling)
timeoutStartNewProcessesSeconds: 600
# how long thould the install operator wait to enter the
# ZDU:CHECK_PROCESSES state
timeoutCheckProcessesSeconds: 30
# how long thould the install operator wait to enter the ZDU:UPGRADE state
timeoutUpgradeSeconds: 60
# how long should the install operator wait for connections to base mqset
# to finish. this includes users and agents. this will try to enter the
# ZDU:CHECK_CONNECTIONS state.
timeoutCheckConnectionsSeconds: 60
# how long to wait after forcefully disconnecting agents and users for no
# connections to be present to base mqset
timeoutDelConnectionsSeconds: 30
# how long to wait for the active executions entries to dissapear from the
# base mqset processes
timeoutCheckExecutionsSeconds: 60
# in case CLEANUP_EXECUTIONS was called, how long to wait for the executions
# running on the mase mqset to disappear from the active list
timeoutCleanupExecutionsSeconds: 30
# how long should the install operator wait for the deployments to scale down.
timeoutScaleDownBaseDeploymentSeconds: 120
# how long thould the install operator wait to enter the ZDU:FINALIZE state
timeoutFinalizeSeconds: 30
# how long should the install operator wait for the deployments to be
# completely removed
timeoutDeleteBaseDeploymentSeconds: 30
"""

@click.command()
@click.option("--values-file", "--values",
              help="Specify the values.yaml file to patch",
              default="values.yaml")
@click.option("--version", "-v",
              required=True,
              help="AE version to upgrade to. i.e. 24.4.0, even if really it's 24.4.0+hf.1")
def main(values_file: str, version: str) -> None:
    """
    Patch the given values.yaml so it does a ZDU upgrade, with rather tight
    deadlines (cca 30 min all stuff)
    """
    with open(values_file, 'r') as f:
        values = yaml.safe_load(f)

    # remove any custom images
    if 'images' in values:
        del values['images']

    # remove any custom repo
    if 'repository' in values:
        del values['repository']

    zdu_timeouts = yaml.safe_load(ZDU_TIMEOUTS)

    if 'operator' not in values:
        values['operator'] = dict()

    values_operator = values['operator']
    values_operator['zdu'] = zdu_timeouts

    if 'labels' not in values:
        values['labels'] = dict()
    values_labels = values['labels']
    values_labels['features.aa-install-operator/upgrade-mode'] = 'zdu'

    values['spec']['version'] = version

    with open(values_file, 'w') as f:
        yaml.safe_dump(values, f, indent=2)

    return


if __name__ == "__main__":
    main()
