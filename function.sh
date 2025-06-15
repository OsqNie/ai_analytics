initialize () {
	local project_name="$1" 
	if [ -z "$project_name" ]
	then
		echo "Käyttö: initialize <projektin_nimi>"
		return 1
	fi
	mkdir -p "$project_name"
	cd "$project_name"
	mkdir -p src data out doc
	
	# Get the directory where this script is located
	local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	if [ -f "$script_dir/instructions.txt" ]
	then
		cp "$script_dir/instructions.txt" .
		echo "✓ Instructions.txt kopioitu"
	else
		echo "⚠ Varoitus: instructions.txt ei löytynyt script-hakemistosta"
	fi
	
	# Try to activate virtual environment if it exists
	if [ -f "$HOME/Coding/datascience/bin/activate" ]; then
		source "$HOME/Coding/datascience/bin/activate"
		echo "✓ Virtuaaliympäristö aktivoitu"
	else
		echo "ℹ Virtuaaliympäristöä ei löytynyt, jatka ilman sitä"
	fi
	
	echo "✓ Data Science -projekti '$project_name' luotu"
	echo "Nykyinen hakemisto: $(pwd)"
}
