# $NetBSD$
BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GUILE_CAIRO_BUILDLINK3_MK:=	${GUILE_CAIRO_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	guile-cairo
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nguile-cairo}
BUILDLINK_PACKAGES+=	guile-cairo
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}guile-cairo

.if ${GUILE_CAIRO_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.guile-cairo+=	guile-cairo>=1.4.0
BUILDLINK_PKGSRCDIR.guile-cairo?=	../../graphics/guile-cairo
.endif	# GUILE_CAIRO_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
