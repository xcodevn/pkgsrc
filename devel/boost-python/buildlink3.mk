# $NetBSD: buildlink3.mk,v 1.2 2005/01/24 20:12:09 recht Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BOOST_PYTHON_BUILDLINK3_MK:=	${BOOST_PYTHON_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	boost-python
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nboost-python}
BUILDLINK_PACKAGES+=	boost-python

.if !empty(BOOST_PYTHON_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.boost-python+=	boost-python-1.32.*
BUILDLINK_PKGSRCDIR.boost-python?=	../../devel/boost-python

.include "../../devel/boost-headers/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
