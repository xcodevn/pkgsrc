# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 18:39:32 jlam Exp $

.if !defined(ZEPHYR_BUILDLINK2_MK)
ZEPHYR_BUILDLINK2_MK=	# defined

BUILDLINK_DEPENDS.zephyr?=	zephyr>=20010518
BUILDLINK_PKGSRCDIR.zephyr?=	../../net/zephyr-current

BUILDLINK_PACKAGES+=	zephyr
EVAL_PREFIX+=		BUILDLINK_PREFIX.zephyr=zephyr
BUILDLINK_PREFIX.zephyr_DEFAULT=	${LOCALBASE}

BUILDLINK_FILES.zephyr=		include/zephyr/*
BUILDLINK_FILES.zephyr+=	lib/libzephyr.*

BUILDLINK_TARGETS+=	zephyr-buildlink

zephyr-buildlink: _BUILDLINK_USE

.endif	# ZEPHYR_BUILDLINK2_MK
