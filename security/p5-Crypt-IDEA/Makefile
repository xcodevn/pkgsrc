# $NetBSD: Makefile,v 1.17 2010/08/21 16:35:39 seb Exp $
#

DISTNAME=		Crypt-IDEA-1.08
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		3
CATEGORIES=		security perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Crypt/}

MAINTAINER=		heinz@NetBSD.org
HOMEPAGE=		http://search.cpan.org/dist/Crypt-IDEA/
COMMENT=		Perl5 module for the IDEA symmetric key algorithm
LICENSE=		idea-license

PKG_DESTDIR_SUPPORT=	user-destdir
PKG_INSTALLATION_TYPES= overwrite pkgviews

USE_LANGUAGES=		c
PERL5_PACKLIST=		auto/Crypt/IDEA/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
