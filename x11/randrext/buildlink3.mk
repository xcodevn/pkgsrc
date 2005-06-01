# $NetBSD: buildlink3.mk,v 1.4 2005/03/05 18:16:21 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
RANDREXT_BUILDLINK3_MK:=	${RANDREXT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	randrext
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrandrext}
BUILDLINK_PACKAGES+=	randrext

.if !empty(RANDREXT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.randrext+=	randrext>=1.0
BUILDLINK_PKGSRCDIR.randrext?=	../../x11/randrext
BUILDLINK_DEPMETHOD.randrext?=	build
.endif	# RANDREXT_BUILDLINK3_MK

.include "../../x11/xextensions/buildlink3.mk"
.include "../../mk/x11.buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
