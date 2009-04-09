include config

.PHONY: export install pack clean

export:
	cvs -d :ext:${DEVELOPER_NAME}@cvs.luaforge.net:/cvsroot/latt export \
		-r HEAD -d ${EXPORT_DIR}/latt-${VERSION} latt

install:
	rm -rf ${LUA_SHAREDIR}/latt
	mkdir -p ${LUA_SHAREDIR}
	cp -R ${EXPORT_DIR}/latt-${VERSION}/latt ${LUA_SHAREDIR}

pack:
	tar cvz -C ${EXPORT_DIR}/latt-${VERSION} -f \
		${EXPORT_DIR}/latt-${VERSION}.tar.gz latt examples

clean:
	rm -rf ${EXPORT_DIR}