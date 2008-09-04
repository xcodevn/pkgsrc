# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LZMALIB_BUILDLINK3_MK:=	${LZMALIB_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	lzmalib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlzmalib}
BUILDLINK_PACKAGES+=	lzmalib
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}lzmalib

.if ${LZMALIB_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.lzmalib+=	lzmalib>=0.0.1
BUILDLINK_PKGSRCDIR.lzmalib?=	../../archivers/lzmalib
.endif	# LZMALIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
