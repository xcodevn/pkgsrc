# $NetBSD: Makefile,v 1.12 2011/03/17 21:11:44 zafer Exp $

DISTNAME=		cowsay-3.03
PKGREVISION=		1
CATEGORIES=		misc
MASTER_SITES=		# ftp://ftp.nog.net/pub/tony/cowsay/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.nog.net/~tony/warez/cowsay.shtml
COMMENT=		Configurable talking cow

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		perl:run

SUBST_CLASSES+=		pap
SUBST_STAGE.pap=	pre-install # after patch to avoid sneaking into patches
SUBST_MESSAGE.pap=	Adjusting paths to perl and the cows
SUBST_FILES.pap=	cowsay cowsay.1
SUBST_SED.pap=		-e "s|%BANGPERL%|!${PERL5}|" -e "s|%PREFIX%|${PREFIX}|"

NO_CONFIGURE=		yes
NO_BUILD=		yes

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 share/cows

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/cowsay ${DESTDIR}${PREFIX}/bin
	cd ${DESTDIR}${PREFIX}/bin; ${LN} -s cowsay cowthink
	${INSTALL_DATA} ${WRKSRC}/cowsay.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	cd ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1; ${LN} -s cowsay.1 cowthink.1
	${INSTALL_DATA} ${WRKSRC}/cows/*.cow ${DESTDIR}${PREFIX}/share/cows

.include "../../mk/bsd.pkg.mk"
