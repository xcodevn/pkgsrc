# $NetBSD: buildlink3.mk,v 1.28 2012/02/06 12:39:56 wiz Exp $

BUILDLINK_TREE+=	pango

.if !defined(PANGO_BUILDLINK3_MK)
PANGO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.pango+=	pango>=1.6.0
BUILDLINK_ABI_DEPENDS.pango+=	pango>=1.29.4nb3
BUILDLINK_PKGSRCDIR.pango?=	../../devel/pango

.include "../../mk/bsd.fast.prefs.mk"

pkgbase := pango
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.pango:Mx11)
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.endif

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.endif # PANGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-pango
