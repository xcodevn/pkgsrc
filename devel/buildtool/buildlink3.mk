# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BUILDTOOL_BUILDLINK3_MK:=	${BUILDTOOL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	buildtool
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nbuildtool}
BUILDLINK_PACKAGES+=	buildtool

.if !empty(BUILDTOOL_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.buildtool+=	buildtool>=0.15
BUILDLINK_PKGSRCDIR.buildtool?=	../../devel/buildtool
BUILDLINK_DEPMETHOD.buildtool?=	build

BUILDTOOL=		${BUILDLINK_PREFIX.buildtool}/bin/buildtool

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	${BUILDTOOL} config
CONFIGURE_ENV+=		BT_FLAGS_CC="${CFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_CPP="${CPPFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_CXX="${CXXFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_LD="${LDFLAGS}"
CONFIGURE_ENV+=		BT_PROG_AWK="${AWK}"
CONFIGURE_ENV+=		BT_PROG_CC="${CC}"
CONFIGURE_ENV+=		BT_PROG_CXX="${CXX}"
CONFIGURE_ENV+=		BT_PROG_LD="${LD}"
CONFIGURE_ENV+=		BT_PROG_M4="${M4}"
CONFIGURE_ARGS+=	--prefix=${PREFIX}

.if !target(do-build)
do-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BUILDTOOL} build
.endif

.if !target(do-install)
do-install:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BUILDTOOL} install
.endif

.endif	# BUILDTOOL_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
