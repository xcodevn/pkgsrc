# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GOB2_BUILDLINK3_MK:=	${GOB2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gob2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngob2}
BUILDLINK_PACKAGES+=	gob2

.if !empty(GOB2_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gob2+=	gob2>=2.0.10
BUILDLINK_PKGSRCDIR.gob2?=	../../wip/gob2
.endif	# GOB2_BUILDLINK3_MK

#.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
