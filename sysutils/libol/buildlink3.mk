# $NetBSD: buildlink3.mk,v 1.3 2004/10/03 00:18:16 tv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOL_BUILDLINK3_MK:=	${LIBOL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libol
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibol}
BUILDLINK_PACKAGES+=	libol

.if !empty(LIBOL_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libol+=	libol>=0.3.15
BUILDLINK_PKGSRCDIR.libol?=	../../sysutils/libol
.endif	# LIBOL_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
