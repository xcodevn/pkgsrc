# $NetBSD: Makefile,v 1.7 2006/03/04 21:29:54 jlam Exp $
#

DISTNAME=		tcl8.4.6-src
PKGNAME=		libtcl-nothread-8.4.6
PKGREVISION=		1
CATEGORIES=		lang
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=tcl/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.tcl.tk/
COMMENT=		TCL library for embedding

DEPENDS+=		tcl>=8.4.6nb5:../../lang/tcl

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=			${WRKDIR}/${DISTNAME:C/-src//}/unix
GNU_CONFIGURE=		yes
MAKE_ENV+=		TOUCH=${TOUCH:Q}
MAKE_ENV+=		NOTHREAD_SUFX=-nothread

USE_LIBTOOL=		yes

TCLLIB=			libtcl84-nothread.la
BUILD_TARGET=		${TCLLIB}

# Add ${VIEWBASE}/lib/tcl to the list of locations for Tcl packages.
CONFIGURE_ENV+=		TCL_PACKAGE_PATH="${VIEWBASE}/lib/tcl"

.include "../../mk/bsd.prefs.mk"

# NetBSD-1.5.x-m68k platforms apparently have a compiler optimization bug
# tickled by the Tcl code that manifests in code generation problems.
#
.if (${MACHINE_PLATFORM:MNetBSD-1.5*-m68k} != "")
CONFIGURE_ENV+=		COMPILER_OPTIMIZATION_BUG=YES
.endif

INSTALLATION_DIRS=	lib

post-configure:
	${SED} 's|tcl84|tcl84-nothread|g' <${WRKSRC}/tclConfig.sh \
		>${WRKSRC}/tclConfig-nothread.sh

do-install:
	cd ${WRKSRC} && \
	${LIBTOOL} --mode=install ${INSTALL_DATA} ${TCLLIB} \
		${DESTDIR}${PREFIX}/lib; \
	${INSTALL_DATA} tclConfig-nothread.sh ${DESTDIR}${PREFIX}/lib

.include "../../mk/bsd.pkg.mk"
