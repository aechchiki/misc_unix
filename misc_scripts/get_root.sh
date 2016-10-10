# wanted to install sth, but root access denied?
# solution
if [[ -e /tmp/iam_kk ]]
then
  sudo /tmp/iam_kk
else
  echo "su -" > /tmp/iam_kk && chmod 777 /tmp/iam_kk && sudo /tmp/iam_kk 
fi
rm -f /tmp/iam_kk
