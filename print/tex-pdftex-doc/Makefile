# $NetBSD: Makefile,v 1.9 2011/03/03 23:13:20 minskim Exp $

DISTNAME=	pdftex.doc
PKGNAME=	tex-${DISTNAME:S/./-/}-1.40.11
PKGREVISION=	3
TEXLIVE_REV=	24563

MAINTAINER=	minskim@NetBSD.org
COMMENT=	Documentation for tex-pdftex

TEX_TEXMF_DIRS+=	${PREFIX}/share/texmf-dist

TEXLIVE_IGNORE_PATTERNS=	texmf/doc/man/man1/pdftex.1

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
