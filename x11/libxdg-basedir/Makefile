# $NetBSD: Makefile,v 1.2 2010/12/02 15:33:16 wiz Exp $
#

DISTNAME=	libxdg-basedir-1.1.1
PKGREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://n.ethz.ch/student/nevillm/download/libxdg-basedir/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://n.ethz.ch/student/nevillm/download/libxdg-basedir/
COMMENT=	XDG Base Directory library
LICENSE=	mit

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	pkgconfig/libxdg-basedir.pc.in

SUBST_CLASSES+=		pkglayout
SUBST_STAGE.pkglayout=	pre-configure
SUBST_FILES.pkglayout=	src/basedir.c
SUBST_SED.pkglayout=	-e 's|DIR_SEPARATOR_STR "etc"|"${PKG_SYSCONFDIR}"|g'
SUBST_SED.pkglayout+=	-e 's|DIR_SEPARATOR_STR "usr" DIR_SEPARATOR_STR "local"|"${PREFIX}"|g'
SUBST_SED.pkglayout+=	-e '/DefaultDataDirectories1\[\]/,/DefaultRelativeCacheHome\[\]/ s|/|" DIR_SEPARATOR_STR "|g'
SUBST_SED.pkglayout+=	-e '/DefaultDataDirectories1\[\]/,/DefaultRelativeCacheHome\[\]/ s|""||g'

SUBST_CLASSES+=		testsdir
SUBST_STAGE.testsdir=	post-build
SUBST_FILES.testsdir=	tests/*
SUBST_SED.testsdir=	-e 's|/etc/xdg|${PKG_SYSCONFDIR}/xdg|g'
SUBST_SED.testsdir+=	-e 's|/usr/local/share|${PREFIX}/share|g'

TEST_TARGET=	check

.include "../../mk/bsd.pkg.mk"
