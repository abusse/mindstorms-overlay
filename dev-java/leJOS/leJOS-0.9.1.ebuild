# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
JAVA_PKG_IUSE="examples doc source"

inherit java-pkg-2 java-ant-2 eutils

DESCRIPTION="TODO"
HOMEPAGE="http://www.lejos.org"
SRC_URI="mirror://sourceforge/ev3.lejos.p/leJOS_EV3_${PV}-beta_source.tar.gz"


SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

CDEPEND="
	dev-java/jna:0
	dev-java/dbus-java:0
"
DEPEND="${CDEPEND}
	>=virtual/jdk-1.6"
RDEPEND="${CDEPEND}
	>=virtual/jre-1.6"

JAVA_ANT_REWRITE_CLASSPATH="yes"

EANT_GENTOO_CLASSPATH="
	jna
	dbus-java
"

src_unpack() {
    if [ "${A}" != "" ]; then
        unpack ${A}
    fi
	
	mv leJOS_EV3_${PV}-beta_source ${S}
	
	sed -i \
		-e 's/<classpath refid="libraries.path"\/>//g' \
		"${S}"/ev3classes/build.xml || die "sed failed"
		
	if ! java-pkg_is-vm-version-ge "1.8" ; then
		sed -i \
			-e 's/<arg value="-Xdoclint:none"\/>//g' \
			"${S}"/ev3classes/build.xml || die "sed failed"
	fi
}

src_compile () {
	cd "${S}"/ev3classes
	eant jar
	
	use doc && eant docs
}

src_install() {
	java-pkg_dojar "${S}"/ev3classes/ev3classes.jar

	use doc && java-pkg_dojavadoc "${S}"/ev3classes/docs
	use source && java-pkg_dosrc "${S}"/ev3classes/src/*
	use examples && java-pkg_doexamples "${S}"/ev3samples/src
}