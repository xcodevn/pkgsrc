# $NetBSD: buildlink3.mk,v 1.12 2009/03/20 19:25:05 joerg Exp $

BUILDLINK_TREE+=	smpeg

.if !defined(SMPEG_BUILDLINK3_MK)
SMPEG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.smpeg+=	smpeg>=0.4.4nb3
BUILDLINK_ABI_DEPENDS.smpeg+=	smpeg>=0.4.4nb15
BUILDLINK_PKGSRCDIR.smpeg?=	../../multimedia/smpeg

.include "../../devel/SDL/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.endif # SMPEG_BUILDLINK3_MK

BUILDLINK_TREE+=	-smpeg
