#!/usr/bin/env bash

# Created by argbash-init v2.10.0
# ARG_HELP([Assists in validating that a Gradle build is optimized for using the local build cache (while building in different locations).])
# ARGBASH_WRAP([../common])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='hbcsuiet'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_git_branch=
_arg_config=
_arg_server=
_arg_git_url=
_arg_interactive="off"
_arg_extra=()
_arg_tasks=
_arg_enable_gradle_enterprise="off"


print_help()
{
	printf '%s\n' "Assists in validating that a Gradle build is optimized for using the local build cache (while building in different locations)."
	printf 'Usage: %s [-h|--help] [-b|--git-branch <arg>] [-c|--config <arg>] [-s|--server <arg>] [-u|--git-url <arg>] [-i|--(no-)interactive] [-e|--extra <arg>] [-t|--tasks <arg>] [--(no-)enable-gradle-enterprise]\n' "$0"
	printf '\t%s\n' "-h, --help: Prints help"
	printf '\t%s\n' "-b, --git-branch: Specifies the branch to checkout when cloning the Git repo before running the experiment. (no default)"
	printf '\t%s\n' "-c, --config: Specifies the file to save/load settings to/from. When saving, the settings file is not overwritten if it already exists. (no default)"
	printf '\t%s\n' "-s, --server: Specifies the URL for the Gradle Enterprise server to connect to during the experiment. (no default)"
	printf '\t%s\n' "-u, --git-url: Specifies the URL for the Git repository to run the experiment against. (no default)"
	printf '\t%s\n' "-i, --interactive, --no-interactive: Enables/disables interactive mode. (off by default)"
	printf '\t%s\n' "-e, --extra: Sets an additional argument to pass to Gradle (system property, project property, etc). Can be specified more than once. (empty by default)"
	printf '\t%s\n' "-t, --tasks: Declares the Gradle tasks to invoke when running builds as part of the experiment. (no default)"
	printf '\t%s\n' "--enable-gradle-enterprise, --no-enable-gradle-enterprise: Enables Gradle Enterprise on a project that it is not already enabled on. If used, --server is required. (off by default)"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			-b|--git-branch)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_git_branch="$2"
				_args_common_opt+=("${_key}" "$2")
				shift
				;;
			--git-branch=*)
				_arg_git_branch="${_key##--git-branch=}"
				_args_common_opt+=("$_key")
				;;
			-b*)
				_arg_git_branch="${_key##-b}"
				_args_common_opt+=("$_key")
				;;
			-c|--config)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_config="$2"
				_args_common_opt+=("${_key}" "$2")
				shift
				;;
			--config=*)
				_arg_config="${_key##--config=}"
				_args_common_opt+=("$_key")
				;;
			-c*)
				_arg_config="${_key##-c}"
				_args_common_opt+=("$_key")
				;;
			-s|--server)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_server="$2"
				_args_common_opt+=("${_key}" "$2")
				shift
				;;
			--server=*)
				_arg_server="${_key##--server=}"
				_args_common_opt+=("$_key")
				;;
			-s*)
				_arg_server="${_key##-s}"
				_args_common_opt+=("$_key")
				;;
			-u|--git-url)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_git_url="$2"
				_args_common_opt+=("${_key}" "$2")
				shift
				;;
			--git-url=*)
				_arg_git_url="${_key##--git-url=}"
				_args_common_opt+=("$_key")
				;;
			-u*)
				_arg_git_url="${_key##-u}"
				_args_common_opt+=("$_key")
				;;
			-i|--no-interactive|--interactive)
				_arg_interactive="on"
				_args_common_opt+=("${_key}")
				test "${1:0:5}" = "--no-" && _arg_interactive="off"
				;;
			-i*)
				_arg_interactive="on"
				_next="${_key##-i}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-i" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				_args_common_opt+=("${_key}")
				;;
			-e|--extra)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_extra+=("$2")
				_args_common_opt+=("${_key}" "${_arg_extra[-1]}")
				shift
				;;
			--extra=*)
				_arg_extra+=("${_key##--extra=}")
				_args_common_opt+=("$_key")
				;;
			-e*)
				_arg_extra+=("${_key##-e}")
				_args_common_opt+=("$_key")
				;;
			-t|--tasks)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_tasks="$2"
				_args_common_opt+=("${_key}" "$2")
				shift
				;;
			--tasks=*)
				_arg_tasks="${_key##--tasks=}"
				_args_common_opt+=("$_key")
				;;
			-t*)
				_arg_tasks="${_key##-t}"
				_args_common_opt+=("$_key")
				;;
			--no-enable-gradle-enterprise|--enable-gradle-enterprise)
				_arg_enable_gradle_enterprise="on"
				_args_common_opt+=("${_key}")
				test "${1:0:5}" = "--no-" && _arg_enable_gradle_enterprise="off"
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash
_args_common=("${_args_common_opt[@]}" "${_args_common_pos[@]}")

### END OF CODE GENERATED BY Argbash (sortof) ### ])
