# $NetBSD: Makefile,v 1.113 2012/02/22 11:10:17 drochner Exp $

DISTNAME=	libxml2-2.7.8
PKGREVISION=	8
CATEGORIES=	textproc
MASTER_SITES=	ftp://xmlsoft.org/libxml2/ \
		http://xmlsoft.org/sources/
#MASTER_SITES=	${MASTER_SITE_GNOME:=sources/libxml2/2.7/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://xmlsoft.org/
COMMENT=	XML parser library from the GNOME project
LICENSE=	modified-bsd

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake
USE_FEATURES=		glob
USE_LIBTOOL=		yes
PKGCONFIG_OVERRIDE=	libxml-2.0.pc.in

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-iconv=${BUILDLINK_PREFIX.iconv}
CONFIGURE_ARGS+=	--with-html-subdir=libxml2
CONFIGURE_ARGS+=	--without-python

.include "options.mk"

# allow thread-awareness, but make sure the library is not
# linked against libpthread
#CONFIGURE_ARGS+=	--without-threads

MAKE_ENV+=	PAX=${PAX:Q}

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Minix"
CONFIGURE_ENV+=	ac_cv_header_sys_mman_h=no
.endif

TEST_TARGET=	check

SUBST_CLASSES+=		cat
SUBST_STAGE.cat=	pre-configure
SUBST_FILES.cat=	catalog.c xmlcatalog.c
SUBST_SED.cat=	-e "s,@@SGML_DEFAULT_CATALOG@@,${SGML_DEFAULT_CATALOG},g"
SUBST_SED.cat+=	-e "s,@@XML_DEFAULT_CATALOG@@,${XML_DEFAULT_CATALOG},g"

# XXX make sure the library is not linked against libpthread
post-install:
	test -z "`ldd ${DESTDIR}${PREFIX}/lib/libxml2.so | grep pthread`"

.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../textproc/xmlcatmgr/catalogs.mk"

.include "../../mk/bsd.pkg.mk"
