# $NetBSD: Makefile,v 1.2 2010/08/21 16:35:48 seb Exp $

DISTNAME=	Mac-AppleScript-0.04
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Mac/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Mac-AppleScript/
COMMENT=	Perl 5 module to execute applescript commands on OS X

PKG_DESTDIR_SUPPORT=	user-destdir

ONLY_FOR_PLATFORM=	Darwin-*-*

# lang/perl5/module.mk overrides MakeMaker's OTHERLDFLAGS in MAKE_ENV
# with LDFLAGS value. So we have to add here these switches from
# upstream's Makefile.PL's OTHERFLAGS
LDFLAGS+=	-framework AppleScriptKit -framework Carbon

PERL5_PACKLIST= auto/Mac/AppleScript/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
