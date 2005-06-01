# $NetBSD: buildlink3.mk,v 1.32 2004/10/03 00:18:28 tv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
XRENDER_BUILDLINK3_MK:=	${XRENDER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	Xrender
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NXrender}
BUILDLINK_PACKAGES+=	Xrender

.if !empty(XRENDER_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.Xrender+=	Xrender>=0.2
BUILDLINK_RECOMMENDED.Xrender+=	Xrender>=0.8.4nb1
BUILDLINK_PKGSRCDIR.Xrender?=	../../x11/Xrender
.endif	# XRENDER_BUILDLINK3_MK

.include "../../x11/render/buildlink3.mk"

BUILDLINK_DEPTH:=       ${BUILDLINK_DEPTH:S/+$//}
