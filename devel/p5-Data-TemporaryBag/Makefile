# $NetBSD: Makefile,v 1.10 2010/08/21 16:33:31 seb Exp $

DISTNAME=	Data-TemporaryBag-0.09
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Data/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Data-TemporaryBag/
COMMENT=	Handle long size data using temporary file

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/Data/TemporaryBag/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
