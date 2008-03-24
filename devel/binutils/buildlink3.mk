# $NetBSD: buildlink3.mk,v 1.21 2008/03/24 19:53:01 tnn Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BINUTILS_BUILDLINK3_MK:=	${BINUTILS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	binutils
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nbinutils}
BUILDLINK_PACKAGES+=	binutils
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}binutils

.if ${BINUTILS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.binutils+=	binutils>=2.17
BUILDLINK_PKGSRCDIR.binutils?=	../../devel/binutils
BUILDLINK_DEPMETHOD.binutils?=	build
.endif	# BINUTILS_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
