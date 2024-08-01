all: config.json balooProxy/Dockerfile

config.json: config.example.json
	jq ". * { proxy: \
		{ \
			adminsecret: \"$$(uuidgen)\", \
			apisecret: \"$$(uuidgen)\", \
			secrets: { \
				captcha: \"$$(uuidgen)\", \
				cookie: \"$$(uuidgen)\", \
				javascript: \"$$(uuidgen)\" \
			}, \
		} \
	}" -r ./config.example.json > config.json

balooProxy/Dockerfile:
	git submodule update