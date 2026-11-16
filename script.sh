for number in 1 2 3 4; do
    folder="Testcase$number"
    output_folder="${folder}Diff"

    rm -rf "$output_folder"

    for file1 in "$folder"/*.1.txt; do
        [ -f "$file1" ] || continue

        file2="{$file1%.1.txt}.2.txt"
        name="${file1##*/}"
        name="${name%.1.txt}"

        if ! cmp -s "$files1" "$file2"; then
            mkdir -p "$output_folder"
            diff -u "$file1" "$file2" > "$output_folder/${name}Diff.txt"
        fi
    done
done
