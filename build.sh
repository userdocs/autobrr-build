#!/usr/bin/env bash

github_url="https://github.com/autobrr/autobrr.git"

while (("${#}")); do
	case "${1}" in
		-b)
			bootstrap='yes'
			;;&
		-c)
			rm -rf ~/autobrr
			exit
			;;
		-g)
			[[ -z "${2}" ]] && exit 1
			github_url="https://github.com/${2}.git"
			shift 2
			;;&
		-d)
			rm -rf ~/autobrr
			;;&
		-m)
			usemake="yes"
			;;&
		--) # end argument parsing
			shift
			break
			;;
		*) # preserve positional arguments
			params1+=("${1}")
			shift
			;;
	esac
done

set -- "${params1[@]}" # Set positional arguments in their proper place.

if [[ ! -d ~/autobrr ]]; then
	git clone "${github_url}" ~/autobrr
else
	echo "folder already exists"
fi

if [[ "${bootstrap}" != yes && -d ~/autobrr ]]; then
	if [[ "${usemake}" == yes ]]; then
		cd ~/autobrr || exit 1
		make
	else
		cd ~/autobrr/web || exit 1
		yarn install
		yarn build
		cd ~/autobrr || exit 1
		goreleaser release --rm-dist --skip-publish --snapshot
	fi
fi
exit
