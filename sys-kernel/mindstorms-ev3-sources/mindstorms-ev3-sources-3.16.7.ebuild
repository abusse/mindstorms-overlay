# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5

ETYPE=sources
K_DEFCONFIG="ev3dev_defconfig"
K_SECURITY_UNSUPPORTED=1
UNIPATCH_LIST="${DISTDIR}/${PF}.xz ${DISTDIR}/lego-linux-drivers-${PV}.xz"
UNIPATCH_STRICTORDER="yes"
CKV="${PV}"
inherit kernel-2
detect_version
detect_arch

GITHUB_SRC_PREFIX="https://github.com/abusse/mindstorms-overlay/raw/master/distfiles/"

DESCRIPTION="Mindstorms EV3 kernel sources"
HOMEPAGE="https://github.com/ev3dev"
SRC_URI="${KERNEL_URI} ${GITHUB_SRC_PREFIX}/${PF}.xz ${GITHUB_SRC_PREFIX}/lego-linux-drivers-${PV}.xz"

KEYWORDS="~arm"
