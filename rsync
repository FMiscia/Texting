#RSYNC

#Synch everything: -a == recursive, preserve symlinks, permissions, owners, no
#hard links (it's heavy)
rsync -av source dest

#Exclude something
rsync -av --exclude={"folder1","file1"} source dest

#Ignore files that are newer on the receiver (-u)
rsync -avu source dest

#Synch remote
#rsync [OPTION...] [USER@]HOST:SRC... [DEST]
rsync -av francescomiscia@localhost:Documents/ ./Documents/

#Deletes the folders/files not in the source directory
rsync -av --delete source dest

#Progress bar -P and stats --stats
rsync -avP source dest

#Compress files: -z
rsync -avz source dest

#Sync based on checksum -c
rsync -avc source dest
