#!/usr/bin/env python3

from typing import List, Optional
import click
from termcolor_util import cyan, yellow

DEFAULT_SEARCH_PLATFORM="<all>"


class BuildPlatform:
    def __init__(self, name: str, description: str) -> None:
        self.name = name
        self.description = description


class BuildCategory:
    def __init__(self, name: str, description: str) -> None:
        self.name = name
        self.description = description
        self.platforms: List[BuildPlatform] = []

    def add(self, name: str, description: str) -> 'BuildCategory':
        self.platforms.append(BuildPlatform(name, description))
        return self


@click.command()
@click.argument("searched_platforms", nargs=-1)
def main(searched_platforms: List[str]) -> None:
    build_categories: List[BuildCategory] = []
    fill_build_categories(build_categories)

    build_categories = filter_build_categories(build_categories, searched_platforms)
    print_found_results(build_categories)


def fill_build_categories(build_categories: List[BuildCategory]):
    build_categories.append(
        BuildCategory("B2.", "BS2000")
            .add("B24", "SNI, BS2000 Sockets Version 1.3")
            .add("B25", "SNI, BS2000 Sockets Version 2.1")
            .add("B26", "SNI, BS2000 Sockets Version 2.3")
    )
    build_categories.append(
        BuildCategory("MP.", "MPE")
            .add("MP6", "HP 3000, MPE ab Version 6.5")
    )
    build_categories.append(
        BuildCategory("N..", "NSK")
            .add("NS1", "Tandem NSK")
            .add("NI6", "Tandem NSK (Itanium)")
    )
    build_categories.append(
        BuildCategory("OAX", "Oracle Applications")
            .add("OAX", "Oracle Applications")
    )
    build_categories.append(
        BuildCategory("M..", "z/OS")
            .add("M25", "IBM, z/OS from Version V2R5")
    )
    build_categories.append(
        BuildCategory("O..", "OS/400")
            .add("O41", "IBM, OS/400 from Version V4R1M0")
    )
    build_categories.append(
        BuildCategory("PSX", "PeopleSoft")
            .add("PSX", "PeopleSoft")
    )
    build_categories.append(
        BuildCategory("R3X", "SAP")
            .add("R3X", "SAP")
    )
    build_categories.append(
        BuildCategory("SLX", "Siebel")
            .add("SLX", "Siebel")
    )
    build_categories.append(
        BuildCategory("D..", "UNIX - DEC OSF")
            .add("DA4", "Alpha - DEC-OSF/1 - Digital UNIX - Tru64")
    )
    build_categories.append(
        BuildCategory("H..", "UNIX - HP-UX")
            .add("HP1", "HP-Workstation (9000), HP-UX")
            .add("HI6", "rx2600-Rechner mit Itanium, HP-UX")
    )
    build_categories.append(
        BuildCategory("A..", "UNIX - IBM AIX")
            .add("A64", "Power-PC64, AIX")
            .add("AP6", "Power-PC, AIX")
    )
    build_categories.append(
        BuildCategory("L..", "UNIX - Linux")
            .add("LI3", "Intel, Linux")
            .add("LI6", "Itanium, Linux")
            .add("LX6", "Linux (x64)")
            .add("LZ3", "zSeries, zLinux")
            .add("LZ6", "zSeries, zLinux 64-bit")
    )
    build_categories.append(
        BuildCategory("C..", "UNIX - SCO")
            .add("CI5", "Intel, SCO-UNIX ODT")
            .add("CI7", "Intel, SCO Unixware")
    )
    build_categories.append(
        BuildCategory("U..", "UNIX - Sun OS (Solaris)")
            .add("U64", "Sparc64, Solaris")
            .add("US8", "Sparc, Solaris")
            .add("UI8", "Intel, Solaris")
            .add("SI6", "Intel 64-Bit (x64), Solaris")
    )
    build_categories.append(
        BuildCategory("V..", "VMS")
            .add("VA7", "Alpha, OpenVMS-Alpha")
            .add("VI8", "OpenVMS (IA64)")
            .add("VV7", "VAX, VAX/VMS")
    )
    build_categories.append(
        BuildCategory("W..", "Windows")
            .add("WI3", "32-Bit Plattformen (x86)")
            .add("WI6", "64-Bit Plattformen (IA64)")
            .add("WX6", "64-Bit Plattformen (x64)")
    )



def filter_build_categories(build_categories: List[BuildCategory], searched_platforms: List[str]) -> List[BuildCategory]:
    if not searched_platforms:
        return build_categories

    result: List[BuildCategory] = []
    result_category: Optional[BuildCategory] = None
    searched_platforms_upper = [p.upper() for p in searched_platforms]

    for category in build_categories:
        result_category = None

        for platform in category.platforms:
            if platform.name.upper() not in searched_platforms_upper:
                continue

            if not result_category:
                result_category = BuildCategory(category.name, category.description)
                result.append(result_category)

            result_category.platforms.append(platform)

    return result



def print_found_results(build_categories: List[BuildCategory]) -> None:
    for category in build_categories:
        print(cyan(category.name), cyan(category.description, bold=True))
        for platform in category.platforms:
            print("   ", yellow(platform.name, bold=True), yellow(platform.description))


if __name__ == "__main__":
    main()

