# $NetBSD: Makefile,v 1.16 2011/01/23 07:55:14 markd Exp $

DISTNAME=	kdeplasma-addons-${_KDE_VERSION}
PKGNAME=	${DISTNAME:S/-4/4-4/}
CATEGORIES=	misc
COMMENT=	Plasmoids

.include "../../meta-pkgs/kde4/Makefile.kde4"

MAKE_JOBS_SAFE=	no

# BUILD_MAKE_FLAGS+= VERBOSE=1

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libkexiv2/buildlink3.mk"
BUILDLINK_API_DEPENDS.eigen2+=	eigen2>=2.0.3
.include "../../math/eigen2/buildlink3.mk"
.include "../../misc/attica/buildlink3.mk"
.include "../../misc/marble/buildlink3.mk"
.include "../../misc/kdepimlibs4/buildlink3.mk"
.include "../../security/qca2/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../x11/kde-runtime4/buildlink3.mk"
.include "../../x11/kde-workspace4/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
