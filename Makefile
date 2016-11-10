# $FreeBSD$

PORTNAME=	kde-emerge
PORTVERSION=	1
CATEGORIES=	ports-mgmt kde devel
DISTFILES=	# none

MAINTAINER=	6yearold@gmail.com
COMMENT=	Meta-port to build all emerge dependencies

LIB_DEPENDS=	libicui18n.so:devel/icu \
		libpcre.so:devel/pcre \
		libdbus-1.so:devel/dbus \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libpng.so:graphics/png \
		libxcb.so:x11/libxcb \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libxcb-render-util.so:x11/xcb-util-renderutil \
		libxcb-icccm.so:x11/xcb-util-wm \
		libxkbcommon.so:x11/libxkbcommon \
		libgpgme.so:security/gpgme

RUN_DEPENDS=	py35-sqlite3>=0:databases/py35-sqlite3 \
		inputproto>=0:x11/inputproto \
		bash:shells/bash \
		git:devel/git \
		cmake:devel/cmake \
		7za:archivers/p7zip \
		p5-URI>=0:net/p5-URI \
		python:lang/python \
		xkeyboard-config>=0:x11/xkeyboard-config \
		xorg-fonts>=0:x11-fonts/xorg-fonts

USES=			python:2,3.5,run execinfo gmake pkgconfig:run \
			gettext-tools:run gettext-runtime:run bison:run shared-mime-info
USE_GNOME=		glib20 libxslt
USE_RUBY=		yes
RUBY_NO_BUILD_DEPENDS=	yes
NO_BUILD=		yes

CONFLICTS=		qt5-*

PLIST_FILES=		bin/emerge-bootstrap

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/emerge-bootstrap   ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
