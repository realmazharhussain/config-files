#!/bin/bash
echo "Rewriting /etc/fstab ..."
sudo cp -n /etc/fstab{,.original}

for name in '\/' '\/boot\/efi' swap
do
  line="$(grep -E "[[:space:]]$name[[:space:]]" /etc/fstab)"
  line="${line/\//\\\/}"
  sudo sed -E "/[[:space:]]$name[[:space:]]/c $line" -i /etc/fstab.example
done
sudo mv /etc/fstab{.example,}
