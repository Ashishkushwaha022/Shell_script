------------------------------------------------------------------------
UNIX shell script for archiving and compressing the files 
------------------------------------------------------------------------
function read_dir(){
	for file in 'ls $1'
	do
	if[[$file = 'archive']]
	then
		echo 'Do not read this folder:' $file
	elif [[$file ='seeds']]
		echo 'Dp not read this folder :' $file
	elif [[ -d $1"/"$file]]
	then
		read_dir $1"/"$file
	else
	zip_and_archive_file $1"/"$file
	fi
	
	echo ''
	echo ''
	done
}

function zip_and_archive_file(){
	for final_file in $1
		do
		echo 'Found File' ${final_file}
		gzip ${final_file}
		mv ${final_file}.gz ${archive_path}.
		echo 'Moved the file' ${final_file}" -Done"
		done
}
curpath='pwd'

target_path=$1
mail_cycle='date +%Y%m%d'

echo ${mail_cycle}
archive_path=${target_path}/archive/${mail_cycle}/
echo 'archive_path :' $archive_path

mkdir ${archive_path}

echo 'curpath' $curpath
echo 'target path' $target_path
echo 'archive_path' $archive_path
echo ''

if ["${curpath}/" != "$target_path"]; then
cd ${target_path}
fi

read_dir ${target_path}
