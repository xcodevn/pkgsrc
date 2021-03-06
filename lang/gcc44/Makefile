# $NetBSD: Makefile,v 1.30 2012/02/24 17:35:13 wiz Exp $

DISTNAME=		gcc-${GCC_VERSION}
PKGNAME=		gcc44-${GCC_VERSION}
CATEGORIES=		lang
MASTER_SITES=		${MASTER_SITE_GNU:=gcc/gcc-${GCC_VERSION}/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		sbd@NetBSD.org
HOMEPAGE=		http://gcc.gnu.org/
COMMENT=		GNU Compiler Collection 4.4
LICENSE=		gnu-gpl-v2 AND gnu-gpl-v3 AND gnu-lgpl-v2 AND gnu-lgpl-v3

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		awk:run bash:run chmod gmake:run makeinfo sed:run

GCC_VERSION=		4.4.7

GCC_SUBPREFIX=		gcc44
GCC_PREFIX=		${PREFIX}/${GCC_SUBPREFIX}
FILES_SUBST+=		PKGNAME=${PKGNAME}
GCC_SYMLINK_PROGRAMS=	cpp g++ gcc gccbug gcov gfortran

# To avoid GNU surprises
CONFIG_SHELL=		${TOOLS_PATH.bash}

NOT_FOR_PLATFORM=	Interix-*-* DragonFly-*-*
UNLIMIT_RESOURCES+=	datasize
UNLIMIT_RESOURCES+=	stacksize

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

# Determine whether to use binutils
.if ${OPSYS} == "Minix"
DEPENDS+=	binutils>=2.17nb3:../../devel/binutils

BINUTILS_PREFIX_CMD= ${PKG_INFO} -Q BINUTILS_PROGRAM_PREFIX binutils 2>/dev/null \
		|| { cd ${.CURDIR}/../../devel/binutils \
		&& ${MAKE} ${MAKEFLAGS} show-var VARNAME=BINUTILS_PROGRAM_PREFIX; }
BINUTILS_PREFIX= ${:!${BINUTILS_PREFIX_CMD}!}
CONFIGURE_ARGS+=	--with-as=${LOCALBASE}/bin/${BINUTILS_PREFIX}as
CONFIGURE_ARGS+=	--with-ld=${LOCALBASE}/bin/${BINUTILS_PREFIX}ld
CONFIGURE_ARGS+=	--host=i386-pc-minix --target=i386-pc-minix --build=i386-pc-minix 
CONFIGURE_ARGS+=	--disable-visibility 
.endif

.if ${OPSYS} == "SunOS"
CONFIGURE_ENV+=		OBJDUMP=/usr/sfw/bin/gobjdump
CONFIGURE_ARGS+=	--without-gnu-ld --with-ld=/usr/ccs/bin/ld
. if !exists(/usr/sfw/bin/gas)
CONFIGURE_ARGS+=	--without-gnu-as --with-as=/usr/ccs/bin/as
. else
CONFIGURE_ARGS+=	--with-gnu-as --with-as=/usr/sfw/bin/gas
.endif
.endif

# REPLACE_AWK+=	gcc/testsuite/gcc.test-framework/test-framework.awk	\
# 		gcc/mkmap-symver.awk					\
# 		gcc/optc-gen.awk					\
# 		gcc/mkmap-flat.awk					\
# 		gcc/opt-gather.awk					\
# 		gcc/opth-gen.awk					\
# 		gcc/opt-functions.awk

REPLACE_BASH+= contrib/dg-cmp-results.sh
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-patchlist
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-update
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-update-fix
REPLACE_BASH+= contrib/reghunt/bin/reg-hunt
REPLACE_BASH+= contrib/reghunt/bin/reg-test
REPLACE_BASH+= contrib/reghunt/date_based/reg_periodic
REPLACE_BASH+= contrib/reghunt/date_based/reg_search
REPLACE_BASH+= gcc/dbgcnt.def
REPLACE_BASH+= gcc/testsuite/gcc.test-framework/gen_directive_tests
REPLACE_BASH+= libstdc++-v3/scripts/run_doxygen

# Optional languages - change as required
# Ada could be added although there is a bootstrapping issue.  See
# ../gcc34-ada for guidance
BUILD_DEFS+=		BUILD_CXX BUILD_FORTRAN BUILD_JAVA BUILD_OBJC
BUILD_CXX?=		YES
.if ${OPSYS} == "Minix"
BUILD_JAVA?=		NO
BUILD_OBJC?=		NO
.else
BUILD_JAVA?=		YES
BUILD_OBJC?=		YES
.endif
BUILD_FORTRAN?=		YES

LANGS= c

#.if !empty(BUILD_CXX:M[aA][dD][aA])
#LANGS+= ada
#.endif

.if !empty(BUILD_CXX:M[Yy][Ee][Ss])
LANGS+= c++
.endif

.if !empty(BUILD_FORTRAN:M[Yy][Ee][Ss])
LANGS+= fortran
.endif

.if !empty(BUILD_JAVA:M[Yy][Ee][Ss])
LANGS+= java
.endif

.if !empty(BUILD_OBJC:M[Yy][Ee][Ss])
LANGS+= objc
.endif

.if ${OPSYS} != "Minix"
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-threads=posix
.endif
CONFIGURE_ARGS+=	--enable-__cxa_atexit
CONFIGURE_ARGS+=	--prefix=${GCC_PREFIX:Q}
CONFIGURE_ARGS+=	--enable-languages=${LANGS:Q}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-long-long
CONFIGURE_ARGS+=	--with-local-prefix=${GCC_PREFIX:Q}
CONFIGURE_ARGS+=	--disable-libssp
CONFIGURE_ARGS+=	--with-gmp=${BUILDLINK_PREFIX.gmp}
CONFIGURE_ARGS+=	--with-mpfr=${BUILDLINK_PREFIX.mpfr}

CONFIGURE_ENV+=		CONFIG_SHELL=${CONFIG_SHELL}

MAKE_ENV+=		ICONVPREFIX=${BUILDLINK_PREFIX.iconv}
MAKE_ENV+=		SHELL=${CONFIG_SHELL}
MAKE_ENV+=		ac_cv_path_ac_cv_prog_chmod=${TOOLS_CHMOD}

# ${WRKSRC}/fixincludes/ looks for sed and compiles the path to sed into
# a binary so we need to make sure we give it the installed sed and not
# the tool wrapped one.
MAKE_ENV+=		lt_cv_path_SED=${TOOLS_SED}

CPPFLAGS+=		-I${BUILDLINK_DIR}/include
CFLAGS+=		-I${BUILDLINK_DIR}/include

# Somone should fix this so it will match the NetBSD system compiler
#.if ${OPSYS} == "NetBSD"
#GCC_PLATFORM=	${LOWER_ARCH}--${LOWER_OPSYS}${APPEND_ELF}
#CONFIGURE_ARGS+=	--host=${GCC_PLATFORM:Q}
#MAKE_ENV+=		AR=/usr/bin/ar
#.endif # NetBSD

LIBS.SunOS+=		-lgmp

pre-configure:
.if ${OPSYS} == "Minix"
	${CP} ${FILESDIR}/minix.h ${WRKSRC}/gcc/config/
	${CP} ${FILESDIR}/minix-spec.h ${WRKSRC}/gcc/config/
	${CP} ${FILESDIR}/i386-minix.h ${WRKSRC}/gcc/config/i386/minix.h
	${CP} ${FILESDIR}/gcov-minix-fs-wrapper.h ${WRKSRC}/gcc/
.endif


do-configure:
	${MKDIR} ${WRKDIR}/obj
	cd ${WRKDIR}/obj; ${SETENV} ${CONFIGURE_ENV} ${CONFIG_SHELL} ${WRKSRC}/configure ${CONFIGURE_ARGS}

do-build:
	(cd ${WRKDIR}/obj && ${SETENV} ${MAKE_ENV} ${GMAKE} -j${MAKE_JOBS:U1:Q})

do-test:
#.if (${MACHINE_GNU_ARCH} == "x86_64")
#	(cd ${FILESDIR} && ${CP} netbsd64macro.dfs ${WRKSRC}/gcc/testsuite/ada/acats/support/macro.dfs)
#.endif
	(cd ${WRKDIR}/obj && ${GMAKE} -k check)

do-install:
	(cd ${WRKDIR}/obj && ${SETENV} ${MAKE_ENV} ${GMAKE} install DESTDIR=${DESTDIR} \
	 && ${TEST} -f ${DESTDIR}${GCC_PREFIX}/bin/cc || ${LN} -f ${DESTDIR}${GCC_PREFIX}/bin/gcc ${DESTDIR}${GCC_PREFIX}/bin/cc)

post-install:
	${MKDIR} -p ${DESTDIR}${PREFIX}/bin
.for X in ${GCC_SYMLINK_PROGRAMS}
	${LN} -s ${GCC_PREFIX}/bin/${X} ${DESTDIR}${PREFIX}/bin/${X}
.endfor


GENERATE_PLIST_SYMLINKS=	for x in ${GCC_SYMLINK_PROGRAMS}; do ${ECHO} bin/$$x; done 
GENERATE_PLIST+= { ${GENERATE_PLIST_SYMLINKS};                                                       \
	cd ${DESTDIR}${PREFIX} && ${FIND} ${GCC_SUBPREFIX} \( -type f -o -type l \) -print; } | ${SORT} ;

.include "../../devel/gmp/buildlink3.mk"
.include "../../math/mpfr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
