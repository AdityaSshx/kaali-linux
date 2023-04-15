if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/Selvan0/kaali-linux /kaali-linux
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone $UPSTREAM_REPO /kaali-linux
fi
cd /kaali-linux
pip3 install -U -r requirements.txt
echo "Bot Started...."
python3 bot.py

