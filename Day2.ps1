# Day 2 - Part 1
$content = get-content ~/test.txt
$content -match '^(?<min>\d+)-(?<max>\d+) (?<letter>\w):\s(?<chars>.+)$'

$i = 0
$content | ForEach-Object {
    $_ -match '^(?<min>\d+)-(?<max>\d+) (?<letter>\w):\s(?<chars>.+)$' | Out-Null
    $check = $Matches.chars -replace ('[^{0}]' -f $Matches.letter)
    if ($check.length -ge $Matches.min -and $check.length -le $matches.max) {
        $i++
    }
}
$i

# Day 2 - Part 2
$content = get-content ~/test.txt

$i = 0
$content | ForEach-Object {
    $_ -match '^(?<min>\d+)-(?<max>\d+) (?<letter>\w):\s(?<chars>.+)$' | Out-Null
    if (($matches.letter -eq $matches.chars[$matches.min -1]) -xor
        ($matches.letter -eq $matches.chars[$matches.max -1])
    ) {
        $i++
    }
}
$i