# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
TCL_TCLX_BUILDLINK3_MK:=	${TCL_TCLX_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tcl-tclX
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntcl-tclX}
BUILDLINK_PACKAGES+=	tcl-tclX

.if !empty(TCL_TCLX_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.tcl-tclX+=	tcl-tclX>=8.3.5
BUILDLINK_PKGSRCDIR.tcl-tclX?=	../../lang/tcl-tclX
.endif	# TCL_TCLX_BUILDLINK3_MK

.include "../../lang/tcl/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
