RT_DISK=${HOME}/rt-disk

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$(whoami)" "$@"
_USER=$1

RT_DISK=/home/${_USER}/rt-disk

if [ ! -d "$RT_DISK" ]; then
	mkdir -p $RT_DISK
	chown ${_USER}:${_USER} ${RT_DISK}
fi

mount -t vfat sd.bin ${RT_DISK}

chown -R ${_USER}:${_USER} ${RT_DISK}
