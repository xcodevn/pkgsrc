# $NetBSD: buildlink3.mk,v 1.8 2004/11/16 21:48:38 tron Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
MYSQL_CLIENT_BUILDLINK3_MK:=	${MYSQL_CLIENT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	mysql-client
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmysql-client}
BUILDLINK_PACKAGES+=	mysql-client

.if !empty(MYSQL_CLIENT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.mysql-client+=	mysql-client>=4.1.7
BUILDLINK_RECOMMENDED.mysql-client+=	mysql-client>=4.1.9nb1
BUILDLINK_PKGSRCDIR.mysql-client?=	../../databases/mysql4-client
BUILDLINK_LIBDIRS.mysql-client?=	lib/mysql
.endif	# MYSQL_CLIENT_BUILDLINK3_MK

.include "../../security/openssl/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
