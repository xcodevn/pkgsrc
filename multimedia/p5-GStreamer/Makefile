# $NetBSD: Makefile,v 1.9 2012/02/06 12:41:06 wiz Exp $
#

DISTNAME=	GStreamer-0.16
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	multimedia perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=GStreamer/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/GStreamer/
COMMENT=	Perl interface to the GStreamer library
LICENSE=	gnu-lgpl-v2.1

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-ExtUtils-Depends>=0.205:../../devel/p5-ExtUtils-Depends
DEPENDS+=	p5-ExtUtils-PkgConfig>=1.07:../../devel/p5-ExtUtils-PkgConfig

MAKE_JOBS_SAFE=	no

USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c

PERL5_PACKLIST=	auto/GStreamer/.packlist

BUILDLINK_API_DEPENDS.p5-glib2+=	p5-glib2>=1.180
.include "../../devel/p5-glib2/buildlink3.mk"
.include "../../multimedia/gstreamer0.10/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
