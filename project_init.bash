
# ------------------------ First Time Setup ------------------------
# (1) Please change the file headers in:
#    * Makefile
#    * src/main.c
#    * include/header.h
#
# (2) Please use your OWN libft (change the Makefile libft/% rule)
#
# (3) Please set your template project path:

template_path="/Users/nelyx/work/project_init"

# ------------------------ All done. Enjoy! ------------------------

# Show off first

W="\e[0m""\e[34;1m"
WR="\e[0m""\e[31;5m"
X="\e[0m"
G="\e[32m"
B="\e[34m"
Y="\e[33m"

printf $G"Starting a new project has never been simpler!\n"$X
printf $W"              , \n"
printf "     _,-'\\   /|   .    .    /\`. \n"
printf " _,-'     \\_/_|_  |\   |\`. /   \`._,--===--.__ \n"
printf "^       _/\"/  \" \ : \__|_ /.  ,'   :.  :. .  \`-._ \n"
printf "      "$WR"//"$W"  ^ "$WR"/7"$W"  t'\"\"    \"\`-._/ ,'\   :   :  :  . \`. \n"
printf "      "$WR"Y"$W"     "$WR"L/"$W"  )\         ]],'   \  :   :  :   :  \`. \n"
printf "      |        /  \`.n_n_n,','\_    \ ;   ;  ;   ;   _> \n"
printf "      |__    ,'     |  \\\`-'    \`-.__\_______.==---' \n"
printf "      //  \`\"\"\\      |   \\            \\ \n"
printf "     \|     |/      /    \            \\ \n"
printf "	           /     |             \`. \n"
printf "	          /      |               ^ \n"
printf "	         ^       | \n"
printf "                         ^ \n"$X

# Starting a new project has never been simpler!

if [ -z ${@} ]; then
	printf $G"Project name: \e[0m"
	read name
else
	name=$@
fi

upper_case_name=`echo $name | awk '{print toupper($0)}'`

# Project structure
mkdir $name
cd $name
printf $B"["$G"OK"$B"] Generating "$Y"src"$B" and "$Y"include"$B" folders\n"$X
cp -R $template_path/src .
cp -R $template_path/include .
sed -e 's/__PROJECT_NAME__/'"$name"'/g' src/main.c > .TMP \
	&& mv -f .TMP src/main.c
sed -e 's/__PROJECT_NAME__/'"$upper_case_name"'/g' include/header.h > .TMP \
	&& mv -f .TMP include/header.h
mv src/main.c src/$name.c
mv include/header.h include/$name.h

# Makefile
printf $B"["$G"OK"$B"] Generating "$Y"Makefile"$B"\n"$X
cp $template_path/Makefile .
sed -e 's/__PROJECT_NAME__/'"$name"'/g' Makefile > .TMP && mv -f .TMP Makefile

# .gitignore
printf $B"["$G"OK"$B"] Generating "$Y".gitignore"$B"\n"$X
cp $template_path/.gitignore .
sed -e 's/__PROJECT_NAME__/'"$name"'/g' .gitignore > .TMP && mv -f .TMP .gitignore

# Complete
printf $G"Project initialisation complete!\n"$X
