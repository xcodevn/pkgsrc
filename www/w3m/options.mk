# $NetBSD: options.mk,v 1.1 2005/06/02 18:24:18 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.w3m
PKG_SUPPORTED_OPTIONS=	w3m-lynx-key w3m-m17n w3m-unicode
PKG_SUGGESTED_OPTIONS=	w3m-m17n
PKG_OPTIONS_LEGACY_VARS+=	W3M_USE_LYNX_KEY:w3m-lynx-key
PKG_OPTIONS_LEGACY_VARS+=	W3M_USE_M17N:w3m-m17n
PKG_OPTIONS_LEGACY_VARS+=	W3M_USE_UNICODE:w3m-unicode

_W3M_SUPPORTED_IMAGELIBS=	w3m-image-gdk-pixbuf w3m-image-imlib	\
				w3m-image-imlib2
_W3M_IMAGELIB_DEFAULT=		w3m-image-gdk-pixbuf
.if ${_W3M_USE_IMAGE} == "YES"
PKG_SUPPORTED_OPTIONS+=		${_W3M_SUPPORTED_IMAGELIBS}
.endif

# Memo about W3m configuration:
#
#	* pkgsrc should export only user configurable build options that can't
#	  be configured at run-time.
#
#	* As of 0.5, W3m is moving from English/Japanese (localized model) to
#	  internationalized model.  The set of its options are not well refined
#	  nor tested yet.  These configuration should be revisited later.
#
#	* --enable-m17n enables multibyte encoding support, and
#	  --enable-unicode adds UTF-7/UTF-8 support.  W3m has a home-grown M17N
#	  library (libwc) instead of using libc's I18N functions, that means
#	  enabling M17N much increases the size of W3m binary.  Additionary W3m
#	  has a home-grown Unicode mapping table, which is huge too!
#

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mw3m-m17n)
CONFIGURE_ARGS+=	--enable-m17n
.else
CONFIGURE_ARGS+=	--disable-m17n
.endif

.if !empty(PKG_OPTIONS:Mw3m-unicode)
CONFIGURE_ARGS+=	--enable-unicode
.else
CONFIGURE_ARGS+=	--disable-unicode
.endif

.if !empty(PKG_OPTIONS:Mw3m-lynx-key)
CONFIGURE_ARGS+=	--enable-keymap=lynx
.else
CONFIGURE_ARGS+=	--enable-keymap=w3m
.endif

.if ${_W3M_USE_IMAGE} == "YES"
.  undef _W3M_IMAGELIB
.  for _imagelib in ${_W3M_SUPPORTED_IMAGELIBS}
.    if !empty(PKG_OPTIONS:M${_imagelib})
.      if !empty(_W3M_IMAGELIB)
PKG_FAIL_REASON+=	"Can't enable multiple image libraries."
.      endif
_W3M_IMAGELIB=		${_imagelib:C|^w3m-image-||}
.    endif
.  endfor

.  if !defined(_W3M_IMAGELIB)
_W3M_IMAGELIB=		${_W3M_IMAGELIB_DEFAULT:C|^w3m-image-||}
.  endif

USE_X11=		YES
CONFIGURE_ARGS+=	--enable-image=x11 --with-imagelib=${_W3M_IMAGELIB}
PLIST_SUBST+=		USE_IMAGE=''
.  include "../../graphics/${_W3M_IMAGELIB}/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-image
PLIST_SUBST+=		USE_IMAGE='@comment '
.endif
