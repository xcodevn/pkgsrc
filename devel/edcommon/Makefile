# $NetBSD: Makefile,v 1.16 2009/04/17 23:00:48 rh Exp $
#

DISTNAME=	edcommon-32-s
PKGNAME=	${DISTNAME:S/-s$//}
PKGREVISION=	6
CATEGORIES=	devel gnustep
MASTER_SITES=	http://www.mulle-kybernetik.com/software/EDFrameworks/Downloads/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.mulle-kybernetik.com/software/EDFrameworks/
COMMENT=	Foundation and AppKit extensions
LICENSE=	edcommon-license

PKG_DESTDIR_SUPPORT=	destdir
USE_LANGUAGES=		objc
MAKE_JOBS_SAFE=		no
GNUSTEP_OBSOLETE_ENV=	GNUSTEP_SYSTEM_ROOT

WRKSRC=		${WRKDIR}/ed/EDCommon

MAKE_ENV+=	ADDITIONAL_OBJCFLAGS="-Wno-import -I${WRKSRC}/.."

.include "../../x11/gnustep-back/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../devel/gnustep-make/gnustep.mk"

do-configure:
	${LN} -s ${WRKSRC}/*/*.h ${WRKSRC}

.include "../../mk/bsd.pkg.mk"
