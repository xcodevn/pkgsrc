# $NetBSD: Makefile,v 1.30 2010/01/17 12:02:45 wiz Exp $

DISTNAME=	zebedee-2.5.3
PKGREVISION=	4
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=zebedee/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.winton.org.uk/zebedee/
COMMENT=	Simple tunneling program for TCP or UDP with encryption

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake perl tclsh:run

MAKE_ENV+=		PERL5=${PERL5:Q}

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "Darwin"
MAKE_FLAGS+=		OS=macosx
.else
MAKE_FLAGS+=		OS=${LOWER_OPSYS:Q}
.endif

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Fixing tclsh paths.
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	ftpgw.tcl
SUBST_SED.paths=	-e 's,tclsh,${TCLSH},g'

.include "../../mk/pthread.buildlink3.mk"

.if defined(PTHREAD_TYPE) && ${PTHREAD_TYPE} != "none"
PTHREAD_CFLAGS+=  -DHAVE_PTHREADS
.endif

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
