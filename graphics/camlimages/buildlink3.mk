# $NetBSD$
# XXX	BUILDLINK_DEPMETHOD.camlimages?=	build

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CAMLIMAGES_BUILDLINK3_MK:=	${CAMLIMAGES_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	camlimages
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncamlimages}
BUILDLINK_PACKAGES+=	camlimages

.if !empty(CAMLIMAGES_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.camlimages+=	camlimages>=2.11
BUILDLINK_PKGSRCDIR.camlimages?=	../../graphics/camlimages
.endif	# CAMLIMAGES_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
