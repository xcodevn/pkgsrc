# $NetBSD: buildlink3.mk,v 1.1.1.1 2005/07/08 20:31:34 reed Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
POPPLER_BUILDLINK3_MK:=	${POPPLER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	poppler
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npoppler}
BUILDLINK_PACKAGES+=	poppler

.if !empty(POPPLER_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.poppler+=	poppler>=0.4.1
BUILDLINK_PKGSRCDIR.poppler?=	../../print/poppler
.endif	# POPPLER_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
