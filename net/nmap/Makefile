# $NetBSD: Makefile,v 1.88 2012/03/08 11:43:47 wiz Exp $

DISTNAME=	nmap-5.51.6
PKGREVISION=	3
CATEGORIES=	net security
MASTER_SITES=	http://nmap.org/dist/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pettai@NetBSD.org
HOMEPAGE=	http://insecure.org/nmap/
COMMENT=	Network/port scanner with OS detection
LICENSE=	gnu-gpl-v2

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

BUILDLINK_API_DEPENDS.libpcap+=	libpcap>=1.0.0
BUILDLINK_API_DEPENDS.libpcre+=	libpcre>=7.6
BUILDLINK_API_DEPENDS.openssl+=	openssl>=0.9.8

GNU_CONFIGURE=		yes

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake
PLIST_SRC=		${WRKDIR}/.PLIST_SRC

BUILD_DEFS+=		IPV6_READY

.include "options.mk"

CHECK_INTERPRETER_SKIP=	bin/uninstall_zenmap
CHECK_INTERPRETER_SKIP+=	share/zenmap/su-to-zenmap.sh
CHECK_INTERPRETER_SKIP+=	share/nmap/nselib/data/oracle-sids
CHECK_INTERPRETER_SKIP+=	share/nmap/nselib/data/passwords.lst

CONFIGURE_ARGS+=	--with-libpcap=${BUILDLINK_PREFIX.libpcap}
CONFIGURE_ARGS+=	--with-libpcre=${BUILDLINK_PREFIX.pcre}
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "SunOS" || ${OPSYS} == "Linux"
MAKE_ENV+=	CPPFLAGS=""
.endif

# The SunPro C++ compiler does not understand __FUNCTION__, as well as
# __func__. So __FILE__ is the nearest replacement.
.include "../../mk/compiler.mk"
.if !empty(PKGSRC_COMPILER:Msunpro)
CFLAGS.SunOS+=	-D__FUNCTION__=__FILE__
.endif

.if empty(PKGSRC_COMPILER:Mgcc)
# The Makefile uses a hard-coded option -MM to get the dependencies, which
# is only understood by the GNU compiler. For a normal build the dependen-
# cies are not needed anyway, only when patching files and fixing bugs.
pre-build:
	${ECHO} "# ignored" > ${WRKSRC}/makefile.dep
.endif

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	post-patch
SUBST_FILES.paths=	ndiff/setup.py
SUBST_SED.paths=	-e "s|@@PKGMANDIR@@|${PKGMANDIR}|g"
SUBST_MESSAGE.paths=	Fixing paths.

post-build:
	${CP} ${PKGDIR}/PLIST ${WRKDIR}/.PLIST_SRC

.include "../../devel/pcre/buildlink3.mk"
.include "../../net/libpcap/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
