# $NetBSD: Makefile,v 1.2 2012/02/06 12:41:09 wiz Exp $

PKGNAME=		${DISTNAME:C:t:T:C:-:-gui-:}

USE_LANGUAGES+=		c c++
MAKE_ENV+=		QTDIR=${QTDIR}
INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}${PREFIX}

CONFIGURE_ARGS+=	--disable-cli --disable-daemon

.include "../../net/Transmission/Makefile.common"

PKGREVISION=		2

post-build:
	cd ${WRKSRC}/qt && ${SETENV} ${MAKE_ENV} ${QTDIR}/bin/qmake qtr.pro
	cd ${WRKSRC}/gtk && ${SETENV} ${MAKE_ENV} make
	cd ${WRKSRC}/qt && ${SETENV} ${MAKE_ENV} make
	cd ${WRKSRC}/po && ${SETENV} ${MAKE_ENV} make

do-install:
	cd ${WRKSRC}/qt && ${SETENV} ${INSTALL_ENV} make install
	cd ${WRKSRC}/gtk && ${SETENV} ${INSTALL_ENV} make install
	cd ${WRKSRC}/po && ${SETENV} ${INSTALL_ENV} make install

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../sysutils/libnotify/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/qt4-qdbus/buildlink3.mk"
.include "../../x11/qt4-tools/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
