# $NetBSD: buildlink3.mk,v 1.14 2012/02/06 12:41:29 wiz Exp $
#

BUILDLINK_TREE+=	qca2

.if !defined(QCA2_BUILDLINK3_MK)
QCA2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qca2+=	qca2>=2.0.0
BUILDLINK_ABI_DEPENDS.qca2?=	qca2>=2.0.3nb6
BUILDLINK_PKGSRCDIR.qca2?=	../../security/qca2

.include "../../x11/qt4-libs/buildlink3.mk"
.include "../../x11/qt4-tools/buildlink3.mk"
.endif # QCA2_BUILDLINK3_MK

BUILDLINK_TREE+=	-qca2
