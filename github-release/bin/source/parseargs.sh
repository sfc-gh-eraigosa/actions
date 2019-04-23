PARAMS=""
TESTING=0
while (( "$#" )); do
  case "$1" in
    -s|--set-version)
      VERSION=$2
      shift 2
      ;;
    -t|--test) # turns on a just testing flag
      TESTING=1
      shift
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

function require_option {
    if [[ -z ${!1} ]] && [[ ! -z "${_value}" ]]; then
      eval "export ${1}=${_value}"
    elif [[ -z ${!1} ]]; then
      echo "This test requires that $1 be configured via option : $3"
      exit 1
    fi
}
