#!/usr/bin/env python3

import click

statuses = {
    "1300": "EH-STATUS-PREPARING",
    "1301": "eh-status-waiting-user-input",
    "1310": "EH-STATUS-operantion-not-init",
    "1500": "EH-status-alive-low",
    "1510": "EH-STATUS-READY-FOR-ACTIVATION",
    "1520": "EH-STATUS-READY-FOR-FT",
    "1521": "EH-STATUS-READY-FOR-transfer",
    "1529": "EH-STATUS-READY-FOR-GEN",
    "1530": "EH-STATUS-READY-FOR-RUN",
    "1531": "EH-STATUS-to-call",
    "1539": "eh-status-ready-for-something",
    "1540": "EH-STATUS-IN-ACTIVATION",
    "1541": "EH-STATUS-checking",
    "1542": "EH-STATUS-CALLING",
    "1543": "EH-STATUS-unknown",
    "1544": "EH-STATUS-INCONSISTENT",
    "1545": "EH-STATUS-RUNWAIT",
    "1546": "EH-STATUS-CONNECTING",
    "1547": "EH-STATUS-Queue-inconsistent",
    "1550": "EH-STATUS-RUNNING",
    "1551": "EH-STATUS-TRANSFERING",
    "1552": "EH-STATUS-called",
    "1553": "EH-STATUS-accepted",
    "1554": "EH-STATUS-sampling-files",
    "1556": "EH-STATUS-eskaliert",
    "1557": "EH-STATUS-custom-backup",
    "1558": "EH-STATUS-file-backup",
    "1560": "EH-STATUS-jp-blocking",
    "1561": "EH-STATUS-stopped-system",
    "1562": "EH-STATUS-hold",
    "1563": "EH-STATUS-stopped-manuell",
    "1564": "EH-STATUS-stopped-queue",
    "1565": "EH-STATUS-send-ended",
    "1566": "EH-STATUS-timeout-skipping",
    "1567": "EH-STATUS-cond-skipping",
    "1568": "EH-STATUS-inaktiv-skipping",
    "1569": "EH-STATUS-sync-skipping",
    "1570": "EH-STATUS-skipping",
    "1571": "EH-STATUS-in-cancel",
    "1572": "EH-STATUS-generating",
    "1573": "EH-STATUS-generated",
    "1574": "EH-STATUS-post-processing",
    "1575": "EH-STATUS-in-ending",
    "1576": "EH-STATUS-regenerating",
    "1577": "EH-STATUS-operation-initiated",
    "1578": "eh-status-scanning-files",
    "1579": "eh-status-scanning-reports",
    "1580": "eh-status-resolving",
    "1581": "eh-status-checking-post-cond",
    "1582": "eh-status-checking-prompts",
    "1583": "eh-status-looping",
    "1584": "eh-status-calculating-ert",
    "1590": "eh-status-cust-rollback",
    "1591": "eh-status-file-rollback",
    "1592": "eh-status-hostg-rollback",
    "1593": "eh-status-workflow-rollback",
    "1599": "eh-status-alive-benutzersicht",
    "1600": "eh-status-intern",
    "1655": "eh-status-waiting-rollback",
    "1665": "eh-status-waiting-for-ddescri",
    "1680": "eh-status-checking-pre-cond",
    "1681": "eh-status-waiting-user",
    "1682": "eh-status-waiting-vara-service",
    "1683": "eh-status-waiting-remote-res",
    "1684": "eh-status-waiting-queue",
    "1685": "eh-status-waiting-pp-host",
    "1686": "eh-status-waiting-hg-start",
    "1687": "eh-status-waiting-hg-parallel",
    "1688": "eh-status-waiting-hostgroup",
    "1689": "eh-status-waiting-host-ftmax",
    "1690": "eh-status-waiting-external",
    "1691": "eh-status-waiting-rsys",
    "1692": "eh-status-waiting-rsync",
    "1693": "EH-STATUS-WAITING-release",
    "1694": "eh-status-waiting-host-max",
    "1695": "eh-status-waiting-repeat",
    "1696": "eh-status-waiting-host",
    "1697": "EH-STATUS-WAITING-sync",
    "1698": "EH-STATUS-WAITING-time",
    "1699": "eh-status-alive",
    "1700": "EH-STATUS-WAITING",
    "1701": "EH-STATUS-sleeping",
    "1702": "EH-STATUS-not-called",
    "1703": "eh-status-waiting-pre-cond",
    "1704": "eh-status-chk-pre-cond-old",
    "1705": "eh-status-changing-log",
    "1709": "EH-STATUS-waiting-parallel",
    "1710": "eh-status-prepared",
    "1711": "eh-status-queued",
    "1712": "eh-status-waiting-cert-sync",
    "1799": "eh-status-dead",
    "1800": "EH-STATUS-ABENDED",
    "1801": "EH-STATUS-ABEND-SYNC",
    "1802": "EH-STATUS-JP-ABEND",
    "1810": "EH-status-vanished",
    "1815": "eh-status-lost",
    "1820": "EH-STATUS-FAULT",
    "1821": "EH-STATUS-FAULT-NOHOST",
    "1822": "EH-STATUS-FAULT-already-run",
    "1823": "EH-STATUS-FAULT-in-post-proc",
    "1824": "EH-STATUS-FAULT-in-post-cond",
    "1825": "EH-STATUS-FAULT-cust-backup",
    "1826": "EH-STATUS-FAULT-file-backup",
    "1827": "EH-STATUS-FAULT-cust-rollback",
    "1828": "EH-STATUS-FAULT-file-rollback",
    "1829": "EH-STATUS-FAULT-hostg-rollback",
    "1830": "EH-STATUS-FAULT-rollback",
    "1850": "EH-STATUS-cancel",
    "1851": "EH-STATUS-jp-cancel",
    "1852": "EH-STATUS-rejected",
    "1853": "EH-STATUS-queue-cancel",
    "1854": "EH-STATUS-container-cancel",
    "1856": "EH-STATUS-ended-eskaliert",
    "1860": "EOI-STATUS-notification-failed",
    "1870": "EH-STATUS-operation-failed",
    "1898": "EH-STATUS-blocking",
    "1899": "EH-status-unblocking",
    "1900": "EH-STATUS-ENDED",
    "1901": "EH-STATUS-quittiert",
    "1902": "EH-STATUS-queue-ended",
    "1903": "EH-STATUS-container-ended",
    "1904": "EH-STATUS-ended-rollbacked",
    "1905": "EH-STATUS-ended-jp-rollbacked",
    "1909": "eh-status-any-empty",
    "1910": "eh-status-jobempty",
    "1911": "eh-status-truncated",
    "1912": "EH-STATUS-ENDED-EMPTY",
    "1913": "eh-status-rollback-empty",
    "1919": "EH-status-inaktiv-ld",
    "1920": "EH-status-inaktiv",
    "1921": "EH-status-not-aktiv",
    "1922": "EH-status-inaktiv-manuell",
    "1923": "EH-status-deleted",
    "1924": "eh-status-unprocessed",
    "1925": "eh-status-inaktiv-objekt",
    "1926": "eh-status-unprocessed-if",
    "1930": "EH-STATUS-SKIPPED",
    "1931": "EH-STATUS-SKIPPED-SYNC",
    "1932": "eh-status-skipped-schedule",
    "1933": "eh-status-skipped-condition",
    "1940": "eh-status-timeout",
    "1941": "eh-status-timeout-schedule",
    "1942": "eh-status-timeout-gruppe",
    "1944": "eh-status-timeout-period",
    "1960": "EOI-STATUS-successful",
    "1970": "EH-STATUS-operation-successful",
    "1999": "eh-status-checked",
    "1934": "eh-status-skipped-manually",
}

@click.command()
@click.argument("status_code", default="1900")
@click.option("--show-all", "--all", "-a", is_flag=True, default=False,
              help="Show all the status codes")
def main(show_all, status_code):
    if show_all:
        for k, v in sorted(statuses.items()):
            print(f"{k} -> {v}")
        return

    print(f"{status_code} -> {statuses[status_code]}")


if __name__ == "__main__":
    main()


