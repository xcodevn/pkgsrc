# $NetBSD: builtin.mk,v 1.6 2004/09/30 15:07:46 tron Exp $

BUILTIN_PKG:=	bind

BUILTIN_FIND_LIBS:=	bind

.include "../../mk/buildlink3/bsd.builtin.mk"

.if !defined(BUILTIN_VERSION.bind)
.  if exists(/usr/sbin/named)
BUILTIN_VERSION.bind!=	\
	${ECHO} 'vers ' && /usr/sbin/named -v | ${SED} -n 's/^BIND //p'
.  endif
.endif
MAKEVARS+=	BUILTIN_VERSION.bind

###
### Determine if there is a built-in implementation of the package and
### set IS_BUILTIN.<pkg> appropriately ("yes" or "no").
###
.if !defined(IS_BUILTIN.bind)
IS_BUILTIN.bind=	no
.  if !empty(BUILTIN_VERSION.bind:Nvers) && \
      !empty(BUILTIN_LIB_FOUND.bind:M[yY][eE][sS])
IS_BUILTIN.bind=	yes
.  endif
.endif
MAKEVARS+=	IS_BUILTIN.bind

###
### If there is a built-in implementation, then set BUILTIN_PKG.<pkg> to
### a package name to represent the built-in package.
###
.if !defined(BUILTIN_PKG.bind) && \
    !empty(IS_BUILTIN.bind:M[yY][eE][sS])
BUILTIN_PKG.bind=	bind-${BUILTIN_VERSION.bind:Nvers}
.endif
MAKEVARS+=	BUILTIN_PKG.bind

###
### Determine whether we should use the built-in implementation if it
### exists, and set USE_BUILTIN.<pkg> appropriate ("yes" or "no").
###
.if !defined(USE_BUILTIN.bind)
.  if ${PREFER.bind} == "pkgsrc"
USE_BUILTIN.bind=	no
.  else
USE_BUILTIN.bind=	${IS_BUILTIN.bind}
.    if defined(BUILTIN_PKG.bind) && \
        !empty(IS_BUILTIN.bind:M[yY][eE][sS])
USE_BUILTIN.bind=	yes
.      for _dep_ in ${BUILDLINK_DEPENDS.bind}
.        if !empty(USE_BUILTIN.bind:M[yY][eE][sS])
USE_BUILTIN.bind!=							\
	if ${PKG_ADMIN} pmatch ${_dep_:Q} ${BUILTIN_PKG.bind:Q}; then	\
		${ECHO} yes;						\
	else								\
		${ECHO} no;						\
	fi
.        endif
.      endfor
.    endif
.  endif  # PREFER.bind
.endif
MAKEVARS+=	USE_BUILTIN.bind

###
### The section below only applies if we are not including this file
### solely to determine whether a built-in implementation exists.
###
CHECK_BUILTIN.bind?=   no
.if !empty(CHECK_BUILTIN.bind:M[nN][oO])

.  if !empty(USE_BUILTIN.bind:M[yY][eE][sS])
.    if !empty(BUILTIN_LIB_FOUND.bind:M[yY][eE][sS])
BUILDLINK_LDADD.bind?=	-lbind
.    endif
.  elif !empty(USE_BUILTIN.bind:M[nN][oO])
BUILDLINK_LDADD.bind?=	-lbind
.  endif

.endif	# CHECK_BUILTIN.bind
