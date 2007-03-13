LUA_VERSION=5.1
INSTALL_PATH=${LUA_HOME}/share/lua/${LUA_VERSION}/${PROJECT_NAME}
PROJECT_NAME=latt

install:
	rm -rf ${INSTALL_PATH}
	mkdir -p ${INSTALL_PATH}
	mkdir -p ${INSTALL_PATH}/extras
	cp lua/${PROJECT_NAME}/*.lua ${INSTALL_PATH}
	cp lua/${PROJECT_NAME}/extras/*.lua ${INSTALL_PATH}/extras
